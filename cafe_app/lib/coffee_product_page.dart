import 'package:cafe_app/cart_page_coffee.dart';
import 'package:flutter/material.dart';

class coffee_product extends StatefulWidget {
  const coffee_product({super.key});

  @override
  State<coffee_product> createState() => _coffee_productState();
}

class _coffee_productState extends State<coffee_product> {
  List<Map<String, String>> data = [
    {'name': 'Latte', 'price': 'Rs 150', 'image': 'images/6.jpg'},
    {'name': 'Espresso', 'price': 'Rs 180', 'image': 'images/1.jpg'},
    {'name': 'Americano', 'price': 'Rs 150', 'image': 'images/2.jpg'},
    {'name': 'Cappuccino', 'price': 'Rs 120', 'image': 'images/6.jpg'},
    {'name': 'Flat white', 'price': 'Rs 200', 'image': 'images/6.jpg'},
    {'name': 'Mocha', 'price': 'Rs 180', 'image': 'images/1.jpg'},
    {'name': 'Black', 'price': 'Rs 170', 'image': 'images/2.jpg'},
    {'name': 'Doppio', 'price': 'Rs 220', 'image': 'images/6.jpg'},
  ];
  List<Map<String, String>> cartItems_coffee = [];

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
                    style: ElevatedButton.styleFrom(minimumSize: const Size(50, 50)),
                    child: const Row(
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
                        cartItems_coffee.add(data[index]);
                      });
                      // Navigate to cart page and pass the list of items
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartPage(items: cartItems_coffee),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(50, 50)),
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
        title: const Text('Coffee',style: TextStyle(color: Colors.white),),
        backgroundColor:const Color(0xFF81544F),
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
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
