
<?php

  $var = $_POST["dtg"];

  require_once './conexion.php';

  $sqlShow = "SELECT iddetalle_gasto, dgdescripcion FROM detalle_gasto WHERE idtipo_gasto = '".$var."' ";
  $resultShow = $conn->query($sqlShow);


  if ($resultShow -> num_rows > 0 ) {
  //foreach($resultShow as $row)
   while($rowShow = $resultShow->fetch_assoc()) {

     $show [] = array(
     'iddetalle_gasto'=> $rowShow['iddetalle_gasto'],
     'dgdescripcion'=> $rowShow['dgdescripcion'],
    );
   }
   $arr_json = json_encode($show);

   print_r($arr_json);
  }
  $conn->close();


 ?>
