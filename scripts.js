
$(document).ready(function(){

  let anio = new Date();
  $('#anio').attr("value",anio.getFullYear());
  showArea();
  showTipoGasto();
  mostrar();

});

function showArea () {
   $.ajax({
      type: "POST",
      url: "./area.php",
      beforeSend: function(objeto){
      },
      success: function(data){

          console.log(data);

          let array = JSON.parse(data);
          let out ="";
          let label = `
          <label for="">Área</label>
          <select id="oparea" name="area" onchange="showDependencia();">`;
          let labelx = "</select>";
          for (let i in array) {
            out+=`
                <option value="${array[i].idarea}">${array[i].areadescripcion}</option>
              `;
          }
          $("#area").html(label+out+labelx);
      }
    });
}

function showDependencia () {

  let select = document.getElementById("oparea");
  //let options=document.getElementsByTagName("option");
  let dep = select.value;
  console.log(dep);
  //console.log(options[select.value-1].innerHTML)
  $.ajax({
     type: "POST",
     url: "./dependencia.php",
     data:{depend:dep},
     success: function(data){

         console.log(data);

         let array = JSON.parse(data);
         let out ="";
         let label = `
         <label for="">Dependencia</label>
         <select class="" id="unidadOrga" name="dependencia" onchange="showUorga();">`;
         let labelx = "</select>";
         for (let i in array) {
           out+=`
               <option value="${array[i].iddependencia}">${array[i].dpdescripcion}</option>
             `;
         }
         $("#dependencia").html(label+out+labelx);
     }
   });
}

function showUorga () {

  let select = document.getElementById("unidadOrga");
  //let options=document.getElementsByTagName("option");
  let uo = select.value;
  console.log(uo);
  //console.log(options[select.value-1].innerHTML)
  $.ajax({
     type: "POST",
     url: "./unidadOr.php",
     data:{uor:uo},
     success: function(data){

         console.log(data);

         let array = JSON.parse(data);
         let out ="";
         let label = `
         <label for="">Unidad Organica</label>
         <select class="" id="" name="unidadorganica" onchange="">`;
         let labelx = "</select>";
         for (let i in array) {
           out+=`
               <option value="${array[i].idunidad_org}">${array[i].uodescripcion}</option>
             `;
         }
         $("#unidadO").html(label+out+labelx);
     }
   });
}

function showTipoGasto () {
   $.ajax({
      type: "POST",
      url: "./tipogasto.php",
      beforeSend: function(objeto){
      },
      success: function(data){

          console.log(data);

          let array = JSON.parse(data);
          let out ="";
          let label = `
          <label for="">Tipo Gasto</label>
          <select id="tipog" name="tipogasto" onchange="showDetalleGasto();">`;
          let labelx = "</select>";
          for (let i in array) {
            out+=`
                <option value="${array[i].idtipo_gasto}">${array[i].tgdescripcion}</option>
              `;
          }
          $("#tipoga").html(label+out+labelx);
      }
    });
}

function showDetalleGasto () {
  let select = document.getElementById("tipog");
  //let options=document.getElementsByTagName("option");
  let dt = select.value;
  console.log(dt);
  //console.log(options[select.value-1].innerHTML)
  $.ajax({
     type: "POST",
     url: "./detallegasto.php",
     data:{dtg:dt},
     success: function(data){

         console.log(data);

         let array = JSON.parse(data);
         let out ="";
         let label = `
         <label for="">Detalle Gasto</label>
         <select class="" id="" name="detallegasto" onchange="">`;
         let labelx = "</select>";
         for (let i in array) {
           out+=`
               <option value="${array[i].iddetalle_gasto}">${array[i].dgdescripcion}</option>
             `;
         }
         $("#dtgi").html(label+out+labelx);
     }
   });
}

function mostrar () {

  $.ajax({
      type: "POST",
      url: "./mostrar.php",
      success: function(data){

          console.log(data);

          let array = JSON.parse(data);
          let outac ="";
          let outad ="";
          let aca = 0;
          let ad = 0;

          for (let i in array) {

            if(array[i].area == 'Academico'){
              outac+=`
                <tr>

                <td class="center-align">${array[i].area}</td> -->
                <td class="center-align" >${array[i].dependencia}</td>
                <td class="center-align" >${array[i].unidad_organica}</td>
                <td class="center-align" >${array[i].tipo_gasto}</td>
                <td class="center-align" >${array[i].detalle_gasto}</td>
                <td class="center-align" >${parseFloat(array[i].monto).toFixed(2)}</td>
                </tr>
                `;
                aca += parseFloat(array[i].monto);
            }

            if(array[i].area == 'Administrativo'){
              outad+=`
                <tr>

                <td class="center-align">${array[i].area}</td> -->
                <td class="center-align" >${array[i].dependencia}</td>
                <td class="center-align" >${array[i].unidad_organica}</td>
                <td class="center-align" >${array[i].tipo_gasto}</td>
                <td class="center-align" >${array[i].detalle_gasto}</td>
                <td class="center-align" >${parseFloat(array[i].monto).toFixed(2)}</td>
                </tr>
                `;
                ad += parseFloat(array[i].monto);
            }


          }

          let xad = `<tr><td >Total Administrativo</td><td colspan="5" style="text-align: right">${ad}</td></tr>`;
          let xac = `<tr><td >Total Academico</td><td colspan="5" style="text-align: right">${aca}</td></tr>`;
          let total = `<tr><td >Total</td><td colspan="5" style="text-align: right">${ad+aca}</td></tr>`;

          $("#show").html(outac+xac+outad+xad+total);



      }
    });

}
