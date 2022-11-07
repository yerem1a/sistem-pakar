<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>

<body>
    <div class="d-flex justify-content-center">
        <h1 justify-content-center>Sistem Pakar Penyakit Umum</h1>
    </div>

    <div class="d-flex justify-content-center" style="font-size: 20px;">
        <form method="post" action="hasil.php">
            <?php
            include 'koneksi.php';
            //-- menampilkan daftar gejala
            $sql = "SELECT * FROM ds_evidences";
            $result = $db->query($sql);
            while ($row = $result->fetch_object()) {
                echo "<input type='checkbox' name='evidence[]' value='{$row->id}'> {$row->code} {$row->name}<br>";
            }
            ?>
            <input type="submit" value="Diagnosa" class="btn btn-primary" style="margin-left:8%; margin-top:10px;">
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>


</body>

</html>