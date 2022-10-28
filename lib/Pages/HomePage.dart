import 'package:flutter/material.dart';
import 'package:prjct2/Pages/SecondPage.dart';
import 'package:prjct2/models/ToDos/ToDoCard.dart';

import '../models/ToDos/ToDo.dart';
import '../models/players/Player.dart';

import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title, required this.aham});

  final String title;
  bool aham;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ToDo>? _toDos;
  Player player = Player('SAasdfdgf', '110');

  @override
  void initState() {
    super.initState();
    getToDos();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  Future<void> getToDos() async {
    _toDos = await ToDo.getToDo();
    setState(() {
      //print(_toDos);
    });
  }

  void cleanUp() {
    setState(() {
      widget.aham = false;
    });
  }

  void alreadyClean() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            title: Text('Você já está limpo'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          widget.aham ? cleanUp() : alreadyClean();
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.clean_hands,
          color: Colors.red,
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Colors.amber,
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              fit: BoxFit.cover,
              image: widget.aham
                  ? const AssetImage(
                      'lib/images/2blood.png',
                    )
                  : const AssetImage(
                      'lib/images/black.png',
                    ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black),
                  height: 400,
                  width: 300,
                  child: ListView.builder(
                    itemBuilder: ((context, index) {
                      return ToDoCard(
                          title: _toDos == null
                              ? 'not found'
                              : _toDos![index].title,
                          id: _toDos == null ? 99999 : _toDos![index].id,
                          completed:
                              _toDos == null ? true : _toDos![index].completed);
                    }),
                    itemCount: _toDos?.length,
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber),
                    height: 70,
                    width: 300,
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondPage()),
                            );
                          },
                        ),
                        const Center(
                          child: Icon(Icons.warning_amber),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
