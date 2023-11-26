import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  HomePage({super.key});

  final listOfTables = <String>[];

  Widget buildTable(String givenString){
    return ListTile(
      title: Text(givenString),
      subtitle: const ListBody(
        children: <Widget>[
          Text("Carcassonne"),
          Text("Everdell"),
          Text("Stone Age")
        ],
      ),
    );
  }

  Widget buildListOfTables(BuildContext context){
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, item){
          return buildTable(listOfTables[item]);
        }

    );
  }

  @override
  Widget build(BuildContext context) {
    listOfTables.add("Table One");
    listOfTables.add("Table Two");
    listOfTables.add("Table Three");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: buildListOfTables(context),
    );
  }

}