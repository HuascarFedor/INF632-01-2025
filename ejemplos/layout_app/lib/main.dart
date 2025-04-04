import 'package:flutter/material.dart';
import 'package:layout_app/botones.dart';

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
      appBar: AppBar(title: const Text('Flutter Basics App')),
      body: const Center(child: Text('Hello, World!')),
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
                    backgroundImage: NetworkImage(
                      'https://scontent.flpb1-2.fna.fbcdn.net/v/t39.30808-6/484986321_3807430236177685_2055885470494513844_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=f727a1&_nc_ohc=ZY1PcTIK9_gQ7kNvgH4kDIu&_nc_oc=Adlahv1Gi4bzhDGfW6cVFmvHl7ohmInKD5MPcfDSCUxXotP-53A6nTMfY5gHsOYJN_Q&_nc_zt=23&_nc_ht=scontent.flpb1-2.fna&_nc_gid=1Ugz-w7iMcaaMcUuepmHwg&oh=00_AYHoplTeWmmjBf9SccVthLJ0-3-twnwA68IQYG0E2vTpgA&oe=67F0D4F6',
                    ),
                    /*
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.blue,
                    ),
                    */
                  ),
                  SizedBox(height: 10),
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
            ListTile(
              title: const Text('Botones Vertical'),
              leading: const Icon(Icons.square),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Botones()),
                );
              },
            ),
            ListTile(
              title: const Text('Botones Horizontal'),
              leading: const Icon(Icons.square),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Botones()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
