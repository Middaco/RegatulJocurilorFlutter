import 'dart:core';

class Player {
  //TODO: point to an empty avatar photo
  late String? playerAvatar;
  late String username;
  late Map<String, int>? gamesScores;

  Player({
    required this.username,
    this.playerAvatar,
    this.gamesScores
  });
}