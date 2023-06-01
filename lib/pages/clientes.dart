import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regemotorapp/controllers/controller.dart';
import 'package:regemotorapp/pages/home.dart';
import 'package:regemotorapp/pages/invent1.dart';

import 'ajustes.dart';

class Clientes extends StatefulWidget {
  @override
  _ClientesState createState() => _ClientesState();
}

class _ClientesState extends State<Clientes> {
  final List<List<String>> datosTabla = [
    ['1', 'John', 'Doe', 'john.doe@example.com', '1234567890'],
    ['2', 'Jane', 'Smith', 'jane.smith@example.com', '0987654321'],
    ['3', 'Alice', 'Johnson', 'alice.johnson@example.com', '9876543210'],
    ['4', 'Bob', 'Williams', 'bob.williams@example.com', '0123456789'],
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
      datosFiltrados =
          datosTabla.where((fila) => fila[1] == categoriaSeleccionada).toList();
    } else if (consultaBusqueda.isNotEmpty) {
      datosFiltrados =
          datosTabla.where(filaCoincideConConsultaBusqueda).toList();
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
                Row(
                  children: [
                    SizedBox(width: 8.0),
                    Text(
                      'Clientes',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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
                    1: FractionColumnWidth(0.2),
                    2: FractionColumnWidth(0.2),
                    3: FractionColumnWidth(0.3),
                    4: FractionColumnWidth(0.2),
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
                              'Nombre',
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
                              'Apellido',
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
                              'Correo',
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
                              'Documento',
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
                // Acción del botón de tuerca
              },
            ),
          ],
        ),
      ),
    );
  }
}