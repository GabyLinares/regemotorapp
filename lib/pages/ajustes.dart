import 'package:flutter/material.dart';
import 'package:regemotorapp/controllers/controller.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:regemotorapp/pages/home.dart';
import 'package:regemotorapp/pages/iniciosesion.dart';

class Ajustes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller appController = Get.find();
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para acceder a la pantalla "Mi cuenta"
                  },
                  child: Text('Mi cuenta'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC7E9B0),
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para acceder a la pantalla "Privacidad"
                  },
                  child: Text('Privacidad'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC7E9B0),
                  )
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para acceder a la pantalla "Accesibilidad"
                  },
                  child: Text('Accesibilidad'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFC7E9B0),
                  )
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => Login());
                  },
                  child: Text('Cerrar sesión'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 233, 168, 164),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
