import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('About',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
              'Investing in the overall health and diversity of volunteer communities to be more inclusive and globally representative'
              'Developing tools and programs to expand the quantity and diversity of Wikipedia content'
              'Modernizing Wikipedia’s technology to meet the needs of the future'
              'Advocating for policies that preserve user privacy, free expression, and the free exchange of knowledge online'
              'Enhancing volunteers’ ability to combat disinformation with better resources and insights'
              'Investing in the overall health and diversity of volunteer communities to be more inclusive and globally representative'
              'Developing tools and programs to expand the quantity and diversity of Wikipedia content'
              'Modernizing Wikipedia’s technology to meet the needs of the future'
              'Advocating for policies that preserve user privacy, free expression, and the free exchange of knowledge online'
              'Enhancing volunteers’ ability to combat disinformation with better resources and insights'
              'Investing in the overall health and diversity of volunteer communities to be more inclusive and globally representative'
              'Developing tools and programs to expand the quantity and diversity of Wikipedia content'
              'Modernizing Wikipedia’s technology to meet the needs of the future'
              'Advocating for policies that preserve user privacy, free expression, and the free exchange of knowledge online'
              'Enhancing volunteers’ ability to combat disinformation with better resources and insights'
              'Investing in the overall health and diversity of volunteer communities to be more inclusive and globally representative'
              'Developing tools and programs to expand the quantity and diversity of Wikipedia content'
              'Modernizing Wikipedia’s technology to meet the needs of the future'
              'Advocating for policies that preserve user privacy, free expression, and the free exchange of knowledge online'
              'Enhancing volunteers’ ability to combat disinformation with better resources and insights'),
        ),
      ),
    );
  }
}
