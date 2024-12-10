<?php

class Leverancier {
    private $db;

    public function __construct() {
        $this->db = new Database;
    }

    public function getLeveranciers() {
        $this->db->query('SELECT l.*, COUNT(ppl.Id) as aantal_producten 
                          FROM leverancier l 
                          LEFT JOIN productperleverancier ppl ON l.Id = ppl.LeverancierId 
                          GROUP BY l.Id 
                          ORDER BY aantal_producten DESC');
        return $this->db->resultSet();
    }

    public function getLeverancierById($id) {
        $this->db->query('SELECT * FROM leverancier WHERE Id = :id');
        $this->db->bind(':id', $id);
        return $this->db->single();
    }


    public function getProductenByLeverancierId($id) {
    $this->db->query('SELECT p.Id, p.Naam, ppl.Aantal, ppl.DatumLevering, ppl.DatumEerstVolgendeLevering, m.VerpakkingsEenheid, m.AantalAanwezig 
                      FROM product p 
                      LEFT JOIN productperleverancier ppl ON p.Id = ppl.ProductId 
                      LEFT JOIN magazijn m ON p.Id = m.ProductId
                      WHERE ppl.LeverancierId = :id 
                      ORDER BY ppl.Aantal DESC');
    $this->db->bind(':id', $id);
    return $this->db->resultSet();
    }



    public function getProductById($id) {
    $this->db->query('SELECT * FROM product WHERE Id = :id');
    $this->db->bind(':id', $id);
    return $this->db->single();
    }

    
    public function addProductDelivery($data) {
        // Voeg de nieuwe levering toe
        $this->db->query('INSERT INTO productperleverancier (LeverancierId, ProductId, Aantal, DatumEerstVolgendeLevering) 
                          VALUES (:leverancier_id, :product_id, :aantal, :datum_eerstvolgende_levering)');
        $this->db->bind(':leverancier_id', $data['leverancier_id']);
        $this->db->bind(':product_id', $data['product_id']);
        $this->db->bind(':aantal', $data['aantal']);
        $this->db->bind(':datum_eerstvolgende_levering', $data['datum_eerstvolgende_levering']);
    
        if ($this->db->execute()) {
            // Haal de bestaande hoeveelheid in het magazijn op
            $this->db->query('SELECT AantalAanwezig FROM magazijn WHERE ProductId = :product_id');
            $this->db->bind(':product_id', $data['product_id']);
            $existingAmount = $this->db->single()->AantalAanwezig;
    
            // Update de hoeveelheid in het magazijn
            $newAmount = $existingAmount + $data['aantal'];
            $this->db->query('UPDATE magazijn SET AantalAanwezig = :new_amount WHERE ProductId = :product_id');
            $this->db->bind(':new_amount', $newAmount);
            $this->db->bind(':product_id', $data['product_id']);
            $this->db->execute();
    
            // Update de datum van de laatste levering
            $this->db->query('UPDATE productperleverancier 
                              SET DatumLevering = :datum_levering 
                              WHERE LeverancierId = :leverancier_id 
                              AND ProductId = :product_id 
                              ORDER BY Id DESC LIMIT 1');
            $this->db->bind(':datum_levering', $data['datum_eerstvolgende_levering']);
            $this->db->bind(':leverancier_id', $data['leverancier_id']);
            $this->db->bind(':product_id', $data['product_id']);
            return $this->db->execute();
        } else {
            return false;
        }
    }
}