import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regemotorapp/controllers/controller.dart';
import 'package:regemotorapp/pages/home.dart';
import 'package:regemotorapp/pages/invent1.dart';

import 'ajustes.dart';

class Invent2 extends StatefulWidget {
  @override
  _Invent2State createState() => _Invent2State();
}

class _Invent2State extends State<Invent2> {
  final List<List<String>> datosTabla = [
    ['1', 'Proveedor 1', 'Producto 1', '10', '100'],
    ['2', 'Proveedor 2', 'Producto 2', '5', '50'],
    ['3', 'Proveedor 3', 'Producto 3', '3', '30'],
    ['4', 'Proveedor 1', 'Producto 4', '8', '80'],
    ['5', 'Proveedor 2', 'Producto 5', '2', '20'],
    ['6', 'Proveedor 3', 'Producto 6', '6', '60'],
  ];

  String categoriaSeleccionada = "";
  String consultaBusqueda = "";

  void seleccionarCategoria(String categoria) {
    setState(() {
      categoriaSeleccionada = categoria;
      consultaBusqueda = "";
    });
  }

  void actualizarConsultaBusqueda(String consulta) {
    setState(() {
      consultaBusqueda = consulta;
      categoriaSeleccionada = "";
    });
  }

  bool filaCoincideConConsultaBusqueda(List<String> fila) {
    String consultaEnMinusculas = consultaBusqueda.toLowerCase();
    for (String celda in fila) {
      if (celda.toLowerCase().contains(consultaEnMinusculas)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Controller appController = Get.find();

    List<TableRow> filasTablaFiltradas = [];

    List<List<String>> datosFiltrados = [];
    if (categoriaSeleccionada.isNotEmpty) {
      datosFiltrados = datosTabla.where((fila) => fila[1] == categoriaSeleccionada).toList();
    } else if (consultaBusqueda.isNotEmpty) {
      datosFiltrados = datosTabla.where(filaCoincideConConsultaBusqueda).toList();
    } else {
      datosFiltrados = datosTabla;
    }

    datosFiltrados.forEach((fila) {
      filasTablaFiltradas.add(
        TableRow(
          children: [
            TableCell(
              child: GestureDetector(
                onTap: () => seleccionarCategoria(fila[1]),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(fila[0]),
                ),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(fila[1]),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(fila[2]),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(fila[3]),
              ),
            ),
            TableCell(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(fila[4]),
              ),
            ),
          ],
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFC7E9B0),
    leading: IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Get.to(() => Invent1());
      },
    ),
  ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                Text(
                  'Inventario',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  onChanged: actualizarConsultaBusqueda,
                  decoration: InputDecoration(
                    labelText: 'Búsqueda por términos generales',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
                SizedBox(height: 16.0),
                Table(
                  border: TableBorder.all(),
                  columnWidths: {
                    0: FractionColumnWidth(0.1),
                    1: FractionColumnWidth(0.25),
                    2: FractionColumnWidth(0.25),
                    3: FractionColumnWidth(0.25),
                    4: FractionColumnWidth(0.16),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'ID',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Proveedor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Producto',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Cantidad',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Precio',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...filasTablaFiltradas,
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Color(0xFF575353),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Get.to(() => Home());
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                // Acción del botón de persona
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Get.to(() => Ajustes());
              },
            ),
          ],
        ),
      ),
    );
  }
}

