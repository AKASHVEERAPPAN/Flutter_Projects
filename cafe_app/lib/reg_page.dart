import 'package:cafe_app/home_page.dart';
import 'package:flutter/material.dart';

class reg_page extends StatefulWidget {
  const reg_page({super.key});

  @override
  State<reg_page> createState() => _reg_pageState();
}

class _reg_pageState extends State<reg_page> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign up',style: TextStyle(fontSize:35,color:Colors.brown),),
            const SizedBox(height:5.0,),
            TextField(
              controller: username,
              decoration:InputDecoration(
                  hintText: 'Username',
                  suffixIcon: const Icon(Icons.person),
                  suffixIconColor: Colors.black38,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black38),
                  )),
            ),
            const SizedBox(height:5.0,),
            TextField(
              controller: password,
              decoration:InputDecoration(
                  hintText: 'Password',
                  suffixIcon: const Icon(Icons.lock),
                  suffixIconColor: Colors.black38,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black38),
                  )),
              obscureText: true,
            ),
            const SizedBox(height:5.0,),
            TextField(
              controller: confirm_password,
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: const Icon(Icons.recommend_outlined),
                  suffixIconColor: Colors.black38,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black38),
                  )),
              obscureText: true,
            ),
            const SizedBox(height:5.0,),
            TextField(
              controller: email,
              decoration:InputDecoration(
                  hintText: 'E-mail',
                  suffixIcon: const Icon(Icons.mail),
                  suffixIconColor: Colors.black38,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black38),
                  )),
              obscureText: true,
            ),
            const SizedBox(height:5.0,),
            TextField(
              controller:contact,
              decoration: InputDecoration(
                  hintText: 'Contact',
                  suffixIcon: const Icon(Icons.contacts),
                  suffixIconColor: Colors.black38,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.black38),
                  )),
              obscureText: true,
            ),
            const SizedBox(height:8.0,),
            ElevatedButton(
              onPressed:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const home_page()));
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color(0xFF81544F),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                minimumSize: const Size(150, 50),
            ),

              child: const Text('Sign up'),
            )
          ],
        ),
      ),
    );
  }
}
