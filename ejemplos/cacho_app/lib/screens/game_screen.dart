import 'dart:math';

import 'package:cacho_app/widgets/dice_widget.dart';

import '../models/game_model.dart';
import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final List<String> categories = [
    'Unos',
    'Doses',
    'Treses',
    'Cuatros',
    'Cincos',
    'Seises',
    'Escalera',
    'Full',
    'Poker',
    'Cocho',
  ];

  late List<Player> players;
  int currentPlayer = 0;
  int rollsLeft = 3;
  bool awaitingCategorySelection = false;
  List<int> dice = [1, 2, 3, 4, 5];
  List<bool> isLocked = [false, false, false, false, false];
  bool gameEnded = false;

  @override
  void initState() {
    super.initState();
    players = [
      Player('Jugador 1', categories),
      Player('Jugador 1', categories),
    ];
  }

  void rollDice() {
    setState(() {
      final random = Random();
      dice = List.generate(
        5,
        (index) => isLocked[index] ? dice[index] : random.nextInt(6) + 1,
      );
      rollsLeft--;
      if (rollsLeft == 0) {
        awaitingCategorySelection = true;
      }
    });
  }

  void toggleLock(index) {
    setState(() {
      if (rollsLeft == 3) {
        return;
      }
      isLocked[index] = !isLocked[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Juego del cacho')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              DiceWidget(dice: dice, isLocked: isLocked, onTap: toggleLock),
              ElevatedButton(
                onPressed: rollDice,
                child: Text('Lanzar dados($rollsLeft intentos)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
