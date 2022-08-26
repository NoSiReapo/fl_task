import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text("Список дел"),
          centerTitle: true,
        ),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.only(left: 110)),
            Column(
              children: [
                const Padding(padding: EdgeInsets.only(top:  300)),
                const Text("Главный экран", style: TextStyle(color: Colors.white)),
                Divider(height: 20,),
                ElevatedButton(onPressed: () {
                  Navigator.pushReplacementNamed(context, "/todo");
                }, child: const Text("Перейти далее"))
              ],
            )
          ],
        )
    );
  }
}
