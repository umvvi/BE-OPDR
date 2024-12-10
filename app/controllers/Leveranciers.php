<?php

class Leveranciers extends BaseController {
    private $leverancierModel;

    public function __construct() {
        $this->leverancierModel = $this->model('Leverancier');
    }

    public function index() {
        $leveranciers = $this->leverancierModel->getLeveranciers();
        $data = [
            'leveranciers' => $leveranciers
        ];
        $this->view('leveranciers/index', $data);
    }

    public function show($id) {
        $leverancier = $this->leverancierModel->getLeverancierById($id);
        if (!$leverancier) {
            die('Leverancier niet gevonden');
        }
        $producten = $this->leverancierModel->getProductenByLeverancierId($id);
        $data = [
            'leverancier' => $leverancier,
            'producten' => $producten
        ];
        $this->view('leveranciers/show', $data);
    }

    public function addDelivery($leverancierId, $productId) {
        $leverancier = $this->leverancierModel->getLeverancierById($leverancierId);
        $product = $this->leverancierModel->getProductById($productId);
        if (!$leverancier || !$product) {
            die('Leverancier of product niet gevonden');
        }

        // Verwijder de controle op IsActief hier
        $data = [
            'leverancier' => $leverancier,
            'product' => $product
        ];
        $this->view('leveranciers/addDelivery', $data);
    }

    public function saveDelivery() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // Sanitize POST data
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $data = [
                'leverancier_id' => trim($_POST['leverancier_id']),
                'product_id' => trim($_POST['product_id']),
                'aantal' => trim($_POST['aantal']),
                'datum_eerstvolgende_levering' => trim($_POST['datum_eerstvolgende_levering'])
            ];

            // Haal het product op om de IsActief status te controleren
            $product = $this->leverancierModel->getProductById($data['product_id']);
            if (!$product->IsActief) {
                $data['leverancier'] = $this->leverancierModel->getLeverancierById($data['leverancier_id']);
                $data['product'] = $product;
                $data['error'] = 'Het product ' . $product->Naam . ' van de leverancier ' . $data['leverancier']->Naam . ' wordt niet meer geproduceerd';
                $this->view('leveranciers/addDelivery', $data);
                return;
            }

            if ($this->leverancierModel->addProductDelivery($data)) {
                header('location: ' . URLROOT . '/leveranciers/show/' . $data['leverancier_id']);
            } else {
                die('Er is iets misgegaan.');
            }
        } else {
            header('location: ' . URLROOT . '/leveranciers');
        }
    }
}