<?php require_once APPROOT . '/views/includes/header.php'; ?>

<style>
    .table-container {
        margin-bottom: 20px;
    }

    .btn-container {
        display: flex;
        justify-content: flex-end;
    }
</style>

<div class="container">
<div class="mb-5"></div>
    <h1>Overzicht leveranciers</h1>
    <div class="table-container">
        <table class="table">
            <thead>
                <tr>
                    <th>Naam</th>
                    <th>Contactpersoon</th>
                    <th>Leveranciernummer</th>
                    <th>Mobiel</th>
                    <th>Aantal verschillende producten</th>
                    <th>Toon producten</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach($data['leveranciers'] as $leverancier): ?>
                    <tr>
                        <td><?php echo $leverancier->Naam; ?></td>
                        <td><?php echo $leverancier->ContactPersoon; ?></td>
                        <td><?php echo $leverancier->LeverancierNummer; ?></td>
                        <td><?php echo $leverancier->Mobiel; ?></td>
                        <td><?php echo $leverancier->aantal_producten; ?></td>
                        <td><a href="<?= URLROOT; ?>/leveranciers/show/<?php echo $leverancier->Id; ?>" class="btn btn-primary"><i class="bi bi-box"></i></a></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
    <div class="btn-container">
        <a href="<?= URLROOT; ?>" class="btn btn-secondary">Terug naar de homepage</a>
    </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>