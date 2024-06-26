import 'package:cafe_app/account_page.dart';
import 'package:cafe_app/home_page.dart';
import 'package:flutter/material.dart';

class cart_ice extends StatefulWidget {
  final List<Map<String, String>> items;

  const cart_ice({super.key, required this.items});

  @override
  State<cart_ice> createState() => _cart_iceState();
}

class _cart_iceState extends State<cart_ice> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart',style: TextStyle(color: Colors.white),),
        backgroundColor:const Color(0xFF81544F),
      ),
      body: widget.items.isEmpty
          ? const Center(
        child: Text('No items in cart'),
      )
          : ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage:
              AssetImage(widget.items[index]['image']!),
            ),
            title: Text('Item Name: ${widget.items[index]['name']}'),
            subtitle: Text('Price: ${widget.items[index]['price']}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  widget.items.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
          }, icon: const Icon(Icons.home)), label: 'Home', tooltip: 'Home'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart)), label: 'Cart', tooltip: 'chart'),
          BottomNavigationBarItem(icon: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const account()));
          }, icon: const Icon(Icons.person)), label: 'Account', tooltip: 'Account')
        ],
      ),
    );
  }
}
