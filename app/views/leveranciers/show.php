<?php require_once APPROOT . '/views/includes/header.php'; ?>

<style>
    .btn-container {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        margin-top: 20px;
    }
</style>

<div class="container">
<div class="mb-5"></div>
    <h1>Geleverde producten</h1>
    <?php if ($data['leverancier']): ?>
        <p><strong>Naam leverancier:</strong> <?php echo $data['leverancier']->Naam; ?></p>
        <p><strong>Contactpersoon:</strong> <?php echo $data['leverancier']->ContactPersoon; ?></p>
        <p><strong>Leveranciernummer:</strong> <?php echo $data['leverancier']->LeverancierNummer; ?></p>
        <p><strong>Mobiel:</strong> <?php echo $data['leverancier']->Mobiel; ?></p>
    <?php else: ?>
        <p>Leverancier niet gevonden.</p>
    <?php endif; ?>

    <table class="table">
        <thead>
            <tr>
                <th>Naam product</th>
                <th>Aantal in magazijn</th>
                <th>Verpakkingsnelheid</th>
                <th>Laatste levering</th>
                <th>Nieuwe levering</th>
            </tr>
        </thead>
        <tbody>
            <?php if (empty($data['producten'])): ?>
                <tr>
                    <td colspan="5">Dit bedrijf heeft tot nu toe geen producten geleverd aan Jamin.</td>
                </tr>
                <script>
                    setTimeout(function() {
                        window.location.href = '<?= URLROOT; ?>/leveranciers';
                    }, 3000);
                </script>
            <?php else: ?>
                <?php foreach($data['producten'] as $product): ?>
                    <tr>
                        <td><?php echo $product->Naam; ?></td>
                        <td><?php echo $product->AantalAanwezig; ?></td>
                        <td><?php echo $product->VerpakkingsEenheid; ?></td>
                        <td><?php echo $product->DatumLevering; ?></td>
                        <td>
                            <a href="<?= URLROOT; ?>/leveranciers/addDelivery/<?= $data['leverancier']->Id; ?>/<?= $product->Id; ?>" class="btn btn-success"><i class="bi bi-plus"></i></a>
                        </td>
                    </tr>
                <?php endforeach; ?>
            <?php endif; ?>
        </tbody>
    </table>
    <div class="btn-container">
        <a href="<?= URLROOT; ?>/leveranciers" class="btn btn-secondary">Terug</a>
        <a href="<?= URLROOT; ?>" class="btn btn-primary">Naar de homepage</a>
    </div>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>