import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromARGB(0, 233, 215, 215)));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF5A61F6),
              Color(0xFF8252F6),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    color: Color.fromARGB(255, 221, 24, 24).withOpacity(0.2),
                  ),
                  child: Icon(
                    Icons.music_note,
                    size: 64.0,
                    color: Color.fromARGB(255, 225, 52, 216),
                  ),
                ),
                SizedBox(height: 40.0),
                TextFormField(
                  controller: usernameController,
                  style: TextStyle(color: Color.fromARGB(255, 49, 9, 151)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 19, 208, 60).withOpacity(0.2),
                    labelText: 'Username',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 189, 198, 13)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Color.fromARGB(255, 37, 102, 206)),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 191, 24, 172).withOpacity(0.2),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Color.fromARGB(255, 206, 41, 151)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 32.0,
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromRGBO(216, 98, 237, 1)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
