int calculateScore(String category, List<int> dice) {
  Map<int, int> counts = {};
  for (var die in dice) {
    counts[die] = (counts[die] ?? 0) + 1; // Contar las ocurrencias
  }
  switch (category) {
    case 'Unos':
      return dice.where((d) => d == 1).fold(0, (a, b) => a + b);
    case 'Doses':
      return dice.where((d) => d == 2).fold(0, (a, b) => a + b);
    case 'Treses':
      return dice.where((d) => d == 3).fold(0, (a, b) => a + b);
    case 'Cuatros':
      return dice.where((d) => d == 4).fold(0, (a, b) => a + b);
    case 'Cincos':
      return dice.where((d) => d == 5).fold(0, (a, b) => a + b);
    case 'Seises':
      return dice.where((d) => d == 6).fold(0, (a, b) => a + b);
    case 'Escalera':
      var sorted = dice.toSet().toList()..sort();
      if ((sorted.length == 5 && sorted[0] == 1 && sorted[4] == 5) ||
          (sorted.length == 5 && sorted[0] == 2 && sorted[4] == 6))
        return 25;
      return 0;
    case 'Full':
      return counts.containsValue(3) && counts.containsValue(2) ? 30 : 0;
    case 'Poker':
      return counts.containsValue(4) ? 40 : 0;
    case 'Cacho':
      return counts.containsValue(5) ? 50 : 0;
    default:
      return 0;
  }
}
