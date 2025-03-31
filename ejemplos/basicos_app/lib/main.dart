import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Basics App'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Bienvenido',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    'Alvaro Rojas',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Inicio'),
              leading: const Icon(Icons.home),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to home
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Configuración'),
              leading: const Icon(Icons.settings),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to settings
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
