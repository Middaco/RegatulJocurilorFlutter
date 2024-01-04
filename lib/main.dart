import 'package:flutter/material.dart';
import 'package:regatul_jocurilor_flutter/home_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        name : 'home',
        path: '/',
        builder: (context, state) => HomePage()
      ),
      GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LogInPage()
      ),
      //GoRoute(
      //    name: 'table',
      //    path: '/Tables/:tableId',
          //builder: (context, state) => TablePage(tableId)
      //)
    ]
  );
  runApp(MaterialApp.router(
    routerConfig: router,
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
                    context.goNamed('home');
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

