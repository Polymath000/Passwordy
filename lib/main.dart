import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const PasswordGenerator());
}

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  bool _includeUppercase = false;
  bool _includeNumbers = false;
  bool _includeSymbols = false;
  int _passwordLength = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const AppBar(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.amber,
                            )),
                        labelText: 'Your password will appear here',
                        labelStyle: const TextStyle(color: Colors.black),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Wrap(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Password Length: ',
                              style: TextStyle(fontSize: 16),
                            ),
                            DropdownButton<int>(
                              value: _passwordLength,
                              items: List.generate(20, (index) {
                                _passwordLength = index + 1;
                                return DropdownMenuItem<int>(
                                  onTap: () {
                                    setState(() {
                                      _passwordLength = index + 1;
                                    });
                                  },
                                  value: index + 1,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                );
                              }),
                              onChanged: (value) {},
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Uppercase:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Checkbox(
                              value: _includeUppercase,
                              onChanged: (value) {
                                setState(() {
                                  _includeUppercase = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Numbers:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Checkbox(
                              value: _includeNumbers,
                              onChanged: (value) {
                                setState(() {
                                  _includeNumbers = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Allow Symbols (!@#\$%^&*()+):',
                              style: TextStyle(fontSize: 16),
                            ),
                            Checkbox(
                              value: _includeSymbols,
                              onChanged: (value) {
                                setState(() {
                                  _includeSymbols = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Generate Password',
                        style: TextStyle(color: Color.fromARGB(255, 2, 66, 98)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: const Text(
        'Passwordy',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         theme: ThemeData(
//           primarySwatch: Colors.green,
//         ),
//         debugShowCheckedModeBanner: false,
//         home: PasswordGenerator());
//   }
// }

// class PasswordGenerator extends StatefulWidget {
//   @override
//   _PasswordGeneratorState createState() => _PasswordGeneratorState();
// }

// class _PasswordGeneratorState extends State<PasswordGenerator> {
//   String _password = '';
//   void _generatePassword() {
//     final random = Random();
//     final characters =
//         'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+';
//     String password = '';
//     for (int i = 0; i < 12; i++) {
//       password += characters[
//           random.nextInt(characters.length)];
//     }
//     setState(() {
//       _password = password;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Password Generator'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Your Password:',
//               style: TextStyle(fontSize: 18),
//             ),
//             Text(

//               _password,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20), // Vertical spacing
//             ElevatedButton(
//               onPressed:
//                   _generatePassword, // Call _generatePassword when button is pressed
//               child: Text('Generate Password'), // Button text
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
