import 'package:flutter/material.dart';

import '../services/auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            AuthService().signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, '/checkScreen', (route) => false);
          },
          child: const Text('Logout', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}