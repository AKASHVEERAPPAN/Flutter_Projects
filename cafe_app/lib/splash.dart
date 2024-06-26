import 'package:cafe_app/main.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    super.initState();
    navigate_to_home();
  }

  navigate_to_home() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const login()));
    //this the place to link main.dart function (stf widget login)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('images/5-removebg.png')),
            const Text(
              'Welcome',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.brown),
            ),
          ],
        ),
      ),
    ));
  }
}
