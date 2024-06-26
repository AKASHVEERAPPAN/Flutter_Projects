import 'package:cafe_app/cart_page_ice.dart';
import 'package:flutter/material.dart';

class ice_product extends StatefulWidget {
  const ice_product({super.key});

  @override
  State<ice_product> createState() => _ice_productState();
}

class _ice_productState extends State<ice_product> {
  List<Map<String, String>> data = [
    {'name': 'Chocolate', 'price': 'Rs 150', 'image': 'images/4.jpg'},
    {'name': 'Birthday cake', 'price': 'Rs 180', 'image': 'images/3.jpg'},
    {'name': 'Butter pecan', 'price': 'Rs 150', 'image': 'images/7.jpg'},
    {'name': 'Chocolate chip', 'price': 'Rs 120', 'image': 'images/4.jpg'},
    {'name': 'Strawberry', 'price': 'Rs 200', 'image': 'images/3.jpg'},
    {'name': 'Coffee', 'price': 'Rs 180', 'image': 'images/7.jpg'},
    {'name': 'Gelato', 'price': 'Rs 170', 'image': 'images/4.jpg'},
    {'name': 'Banana', 'price': 'Rs 220', 'image': 'images/3.jpg'},

  ];
  List<Map<String, String>> cartItems_ice = [];


  void alert(int index) {
    showDialog(
        context: context,
        builder: (BuilderContext) {
          return AlertDialog(
            content: SizedBox(
              width: 100,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(minimumSize: Size(50, 50)),
                    child:const  Row(
                      children: [
                        Icon(Icons.currency_rupee),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Buy'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        cartItems_ice.add(data[index]);
                      });
                      // Navigate to cart page and pass the list of items
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => cart_ice(items: cartItems_ice),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(minimumSize: Size(50, 50)),
                    child: const Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Cart'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ice Cream',style: TextStyle(color: Colors.white),),
        backgroundColor:Color(0xFF81544F),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: const BorderSide(color: Colors.black12,width: 2.0)
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  alert(index);
                });
              },
              child: SizedBox(
                height: 200,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(data[index]['image']!),
                    ),
                    Text(
                      '${data[index]['name']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('${data[index]['price']}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
