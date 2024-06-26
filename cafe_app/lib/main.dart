import 'package:cafe_app/reg_page.dart';
import 'package:cafe_app/splash.dart';
import 'package:flutter/material.dart';
import 'package:cafe_app/home_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash()  //to add function of splash screen ,then the stf widget (login) is link in splash page.
    );
  }
}
class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = '';
  String validUsername = 'Akash';
  String validPassword = '123';
  void login() {
    String enteredUsername = username.text.trim();
    String enteredPassword = password.text.trim();
    if (enteredUsername == validUsername && enteredPassword == validPassword) {
      setState(() {
        errorMessage = '';
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const home_page()));
    } else {
      setState(() {
        errorMessage = 'Invalid username or password';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Login+',
                style: TextStyle(fontSize: 40, color:Colors.brown),
              ),
              const SizedBox(height: 60.0),
              TextField(
                controller: username,
                decoration:  InputDecoration(
                    hintText: 'Username',
                    suffixIcon:const  Icon(Icons.person),
                    suffixIconColor: Colors.black38,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.black38),
                    )),
              ),
              const SizedBox(height: 30.0),
              TextField(
                controller: password,
                decoration:  InputDecoration(
                    hintText: 'Password',
                    suffixIcon:const  Icon(Icons.lock),
                    suffixIconColor: Colors.black38,
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20),
                      borderSide:const  BorderSide(color: Colors.black38),
                    )),
                obscureText: true,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor:const  Color(0xFF81544F),
                  padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minimumSize:const  Size(150, 50),
                ),
                child: const Text('Login',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              const SizedBox(height: 10.0),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(height: 20,),
              InkWell(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have account ?"),
                    SizedBox(width: 5,),
                    Text('Sign Up',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.brown)),
                  ],
                ),
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const reg_page()));
                },
              )
            ],
          ),
        ),
    );
  }
}

