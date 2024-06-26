import 'package:cafe_app/account_page.dart';
import 'package:cafe_app/cart_page_coffee.dart';
import 'package:cafe_app/coffee_product_page.dart';
import 'package:cafe_app/ice_product_page.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  int selectedIndex = 0;
  static const List<String> sampleImages = [
    'images/6.jpg',
    'images/1.jpg',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafe',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color(0xFF81544F),),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 250,
              color: Colors.white,
              child: FanCarouselImageSlider(
                imagesLink: sampleImages,
                isAssets: true,
                sliderHeight: 200,
                indicatorActiveColor: const Color(0xFF81544F),
                imageFitMode: BoxFit.cover,
                currentItemShadow:const[
                  BoxShadow(offset: Offset(1, 1), color: Colors.white,blurRadius: 10),
                  BoxShadow(offset: Offset(-1, -1), color: Colors.white, blurRadius: 10),
                ],
              )),
          const Divider(),
          const SizedBox(height: 10,),
          const Text('Coffee', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Color(0xFF81544F),),),
          const SizedBox(height: 10,),
          SingleChildScrollView(
            padding:const  EdgeInsets.all(20),
            scrollDirection: Axis.horizontal,
            child:Row(
              children: [
                Container(
                  height:200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: const  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/6.jpg'),
                          radius: 60,
                        ),
                        Text('* Coffee'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30,),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/1.jpg'),
                          radius: 60,
                        ),
                        Text('* Coffee'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30,),
                Container(
                  padding:const  EdgeInsets.all(1.0),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),

                  child:const  Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/2.jpg'),
                          radius: 59,
                        ),
                        Text('* Coffee'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 30,),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/6.jpg'),
                          radius: 60,
                        ),
                        Text('* Coffee'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
              ],
            ) ,
          ),
          const SizedBox(height: 10,),
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>const coffee_product()));
           },
             style: ElevatedButton.styleFrom(
               foregroundColor: Colors.white, backgroundColor: const Color(0xFF81544F),
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),

             ), child: const Text('<-Click to Ordere Your Ice Cream->'),
           ),
          const Divider(),
          const SizedBox(height: 20,),
          const Text('Ice Cream', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold,color: Color(0xFF81544F)),),
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            scrollDirection: Axis.horizontal,
            child:Row(
              children: [
                Container(
                  height:200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/4.jpg'),
                          radius: 60,
                        ),
                        Text('*Ice Cream'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 50,),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/3.jpg'),
                          radius: 60,
                        ),
                        Text('* Ice Cream'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 50,),
                Container(
                  padding: const EdgeInsets.all(1.0),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child:const Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/7.jpg'),
                          radius: 59,
                        ),
                        Text('*Ice Cream'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 50,),
                Container(
                  height:200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black12,
                      width: 4.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child:const  Padding(
                    padding:  EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('images/4.jpg'),
                          radius: 59,
                        ),
                        Text('* Ice Cream'),
                        Text('Rs.100'),
                      ],
                    ),
                  ),
                ),
              ],
            ) ,
          ),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const ice_product()));
          },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: const Color(0xFF81544F),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ), child:const Text('<-Click to Ordere Your Ice Cream->'),
                    )

        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor:const Color(0xFF81544F),
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.home)), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(items:const [])));
          }, icon: const Icon(Icons.shopping_cart)), label: 'Cart', tooltip: 'chart'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const account()));
          }, icon: const Icon(Icons.person)), label: 'Account', tooltip: 'Account')
        ],
      ),
    );
  }
}
