import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/category_selector.dart';
import '../widgets/dice_widget.dart';
import '../models/game_model.dart';
import '../utils/score_calculator.dart';

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

  void selectCategory(String category) {
    int score = calculateScore(category, dice);
    setState(() {
      // Asignar el puntaje a la hoja del jugador actual
      players[currentPlayer].scoreSheet[category] = score;

      //Actualizar el puntaje total
      players[currentPlayer].totalScore;

      //Reiniciar el estado del turno
      awaitingCategorySelection = false;
      rollsLeft = 3;
      isLocked = [false, false, false, false, false];
      dice = [1, 2, 3, 4, 5];

      //Verificar si todos los jugadores completaron sus categorias
      bool gameOver = players.every(
        (player) =>
            player.scoreSheet.values.where((v) => v != null).length ==
            player.scoreSheet.length,
      );

      if (gameOver) {
        gameEnded = true;
      } else {
        // Cambiar al siguiente jugador solo si el juego no terminó
        currentPlayer = (currentPlayer + 1) % players.length;
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
              CategorySelector(
                categories: categories,
                scoreSheet: players[currentPlayer].scoreSheet,
                onSelectCategory: selectCategory,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
