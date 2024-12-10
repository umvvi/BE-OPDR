<?php require_once APPROOT . '/views/includes/header.php'; ?>

<style>
    .form-group {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
    }

    .form-group label {
        width: 200px;
        font-weight: bold;
    }

    .form-group p, .form-group input {
        flex: 1;
    }

    .btn-container {
        display: flex;
        justify-content: space-between;
        margin-top: 20px;
    }

    .error {
        color: red;
        margin-bottom: 15px;
    }
</style>

<div class="container">
<div class="mb-5"></div>
    <h1>Levering Product</h1>
    <?php if (isset($data['error'])): ?>
        <div class="error"><?= $data['error']; ?></div>
        <script>
            // Redirect na 4 seconden
            setTimeout(function() {
                window.location.href = "<?= URLROOT; ?>/leveranciers/show/<?= $data['leverancier']->Id; ?>";
            }, 4000);
        </script>
    <?php endif; ?>
    <form action="<?= URLROOT; ?>/leveranciers/saveDelivery" method="post">
        <input type="hidden" name="leverancier_id" value="<?= $data['leverancier']->Id; ?>">
        <input type="hidden" name="product_id" value="<?= $data['product']->Id; ?>">

        <div class="form-group">
            <label for="product">Product:</label>
            <p id="product"><?= $data['product']->Naam; ?></p>
        </div>

        <div class="form-group">
            <label for="leverancier">Leverancier:</label>
            <p id="leverancier"><?= $data['leverancier']->Naam; ?></p>
        </div>

        <div class="form-group">
            <label for="contactpersoon">Contactpersoon:</label>
            <p id="contactpersoon"><?= $data['leverancier']->ContactPersoon; ?></p>
        </div>

        <div class="form-group">
            <label for="mobiel">Mobiel:</label>
            <p id="mobiel"><?= $data['leverancier']->Mobiel; ?></p>
        </div>

        <div class="form-group">
            <label for="aantal">Aantal producteenheden:</label>
            <input type="number" name="aantal" id="aantal" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="datum_eerstvolgende_levering">Datum eerstvolgende levering:</label>
            <input type="date" name="datum_eerstvolgende_levering" id="datum_eerstvolgende_levering" class="form-control" required>
        </div>

        <div class="btn-container">
            <button type="submit" class="btn btn-primary">Sla op</button>
            <div>
                <a href="<?= URLROOT; ?>/leveranciers/show/<?= $data['leverancier']->Id; ?>" class="btn btn-secondary">Terug</a>
                <a href="<?= URLROOT; ?>" class="btn btn-secondary">Naar de homepage</a>
            </div>
        </div>
    </form>
</div>

<?php require_once APPROOT . '/views/includes/footer.php'; ?>