import 'package:flutter/material.dart';
import 'package:todo_app/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: todoStart()));
}

class todoStart extends StatefulWidget {
  const todoStart({super.key});

  @override
  State<todoStart> createState() => _todoStartState();
}

TextEditingController control = TextEditingController();

class _todoStartState extends State<todoStart> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(
        const Duration(seconds: 3), () {}); // Duration for the splash screen
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ToDo',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Each day do your best and go to the rest',
              style: GoogleFonts.acme(
                  textStyle: const TextStyle(
                      color: Colors.blue,
                      letterSpacing: .5,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            )
          ],
        ),
      ),
    );
  }
}
