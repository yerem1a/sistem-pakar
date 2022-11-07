   <!-- CSS only -->
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
   <?php
    include 'koneksi.php';
    if (isset($_POST['evidence'])) {
        if (count($_POST['evidence']) < 2) {
            echo "Pilih minimal 2 gejala";
        } else {
            $sql = "SELECT GROUP_CONCAT(b.code), a.cf
			FROM ds_rules a
			JOIN ds_problems b ON a.id_problem=b.id
			WHERE a.id_evidence IN(" . implode(',', $_POST['evidence']) . ") 
			GROUP BY a.id_evidence";
            $result = $db->query($sql);
            $evidence = array();
            while ($row = $result->fetch_row()) {
                $evidence[] = $row;
            }

            //--- menentukan environement
            $sql = "SELECT GROUP_CONCAT(code) FROM ds_problems";
            $result = $db->query($sql);
            $row = $result->fetch_row();
            $fod = $row[0];

            //--- menentukan nilai densitas
            $urutan = 1;
            $densitas_baru = array();
            while (!empty($evidence)) {

                $densitas1[0] = array_shift($evidence);
                $densitas1[1] = array($fod, 1 - $densitas1[0][1]);
                $densitas2 = array();
                if (empty($densitas_baru)) {
                    $densitas2[0] = array_shift($evidence);
                } else {
                    foreach ($densitas_baru as $k => $r) {
                        if ($k != "&theta;") {
                            $densitas2[] = array($k, $r);
                        }
                    }
                }
                $theta = 1;
                foreach ($densitas2 as $d) $theta -= $d[1];
                $densitas2[] = array($fod, $theta);
                $m = count($densitas2);
                $densitas_baru = array();
                for ($y = 0; $y < $m; $y++) {
                    for ($x = 0; $x < 2; $x++) {
                        if (!($y == $m - 1 && $x == 1)) {
                            $v = explode(',', $densitas1[$x][0]);
                            $w = explode(',', $densitas2[$y][0]);
                            sort($v);
                            sort($w);
                            $vw = array_intersect($v, $w);
                            if (empty($vw)) {
                                $k = "&theta;";
                            } else {
                                $k = implode(',', $vw);
                            }
                            if (!isset($densitas_baru[$k])) {
                                $densitas_baru[$k] = $densitas1[$x][1] * $densitas2[$y][1];
                            } else {
                                $densitas_baru[$k] += $densitas1[$x][1] * $densitas2[$y][1];
                            }
                        }
                    }
                }
                foreach ($densitas_baru as $k => $d) {
                    if ($k != "&theta;") {
                        $densitas_baru[$k] = $d / (1 - (isset($densitas_baru["&theta;"]) ? $densitas_baru["&theta;"] : 0));
                    }
                }
                echo "<br> Proses " . $urutan . " ";
                $urutan++;
                print_r($densitas_baru);
                echo "<hr>";
            }
            //--- perangkingan
            unset($densitas_baru["&theta;"]);
            arsort($densitas_baru);
            print_r($densitas_baru);

            //--- menampilkan hasil akhir
            $codes = array_keys($densitas_baru);
            $sql = "SELECT GROUP_CONCAT(name) 
	FROM ds_problems 
	WHERE code IN('{$codes[0]}')";
            $result = $db->query($sql);
            $row = $result->fetch_row();
            echo "<br><br><h2>Terdeteksi penyakit <b>{$row[0]}</b> dengan derajat kepercayaan " . round($densitas_baru[$codes[0]] * 100, 2) . "%<h2>";
        }
    }
    ?>
   <center>
       <a href="proses.php"> <button type="button" class="btn btn-primary btn-lg"> Diagnosa Lagi </button> </a>
   </center>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>