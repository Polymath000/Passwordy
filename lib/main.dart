import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(PasswordGenerator());
}

class PasswordGenerator extends StatefulWidget {
  PasswordGenerator({super.key});
  bool _includeUppercase = false;
  bool _includeNumbers = false;
  bool _includeSymbols = false;
  int _passwordLength = 10;
  String _password = 'Your Password Will Show Here';
  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  final TextEditingController _controller = TextEditingController();
  void _generatePassword() {
    final random = Random();
    String characters = 'abcdefghijklmnopqrstuvwxyz';
    if (widget._includeNumbers) {
      characters += '0123456789';
    }
    if (widget._includeSymbols) {
      characters += '!@#\$%^&*()_-+';
    }
    if (widget._includeUppercase) {
      characters += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    }
    String password = '';
    for (int i = 0; i < widget._passwordLength; i++) {
      password += characters[random.nextInt(characters.length)];
    }
    setState(() {
      widget._password = password;
    });
  }

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
                      controller: _controller,
                      enabled: true,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () async {
                            if (widget._password !=
                                'Your Password Will Show Here') {
                              await Clipboard.setData(
                                  ClipboardData(text: widget._password));
                            }
                          },
                          icon: const Icon(
                            Icons.copy,
                            color: Colors.amber,
                          ),
                        ),
                        labelText: widget._password,
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
                              value: widget._passwordLength,
                              items: List.generate(23, (index) {
                                return DropdownMenuItem<int>(
                                  value: index + 8,
                                  child: Text(
                                    '${index + 8}',
                                    style: const TextStyle(color: Colors.blue),
                                  ),
                                );
                              }),
                              onChanged: (value) {
                                setState(() {
                                  widget._passwordLength = value!;
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
                              'Uppercase:',
                              style: TextStyle(fontSize: 16),
                            ),
                            Checkbox(
                              value: widget._includeUppercase,
                              onChanged: (value) {
                                setState(() {
                                  widget._includeUppercase = value!;
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
                              value: widget._includeNumbers,
                              onChanged: (value) {
                                setState(() {
                                  widget._includeNumbers = value!;
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
                              'Allow Symbols (!@#\$%^&*()_-+):',
                              style: TextStyle(fontSize: 16),
                            ),
                            Checkbox(
                              value: widget._includeSymbols,
                              onChanged: (value) {
                                setState(() {
                                  widget._includeSymbols = value!;
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
                      onPressed: () {
                        _generatePassword();
                      },
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

class checkBox extends StatefulWidget {
  checkBox({super.key, this.include = false});
  bool include;
  @override
  State<checkBox> createState() => _checkBoxState();
}

class _checkBoxState extends State<checkBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: widget.include,
      onChanged: (value) {
        setState(() {
          widget.include = value!;
        });
      },
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
