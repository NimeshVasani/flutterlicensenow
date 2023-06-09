import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlicensenow/SplashScreen.dart';
import 'package:flutterlicensenow/selectionScreen.dart';
import 'package:flutterlicensenow/db_helper.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DBHelper();

  @override
  void initState() {
    dbHelper.db;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("RTO Preparation app"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Container(
              width: 200,
              height: 200,
              alignment: Alignment.center,
              child: Image.asset('assets/images/rto_main_back.png'),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 80,
                child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          side: BorderSide(color: Colors.red)))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SelectionScreen(language: "Gujarati");
                    }));
                  },
                  child: const Text(
                    "Gujarati",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: 200,
                height: 80,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(150)),
                child: ElevatedButton(
                  clipBehavior: Clip.hardEdge,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const SelectionScreen(language: "English");
                    }));
                  },
                  style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ))),
                  child: const Text(
                    "English",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 30, right: 30.0),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    child: Image.asset('assets/images/share.png')),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white)),
                    child: Image.asset('assets/images/rate.png')),
              ],
            ),
          )
        ],
      ),
    );
  }

  onPressed() {
    print("object");
  }
}
