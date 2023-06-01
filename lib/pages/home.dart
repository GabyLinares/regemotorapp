import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:regemotorapp/controllers/controller.dart';
import 'package:regemotorapp/pages/ajustes.dart';
import 'package:regemotorapp/pages/invent1.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller appController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/logo.png', // Ruta de la imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
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
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF575353),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: IconButton(
                                iconSize: 30.0,
                                color: Color(0xFFC7E9B0),
                                icon: Icon(Icons.inventory),
                                onPressed: () {
                                  Get.to(() => Invent1());
                                },
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Consulta',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF575353),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: IconButton(
                                iconSize: 30.0,
                                color: Color(0xFFC7E9B0),
                                icon: Icon(Icons.message),
                                onPressed: () {
                                  // Acción del botón de mensajes
                                },
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Mensajes',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              height: 120.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Color(0xFF575353),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: IconButton(
                                iconSize: 30.0,
                                color: Color(0xFFC7E9B0),
                                icon: Icon(Icons.notifications),
                                onPressed: () {
                                  // Acción del botón de notificaciones
                                },
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Notificaciones',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                Get.to(() => Ajustes());
              },
            ),
          ],
        ),
      ),
    );
  }
}
