import 'package:flutter/material.dart';

class Botones extends StatelessWidget {
  const Botones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Buttons Vertical')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Elevated Button',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined Button'),
            ),
            SizedBox(height: 20),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
              tooltip: 'Add',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
