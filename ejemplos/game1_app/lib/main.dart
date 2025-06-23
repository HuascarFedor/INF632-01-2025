import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: TapTheBoxGame()));
}

class TapTheBoxGame extends FlameGame with TapDetector {
  late BoxComponent box;
  late TextComponent scoreText;
  int score = 0;
  final Random _random = Random();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    box =
        BoxComponent()
          ..position = _randomPosition()
          ..size = Vector2(100, 100);

    add(box);

    scoreText = TextComponent(
      text: 'Puntaje: 0',
      position: Vector2(10, 50),
      anchor: Anchor.topLeft,
      textRenderer: TextPaint(
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );

    add(scoreText);
  }

  @override
  void onTapDown(TapDownInfo info) {
    final touchPoint = info.eventPosition.global;
    if (box.toRect().contains(touchPoint.toOffset())) {
      score++;

      box.boxColor = Color(
        (Random().nextDouble() * 0xFFFFFF).toInt(),
      ).withAlpha(255);

      FlameAudio.play('tap.mp3');

      final newPosition = _randomPosition();
      box.add(
        MoveEffect.to(
          newPosition,
          EffectController(duration: 0.5, curve: Curves.easeInOut),
        ),
      );

      scoreText.text = 'Puntaje: $score';
    }
  }

  Vector2 _randomPosition() {
    final double x = _random.nextDouble() * (size.x - 100);
    final double y = _random.nextDouble() * (size.y - 100);
    return Vector2(x, y);
  }
}

class BoxComponent extends PositionComponent {
  Color boxColor = Colors.red;
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()..color = boxColor;
    canvas.drawRect(size.toRect(), paint);
  }
}
