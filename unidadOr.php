<?php

  $var = $_POST["uor"];

  require_once './conexion.php';

  $sqlShow = "SELECT idunidad_org,uodescripcion FROM unidad_org WHERE  iddependencia = '".$var."' ";
  $resultShow = $conn->query($sqlShow);


  if ($resultShow -> num_rows > 0 ) {
  //foreach($resultShow as $row)
   while($rowShow = $resultShow->fetch_assoc()) {

     $show [] = array(
     'idunidad_org'=> $rowShow['idunidad_org'],
     'uodescripcion'=> $rowShow['uodescripcion'],
    );
   }
   $arr_json = json_encode($show);

   print_r($arr_json);
  }
  $conn->close();


 ?>
