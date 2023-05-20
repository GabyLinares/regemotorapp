import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regemotorapp/controllers/controller.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Controller appController = Get.find();
    // FALTA AGREGAR EL LOGO DE FONDO
    
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
                  'Bienvenido/a, {Nombre}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                // Contenido de la pantalla
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
              color: Color(0xFFC7E9B0),
              onPressed: () {
                // Acción del botón de casa
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
