<?php

    require_once './conexion.php';

    $anio = mysqli_real_escape_string($conn,(strip_tags($_POST["anio"],ENT_QUOTES))) ;
    $area = mysqli_real_escape_string($conn,(strip_tags($_POST["area"],ENT_QUOTES))) ;
    $dependencia = mysqli_real_escape_string($conn,(strip_tags($_POST["dependencia"],ENT_QUOTES))) ;
    $unidadO = mysqli_real_escape_string($conn,(strip_tags($_POST["unidadorganica"],ENT_QUOTES))) ;
    $tipogasto = mysqli_real_escape_string($conn,(strip_tags($_POST["tipogasto"],ENT_QUOTES))) ;
    $detallegasto = mysqli_real_escape_string($conn,(strip_tags($_POST["detallegasto"],ENT_QUOTES))) ;
    $monto = mysqli_real_escape_string($conn,(strip_tags($_POST["monto"],ENT_QUOTES))) ;


    $sqlAdd = "INSERT INTO presupuesto(iddetalle_gasto, iddependencia, idunidad_og, preanio, premonto) VALUES
    (".$detallegasto.", ".$dependencia.", ".$unidadO.", ".$anio.", ".$monto.")";


    $conn->autocommit(FALSE);
    try {

        $resPer = $conn->query($sqlAdd);

        if (!$resPer) {

          $errorsInsertCliente [] = "Error: La ejecución de la consulta falló debido a: \n";
          $errorsInsertCliente [] = "Query: " . $sqlAdd . "\n";

          $errorsInsertCliente [] = "Errno: " . $conn->errno . "\n";
          $errorsInsertCliente [] = "Error: " . $conn->error . "\n";

        } else {
          $conn->commit();
          $messagesInsertCliente [] = "Datos han sido insertados satisfactoriamente.";
        }

      } catch (Exception $ex) {

        $errorsInsertCliente [] = "Excepción capturada: ".$ex->getMessage()."\n";
        $conn->rollback();

      }
      $conn->close();

      header('Location: index.php');
?>
