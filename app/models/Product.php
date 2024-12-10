<?php

class Product {
    private $db;

    public function __construct() {
        $this->db = new Database;
    }

    public function getProductById($id) {
        $this->db->query('SELECT * FROM product WHERE Id = :id');
        $this->db->bind(':id', $id);
        return $this->db->single();
    }
}