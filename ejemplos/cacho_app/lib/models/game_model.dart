class Player {
  final String name;
  final Map<String, int?> scoreSheet;

  Player(this.name, List<String> categories)
    : scoreSheet = {for (var c in categories) c: null};

  int get totalScore =>
      scoreSheet.values.where((v) => v != null).fold(0, (a, b) => a + b!);
}
