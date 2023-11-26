import 'package:flutter/material.dart';
import 'package:regatul_jocurilor_flutter/home_page.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: <String, WidgetBuilder>{
      '/login' : (BuildContext context) => const LogInPage(),
      '/' : (BuildContext context) => HomePage()
    },
  ));
}

class LogInPage extends StatelessWidget{
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Username'
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password'
                )
            )
          ),

        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('Log In'),
                ),
              ],
          ))
          ]
        ),
      )
    );
  }

}

