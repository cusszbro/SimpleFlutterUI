import 'package:flutter/material.dart';
import 'package:submission_beginner/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Step into the cinema of your dreams.',
                    style: TextStyle(
                      fontSize: isMobile ? 30.0 : 40.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isMobile ? 20.0 : 40.0),
                  TextField(
                    controller: _controllerUsername,
                    decoration: const InputDecoration(
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: isMobile ? 16.0 : 32.0),
                  TextField(
                    controller: _controllerPassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: isMobile ? 32.0 : 64.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_controllerUsername.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return FractionallySizedBox(
                              widthFactor: 0.8,
                              heightFactor: 0.4,// Adjust this value as needed for different sizes
                              child: AlertDialog(
                                content: const Center(
                                  child: Text(
                                    'Sorry, please fill the Username',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Close the dialog when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else if (_controllerPassword.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return FractionallySizedBox(
                              widthFactor: 0.8,
                              heightFactor: 0.4,// Adjust this value as needed for different sizes
                              child: AlertDialog(
                                content: const Center(
                                  child: Text(
                                    'Sorry, please fill the Password',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      // Close the dialog when the "Close" button is pressed
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return MainPage(name: _controllerUsername.text);
                        }));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


