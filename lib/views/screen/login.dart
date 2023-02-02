import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Global.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: key,
              child: Column(
                children: [
                  SizedBox(height: 100),
                  FlutterLogo(size: 200),
                  SizedBox(
                    height: 150,
                  ),
                  TextFormField(
                    controller: Global.emailController,
                    onChanged: (val) {
                      setState(() {
                        Global.email = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        Global.email = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Please Enter Email";
                      }
                      return null;
                    },
                    enabled: true,
                    decoration: const InputDecoration(
                      hintText: "E-mail",
                      hintStyle: TextStyle(color: Colors.white),
                      errorStyle: TextStyle(color: Colors.red),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      suffixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextFormField(
                    controller: Global.passwordController,
                    onChanged: (val) {
                      setState(() {
                        Global.pass = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        Global.pass = val;
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
                      suffixIcon: Icon(Icons.lock, color: Colors.white),
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
                            prefs.setBool('isLogin', true);
                            Navigator.of(context).pushNamed('sign');
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
