import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _userToDo;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(["Помыть полы", "Выкинуть мусор", "Купить продукты"]);
  }

  void _menuOpen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Меню"),
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(left: 125)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 200)),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamedAndRemoveUntil(
                              context, "/", (route) => false);
                        },
                        child: const Text(
                          "На главную",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                    const Divider(
                      height: 15.0,
                    ),
                    //Text('        '),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamedAndRemoveUntil(
                            context, "/weather", (route) => true);
                      },
                      child: const Text(
                        'Погода',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Список дел"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: _menuOpen, icon: const Icon(Icons.menu_outlined))
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]),
            child: Card(
              child: ListTile(
                tileColor: Colors.grey[400],
                title: Text(todoList[index],
                    style: const TextStyle(color: Colors.black)),
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete_sweep,
                    color: Colors.deepOrange[700],
                  ),
                  onPressed: () {
                    setState() {
                      todoList.removeAt(index);
                    }
                  },
                ),
              ),
            ),
            onDismissed: (direction) {
              todoList.removeAt(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Добавить элемент"),
                content: TextField(
                  onChanged: (String value) {
                    _userToDo = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            todoList.add(_userToDo);
                          },
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Text("Добавить"))
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.deepOrange[400],
        ),
      ),
    );
  }
}
