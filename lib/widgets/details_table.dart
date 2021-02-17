import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowHeight: 35,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Sala',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 15
              ),
            ),
          ),
          DataColumn(
            label: Text(
              'Ar Esq.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Ar Dir.',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Watts',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Ampere',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Voltagem',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('01')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('68kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('02')),
              DataCell(Text('On')),
              DataCell(Text('On')),
              DataCell(Text('55kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('03')),
              DataCell(Text('Off')),
              DataCell(Text('Off')),
              DataCell(Text('21kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('04')),
              DataCell(Text('On')),
              DataCell(Text('Off')),
              DataCell(Text('33kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('05')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('42kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('06')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('38kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
           DataRow(
            cells: <DataCell>[
              DataCell(Text('07')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('68kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('08')),
              DataCell(Text('On')),
              DataCell(Text('On')),
              DataCell(Text('55kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('09')),
              DataCell(Text('Off')),
              DataCell(Text('Off')),
              DataCell(Text('21kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('10')),
              DataCell(Text('On')),
              DataCell(Text('Off')),
              DataCell(Text('33kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('11')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('42kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('12')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('38kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('13')),
              DataCell(Text('On')),
              DataCell(Text('Off')),
              DataCell(Text('33kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('14')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('42kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('15')),
              DataCell(Text('Off')),
              DataCell(Text('On')),
              DataCell(Text('38kWh')),
              DataCell(Text('2.2A')),
              DataCell(Text('120V')),
            ],
          ),
        ],
      ),
    );
  }
}