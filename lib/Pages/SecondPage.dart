// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:prjct2/Pages/HomePage.dart';
import 'package:prjct2/models/lifeBar/LifeBar.dart';
import 'package:prjct2/models/players/Player.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  Player player1 = Player('Chuck', '82');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.red,
          title: Text('Tente matar o Rambo'),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton.small(
            backgroundColor: Colors.red,
            onPressed: (() {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          title: 'Bem vindo de volta',
                          aham: true,
                        )),
              );
            }),
            child: const Icon(Icons.run_circle_outlined)),
        body: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image(
                image: AssetImage('lib/images/2blood.png'),
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: SizedBox(
                height: 300,
                width: 300,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          height: 200,
                          width: 200,
                          child: Image(
                              image: NetworkImage(
                                  'https://mega.ibxk.com.br/2015/05/26/26151841082775.jpg')),
                        ),
                        LifeBar(player1.life),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          player1.takeDamage(player1);
                          print('tapped');
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
