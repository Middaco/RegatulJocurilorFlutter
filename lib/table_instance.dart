import 'dart:core';
import 'player_instance.dart';

class GameTable{
  late String nameOfTable;
  //a list of the paths that lead to some avatars
  late List<String> gamesPlayedAtThisTable;
  late List<Player> listOfPlayersAtThisTable;

  GameTable({required this.nameOfTable,
      required this.listOfPlayersAtThisTable,
      required this.gamesPlayedAtThisTable});

  List<String> getPlayersAvatars(){
    return listOfPlayersAtThisTable
        .map((player) => player.playerAvatar as String)
        .toList();
  }
}
