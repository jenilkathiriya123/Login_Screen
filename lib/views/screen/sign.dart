import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Global.dart';


class sign extends StatefulWidget {
  const sign({Key? key}) : super(key: key);

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffc6f8ff),
                Color(0xff595cff),
              ],
            )),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: key,
              child: Column(
                children: [
                  SizedBox(height: 75),
                  FlutterLogo(size: 200),
                  SizedBox(
                    height: 150,
                  ),
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        Global.email2 = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Username";
                      }
                      return null;
                    },
                    enabled: true,
                    decoration: const InputDecoration(
                      hintText: "Username",
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    onSaved: (val) {
                      setState(() {
                        Global.confirmPass = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Password";
                      } 
                      return null;
                    },
                    enabled: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Color(0xffc6f8ff),
                          ),
                        ),
                        onPressed: () async {
                          if (key.currentState!.validate()) {
                            key.currentState!.save();
                            SharedPreferences  prefs = await SharedPreferences.getInstance();
                            prefs.setBool('issign', true);
                            Navigator.of(context).pushReplacementNamed('/');
                          }
                        },
                        child: Text(
                          "Sign in",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        const Text("Remember me Login"),
                        Checkbox(
                            value: Global.checkBoxVal,
                            onChanged: (value) {
                              setState(() {
                                Global.checkBoxVal = value!;
                              });
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
