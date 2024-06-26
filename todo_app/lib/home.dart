import 'package:flutter/material.dart';
import 'data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _LoginState();
}

class _LoginState extends State<Home> {
  List<Map<String, dynamic>> todayDo = [];

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  void _loadOrders() async {
    try {
      final orders = await DatabaseHelper().getOrders();
      setState(() {
        todayDo = orders;
      });
    } catch (e) {
      print('Error loading orders: $e');
    }
  }

  void addDish() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller1 = TextEditingController();
        TextEditingController controller2 = TextEditingController();
        TextEditingController controller3 = TextEditingController();
        TextEditingController controller4 = TextEditingController();
        return AlertDialog(
          title: const Text('Remainder'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller1,
                  decoration: const InputDecoration(labelText: 'DoSomething'),
                ),
                TextField(
                  controller: controller2,
                  decoration: const InputDecoration(labelText: 'Info'),
                ),
                TextField(
                  controller: controller3,
                  decoration: const InputDecoration(labelText: 'Requirement'),
                ),
                TextField(
                  controller: controller4,
                  decoration: const InputDecoration(labelText: 'Period'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () async {
                Map<String, String> order = {
                  'DoSomething': controller1.text,
                  'Info': controller2.text,
                  'Requirement': controller3.text,
                  'Period': controller4.text,
                };
                print('Inserting order: $order'); // Debug print
                int result = await DatabaseHelper().insertOrder(order);
                if (result != -1) {
                  print('Order inserted successfully');
                  _loadOrders();
                } else {
                  print('Failed to insert order');
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void editDish(Map<String, dynamic> order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller1 = TextEditingController(text: order['DoSomething']);
        TextEditingController controller2 = TextEditingController(text: order['Info']);
        TextEditingController controller3 = TextEditingController(text: order['Requirement']);
        TextEditingController controller4 = TextEditingController(text: order['Period']);
        return AlertDialog(
          title: const Text('Remainder'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: controller1,
                  decoration: const InputDecoration(labelText: 'DoSomething'),
                ),
                TextField(
                  controller: controller2,
                  decoration: const InputDecoration(labelText: 'Info'),
                ),
                TextField(
                  controller: controller3,
                  decoration: const InputDecoration(labelText: 'Requirement'),
                ),
                TextField(
                  controller: controller4,
                  decoration: const InputDecoration(labelText: 'Period'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                Map<String, String> updatedOrder = {
                  'DoSomething': controller1.text,
                  'Info': controller2.text,
                  'Requirement': controller3.text,
                  'Period': controller4.text,
                };
                await DatabaseHelper().updateOrder(order['id'], updatedOrder);
                _loadOrders();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void deleteOrder(int id) async {
    await DatabaseHelper().deleteOrder(id);
    _loadOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:Text("ToDo", style: TextStyle(color: Colors.orange[800], fontSize: 30,)),
      ),
      body: ListView.builder(
        itemCount: todayDo.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(" Work: ${todayDo[index]['DoSomething']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Info: ${todayDo[index]['Info']}"),
                  Text('Requirement: ${todayDo[index]['Requirement']}'),
                  Text('Period: ${todayDo[index]['Period']}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit,color: Colors.green,),
                    onPressed: () {
                      editDish(todayDo[index]);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete,color: Colors.redAccent,),
                    onPressed: () {
                      deleteOrder(todayDo[index]['id']);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            addDish();
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.orange[700], size: 35,),
        ),
      ),
    );
  }
}
