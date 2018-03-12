
<?php

  require_once './conexion.php';

  $sqlShow = "SELECT idtipo_gasto, tgdescripcion FROM tipo_gasto";
  $resultShow = $conn->query($sqlShow);


  if ($resultShow -> num_rows > 0 ) {
  //foreach($resultShow as $row)
   while($rowShow = $resultShow->fetch_assoc()) {

     $show [] = array(
     'idtipo_gasto'=> $rowShow['idtipo_gasto'],
     'tgdescripcion'=> $rowShow['tgdescripcion'],
    );
   }
   $arr_json = json_encode($show);

   print_r($arr_json);
  }
  $conn->close();


 ?>
