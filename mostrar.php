

<?php

  require_once './conexion.php';

  $sqlShow = "SELECT  a.areadescripcion as area, d.dpdescripcion as dependencia, uo.uodescripcion as unidad_organica,tp.tgdescripcion as tipo_gasto, dt.dgdescripcion as detalle_gasto , p.premonto as monto
  FROM presupuesto p, area a, detalle_gasto dt, unidad_org uo, dependencia d, tipo_gasto tp
  WHERE uo.idunidad_org = p.idunidad_og && dt.iddetalle_gasto = p.iddetalle_gasto && p.iddependencia = d.iddependencia && tp.idtipo_gasto = dt.idtipo_gasto && a.idarea = d.idarea";
  $resultShow = $conn->query($sqlShow);


  if ($resultShow -> num_rows > 0 ) {
  //foreach($resultShow as $row)
   while($rowShow = $resultShow->fetch_assoc()) {

     $show [] = array(
     'area'=> $rowShow['area'],
     'dependencia'=> $rowShow['dependencia'],
     'unidad_organica'=> $rowShow['unidad_organica'],
     'tipo_gasto'=> $rowShow['tipo_gasto'],
     'detalle_gasto'=> $rowShow['detalle_gasto'],
     'monto'=> $rowShow['monto'],
    );
   }
   $arr_json = json_encode($show);

   print_r($arr_json);
  }
  $conn->close();


 ?>
