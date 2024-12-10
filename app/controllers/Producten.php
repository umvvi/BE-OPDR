<?php

class Producten extends BaseController
{
    public function index()
    {
        $data = [
            'title' => 'Overzicht producten Jamin'
        ];

        $this->view('producten/index', $data);
    }
}