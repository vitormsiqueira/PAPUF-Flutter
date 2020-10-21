import 'package:flutter/material.dart';

final DateTime dateNow = DateTime.now();
int calculoDeConsumoMes(snapshotSala, String ar_l_ou_r) {
  var consumo = snapshotSala.data[ar_l_ou_r]['consumo'];
  var diasMes = consumo[dateNow.year.toString()][dateNow.month.toString()];
  List<int> consumoDeCadaDia = criaListaComConsumoSomadoDeCadaDia(diasMes);
  int somaDoMes = 0;
  for (int dia in consumoDeCadaDia) {
    somaDoMes += dia;
  }
  return somaDoMes;
}

List<int> criaListaComConsumoSomadoDeCadaDia(diasMes) {
  //soma todos os cunsumos de cada dia em uma lista com os dias existentes no bd
  //e o consumo diario.   Retorna uma lista com cada consumo
  List<int> somaGastosDiaADiaTodoOMes = [];

  for (var dia in diasMes.keys) {
    //percorre cada dia do mes listado no bd .keys(é uma lista string de cada dia)
    int somaDoDia = 0;
    for (int consumoHora in diasMes[dia]) {
      //percorre cada consumo registrado no dia e soma
      somaDoDia += consumoHora;
    }
    somaGastosDiaADiaTodoOMes
        .add(somaDoDia); //adicionaesse consumo na lista do mes
  }
  return somaGastosDiaADiaTodoOMes;
}

Widget cardsDashboard(context, altura, label, info) {
  return Card(
    elevation: 5,
    child: Container(
      padding: EdgeInsets.all(20),
      //height: altura,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            info,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                // fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ],
      ),
    ),
    color: Colors.white,
  );
}
