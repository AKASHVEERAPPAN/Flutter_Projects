// article_details.dart
import 'package:flutter/material.dart';

class ArticleDetailsPage extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String description;
  final String content;
  final String publishedAt;

  ArticleDetailsPage({required this.title, required this.author
  ,required this.imageUrl,required this.description,required this.content,
  required this .publishedAt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child:  SizedBox(width:200,height:100,child: Image.network(imageUrl,))),
           const SizedBox(height: 20,),
           Center(child: Text(title, style:const  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
          const SizedBox(height: 20,),
          Text('Author: $author $publishedAt', style:const  TextStyle(fontSize: 16),),
          const SizedBox(height: 20,),
          Text(description, style:const TextStyle(fontSize: 16),),
          const SizedBox(height: 20,),
          Text(content, style: const TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}
