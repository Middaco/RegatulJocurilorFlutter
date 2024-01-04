import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:regatul_jocurilor_flutter/player_instance.dart';
import 'table_instance.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});

  var listOfTables = <GameTable>[];

  Widget buildTable(BuildContext context, GameTable currentGameTable){
    List<InlineSpan> gameBoardsSpan = 
      currentGameTable.gamesPlayedAtThisTable.map(
            (gameBoard) => TextSpan(text: '$gameBoard\n')
      ).toList();
    if (gameBoardsSpan.length > 3){
      final numberOfLeftoverBoardGames = gameBoardsSpan.length - 2;
      gameBoardsSpan.removeRange(2, gameBoardsSpan.length);
      gameBoardsSpan.add(TextSpan(text: '+$numberOfLeftoverBoardGames more games'));
    }
    return ListTile(
      //onTap: (){
      //  context.goNamed('table', pathParameters: {'tableId' : currentGameTable.nameOfTable});
      //},
      leading: ImageGroup(
          images: currentGameTable.getPlayersAvatars()
      ),
      title: Text(currentGameTable.nameOfTable),
      subtitle: RichText(
        text: TextSpan(
          children: gameBoardsSpan
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              //TODO: delete this table
            },
            child: const Icon(Icons.delete)
          ),
          GestureDetector(
            onTap: (){
              //TODO: update this table
            },
            child: const Icon(Icons.update)
          )
        ],
      ),
    );
    
  }

  Widget buildListOfTables(BuildContext context){
    return ListView.builder(
        itemCount: listOfTables.length,
        itemBuilder: (context, item){
          return buildTable(context, listOfTables[item]);
        }
    );
  }

  void initializeListOfGameTables(){
    listOfTables.add(
        GameTable(
            nameOfTable: "Table 1",
            listOfPlayersAtThisTable: List<Player>.of(
              [
                Player(
                    username: "Player1",
                    playerAvatar: "avatar_images/avatar1.png",
                    gamesScores: {}
                ),
                Player(
                    username: "Player2",
                    playerAvatar: "avatar_images/avatar2.png",
                    gamesScores: {}
                )
              ]
            ),
            gamesPlayedAtThisTable: List<String>.of(
              [
                "Carcassonne",
                "Catan"
              ]
            ))
    );
    listOfTables.add(
      GameTable(
          nameOfTable: "Table 2",
          listOfPlayersAtThisTable: List<Player>.of(
            [
              Player(
                  username: "Player1",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player2",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player3",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player4",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              )
            ]
          ),
          gamesPlayedAtThisTable: List<String>.of(
            [
              "Everdell",
              "Exploding Kittens",
              "Secret Hittler"
            ]
          ))
    );
    listOfTables.add(
      GameTable(
          nameOfTable: "Table 3",
          listOfPlayersAtThisTable: List<Player>.of(
            [
              Player(
                  username: "Player1",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player2",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player3",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player4",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player5",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              ),
              Player(
                  username: "Player6",
                  playerAvatar: "avatar_images/avatar2.png",
                  gamesScores: {}
              )
            ]
          ),
          gamesPlayedAtThisTable: List<String>.of(
              [
                "Everdell",
                "Exploding Kittens",
                "Secret Hittler",
                "Carcassonne",
                "Catan",
                "Shogun no Katana"
              ]
      ))
    );
  }

  void initializeListOfGameTablesJSon(){
    String jsonString = (rootBundle.loadString('game_table_instances.json')).toString();
    listOfTables = jsonDecode(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    initializeListOfGameTables();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: buildListOfTables(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {

        },
      ),

    );
  }

}

class ImageGroup extends StatelessWidget{
  final List<String> images;

  ImageGroup({required this.images});

  @override
  Widget build(BuildContext context) {
    if (images.length > 4){
      images.removeRange(3, images.length);
      images.add("avatar_images/circle.png");
    }
    return SizedBox.square(
      dimension: 40.0,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 2.0
          ),
          itemCount: images.length,
          itemBuilder: (context, index){
            return GridTile(
                child: Image.asset(
                  images[index],
                  fit:BoxFit.cover
                )
            );
          }
      )
    );
  }

}