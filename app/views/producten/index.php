<?php require_once APPROOT . '/views/includes/header.php'; ?>

<div class="container">
<div class="mb-5"></div>
    <div class="row mt-3">
        <div class="col-2"></div>
        <div class="col-8">
            <h3><?php echo $data['title']; ?></h3>
            <!-- Inhoud van het overzicht producten Jamin -->
            <a href="<?= URLROOT; ?>/leveranciers/index">Overzicht leveranciers</a> <!-- Nieuwe link toegevoegd -->
        </div>
        <div class="col-2"></div>
    </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>