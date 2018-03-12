
<?php

  $var = $_POST["depend"];

  require_once './conexion.php';

  $sqlShow = "SELECT iddependencia, dpdescripcion FROM dependencia WHERE idarea = '".$var."' ";
  $resultShow = $conn->query($sqlShow);


  if ($resultShow -> num_rows > 0 ) {
  //foreach($resultShow as $row)
   while($rowShow = $resultShow->fetch_assoc()) {

     $show [] = array(
     'iddependencia'=> $rowShow['iddependencia'],
     'dpdescripcion'=> $rowShow['dpdescripcion'],
    );
   }
   $arr_json = json_encode($show);

   print_r($arr_json);
  }
  $conn->close();


 ?>
