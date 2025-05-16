import 'package:flutter/material.dart';

void main() {
  runApp(const PalindromoApp());
}

class PalindromoApp extends StatelessWidget {
  const PalindromoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Detector de Palíndromos',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PalindromoChecker(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PalindromoChecker extends StatefulWidget {
  const PalindromoChecker({super.key});

  @override
  State<PalindromoChecker> createState() => _PalindromoCheckerState();
}

class _PalindromoCheckerState extends State<PalindromoChecker> {
  bool _isPalindromo = false;
  String _resultado = '';
  final TextEditingController _controller = TextEditingController();

  void _verificarPalindromo() {
    String texto = _controller.text;
    String textoSinEspacios = texto.replaceAll(' ', '');
    String textoSinSimbolos = textoSinEspacios.replaceAll(
      RegExp(r'[^a-zA-Z0-9]'),
      '',
    );
    String textoInvertido = textoSinSimbolos.split('').reversed.join('');

    setState(() {
      _isPalindromo =
          textoSinSimbolos.toLowerCase() == textoInvertido.toLowerCase();
      _resultado = _isPalindromo ? 'Es un palíndromo' : 'No es un palíndromo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detector de Palindromos')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ingresa una palabra o frase',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _resultado = '';
                });
              },
              onSubmitted: (value) => _verificarPalindromo(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarPalindromo,
              child: const Text('Verificar'),
            ),
            const SizedBox(height: 20),
            Text(_resultado),
          ],
        ),
      ),
    );
  }
}
