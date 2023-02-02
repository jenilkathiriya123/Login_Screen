import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, 'sign');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.power_settings_new_sharp),
            ),
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: const Text("Home Screen"),
      ),
    );
  }
}
