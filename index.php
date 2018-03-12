<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Parcial</title>
</head>
<body>

  <form class="" action="guardar.php" method="post">
    <div class="">
      <label for="">Año</label>
      <input type="text" name="anio" value="" id="anio">
    </div><br>

    <div class="" id="area">

    </div><br>

    <div class="" id="dependencia">
      <label for="">Dependencia</label>
      <input type="text" name="" value="">
    </div><br>

    <div class="" id="unidadO">
      <label for="">Unidad Organizacional</label>
      <input type="text" name="" value="">
    </div><br>

    <div class="" id="tipoga">
      <label for="">Tipo de Gasto</label>
      <input type="text" name="" value="">
    </div><br>

    <div class="" id="dtgi">
      <label for="">Detalle de gasto</label>
      <input type="text" name="" value="">
    </div><br>

    <div class="">
      <label for="">Monto S/</label>
      <input type="text" name="monto" value="">
    </div><br>

    <input type="submit" name="boton" value="Enviar">
  </form>

  <br><br>

  <table border="1">
    <tr>
      <th>Area</th>
      <th>Dependencia</th>
      <th>Unidad Organica</th>
      <th>Tipo de Gasto</th>
      <th>Detalle de Gasto</th>
      <th>Monto</th>
    </tr>

    <tbody id="show">

    </tbody>
  </table>

  <script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
  <script src="./scripts.js" charset="utf-8"></script>

</body>
</html>
