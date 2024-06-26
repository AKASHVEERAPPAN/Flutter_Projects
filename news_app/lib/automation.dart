import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/about.dart';
import 'package:news_app/business.dart';
import 'package:news_app/info.dart';
import 'package:news_app/main.dart';
import 'package:news_app/news_page.dart';

class automation extends StatefulWidget {
  @override
  _automation createState() => _automation();
}

class _automation extends State<automation> {
  int selectedIndex = 0;
  Future<Map<String, dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/everything?q=apple&from=2024-05-15&to=2024-05-15&sortBy=popularity&apiKey=4d3aeb33c60a4a5cb5d0c3bdde6b9718'));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return json.decode(response.body);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Automobile News',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Center(
                    child: Text(
              'News Today...',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
            ))),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MyApiCallWidget()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.mobile_screen_share_rounded),
              title: const Text('Automobiles'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.business_sharp),
              title: const Text('Business'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => business()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Info'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => info()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.feed_outlined),
              title: const Text('About'),
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => about()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data?['articles'].length,
                itemBuilder: (context, index) {
                  List<dynamic> articles = snapshot.data?['articles'];
                  String title =
                      articles[index]['title'] ?? "No title available";
                  String author =
                      articles[index]['author'] ?? "No author available";
                  String imageUrl =
                      articles[index]['urlToImage'] ?? "No image available";
                  String description = articles[index]['description'] ??
                      'No description available';
                  String content =
                      articles[index]['content'] ?? 'No content available';
                  String publishedAt = articles[index]['publishedAt'];
                  return Card(
                    child: ListTile(
                      title: Text(author),
                      subtitle: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      leading:  SizedBox(
                        width: 100,
                        height: 80,
                        child: Image.network(imageUrl,fit: BoxFit.cover,
                          errorBuilder: (context,error,stackTrace){
                            return const Center(child: Text('No image Available'),);
                          },
                        ),
                      ),
                      onTap: () {
                        // Navigate to the details page when an item is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticleDetailsPage(
                                title: title,
                                author: author,
                                imageUrl: imageUrl,
                                description: description,
                                content: content,
                                publishedAt: publishedAt),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyApiCallWidget()));
                },
                icon: const Icon(Icons.home)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mobile_screen_share_rounded)),
            label: 'Automobile',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => business()));
                },
                icon: const Icon(Icons.business_sharp)),
            label: 'Business',
          )
        ],
      ),
    );
  }
}
