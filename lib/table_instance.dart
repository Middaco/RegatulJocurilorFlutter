import 'dart:core';

class GameTable{
  late String nameOfTable;
  //a list of the paths that lead to some avatars
  late List<String> playerAvatars;
  late List<String> gamesPlayedAtThisTable;

  GameTable({required this.nameOfTable,
      required this.playerAvatars,
      required this.gamesPlayedAtThisTable});
}