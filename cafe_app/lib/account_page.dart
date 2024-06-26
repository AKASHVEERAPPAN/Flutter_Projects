import 'dart:io';
import 'package:cafe_app/cart_page_coffee.dart';
import 'package:cafe_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  int selectedIndex = 2;
  XFile? image;
  ImagePicker picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text('Account',style: TextStyle(color: Colors.white),),
        backgroundColor:const Color(0xFF81544F),
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10,),
              Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  child: ClipOval(
                    child:  image == null ?  ColorFiltered(
                      colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.srcATop,),
                        child: Image.asset("images/account.png",)) : Image.file(File(image!.path),fit: BoxFit.cover,width: 400,height: 500,),
                  ),

                ),
                Positioned(
                  bottom: 0,
                  right: 10,
                  child: Container(
                      decoration:const  BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,

                      ),
                      padding:const  EdgeInsets.all(0),
                      child:IconButton(onPressed: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                width: 400,
                                height: 150,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          final img = await picker.pickImage(
                                              source: ImageSource.camera);
                                          setState(() {
                                            image = img;
                                            Navigator.pop(context);
                                          });
                                        },
                                        icon:const Icon(Icons.camera_alt)),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          final img = await picker.pickImage(
                                              source: ImageSource.gallery);
                                          setState(() {
                                            image = img;
                                            Navigator.pop(context);
                                          });
                                        },
                                        icon:const  Icon(Icons.photo)),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            image = null;
                                            Navigator.pop(context);
                                          });

                                        }, icon:const  Icon(Icons.delete),),
                                  ],
                                ),
                              );
                            });
                      }, icon: const Icon(Icons.add),color: Colors.white,)
                  ),
                ),

              ],
                  ),
              const SizedBox(height: 50,),
              const Text('John',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              const Text('John1011@gmail.com',),
              const SizedBox(height: 50,),
              const SizedBox(
                width: 300,
                child: ExpansionTile(
                    title:Text('Info',style: TextStyle(fontSize: 30)),
                  subtitle: Text("Privacy,Contact,Language"),
                  children: [
                    Text("*This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application.")
                  ],

                ),
              ),
              const SizedBox(height: 20,),
              const SizedBox(
                width: 300,
                child: ExpansionTile(
                  initiallyExpanded: false,
                  title:Text('Help',style: TextStyle(fontSize: 30)),
                  subtitle: Text("Help center,Contact us,Network usage"),
                  children: [
                    Text("*This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application."
                        "This project is a starting point for a Flutter application.")
                  ],

                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xFF81544F),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const home_page()));
          }, icon: const Icon(Icons.home)), label: 'Home', tooltip: 'menu'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(items:[])));
          }, icon: const Icon(Icons.shopping_cart)), label: 'Cart', tooltip: 'chart'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.person)), label: 'Account', tooltip: 'offer')
        ],
      ),
    );
  }
}
