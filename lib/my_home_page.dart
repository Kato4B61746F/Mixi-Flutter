import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// こちらが　MyHomePage
// StatefulWidget に関しても後で説明するよ！！！！！
class MyHomePage extends StatefulWidget {
  // title を受け取ってるね👀
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> getRepo() async {
    var url = Uri.https('api.github.com', 'users/Kato4B61746F/repos');
    var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final List response2 = jsonDecode(response.body); 
    print(response2[0]);
  }



  @override
  Widget build(BuildContext context) {
    // Scaffold は土台みたいな感じ（白紙みたいな）
    return Scaffold(
      // AppBar は上のヘッダー
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // Center で真ん中寄せ
      body: Center(
        // Column は [] の中身を縦に並べてくれる widget
        // Row で横になるよ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // 右下のプラスボタン（Floating Action Button と言います）
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getRepo();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
