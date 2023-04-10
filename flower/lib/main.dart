import 'package:flower/page/auto_scroll_page.dart';
import 'package:flower/page/blossom/blossom_flower.dart';
import 'package:flower/page/blossom/four.dart';
import 'package:flower/page/blossom/one.dart';
import 'package:flower/page/blossom/three.dart';
import 'package:flower/page/blossom/tree/new_tree.dart';
import 'package:flower/page/blossom/tree/tree.dart';
import 'package:flower/page/blossom/two.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ElevatedButton createButton(StatefulWidget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
      child: SizedBox(
        height: 20,
        width: 100,
        child: Center(
          child: Text(page.toString()),
        ),
      ),
    );
  }

  ElevatedButton createStatelessButton(StatelessWidget page) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(width: 1, color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => page,
          ),
        );
      },
      child: SizedBox(
        height: 20,
        width: 100,
        child: Center(
          child: Text(page.toString()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            createButton(ScrollablePage()),
            createButton(MoveBlossom()),
            createButton(MoveBlossom2()),
            createButton(MoveBlossom3()),
            createButton(MoveBlossom4()),
            createStatelessButton(MyTreePage()),
            createStatelessButton(MyTreePage2()),
            createStatelessButton(BlossomWidget()),
          ],
        ),
      ),
    );
  }
}
