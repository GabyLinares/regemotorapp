import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regemotorapp/controllers/controller.dart';
import 'package:regemotorapp/pages/home.dart';

class Invent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller appController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Cambia el color de fondo aquí
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        // Acción del botón de "Consulta"
                      },
                      child: Text('Consulta'),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Cambia el color de fondo aquí
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        // Acción del botón de "Compras"
                      },
                      child: Text('Compras'),
                    ),
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
