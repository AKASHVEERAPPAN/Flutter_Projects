import 'package:flutter/material.dart';

class info extends StatefulWidget {
  const info({super.key});

  @override
  State<info> createState() => _infoState();
}

class _infoState extends State<info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Info',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(14.0),
          child: Text(
              'News is information about current events. This may be provided through many '
              'different media: word of mouth, printing, postal systems, broadcasting, electronic communication, '
              'or through the testimony of observers and witnesses to events. News is sometimes called "hard news" to differentiate'
              ' it from soft media Common topics for news reports include war, government, politics, education, health, the environment, economy, business, fashion, entertainment, and sport, as well as quirky or unusual events.'
              ' Government proclamations, concerning royal ceremonies, laws, taxes, public health,'
              'and criminals, have been dubbed news since ancient times. Technological and social developments,'
              'often driven by government communication and espionage networks, have increased the speed with which news'
              'can spread, as well as influenced its content.'
              'Throughout history, people have transported new information through oral means.'
              'Having developed in China over centuries, newspapers became established in Europe during the early modern period.'
              'In the 20th century, radio and television became an important means of transmitting newsWhilst in the 21st, the internet has also begun to play a similar role.'
              'News is information about current events. This may be provided through many '
              'different media: word of mouth, printing, postal systems, broadcasting, electronic communication, '
              'or through the testimony of observers and witnesses to events. News is sometimes called "hard news" to differentiate'
              ' it from soft media Common topics for news reports include war, government, politics, education, health, the environment, economy, business, fashion, entertainment, and sport, as well as quirky or unusual events.'
              ' Government proclamations, concerning royal ceremonies, laws, taxes, public health,'
              'and criminals, have been dubbed news since ancient times. Technological and social developments,'
              'often driven by government communication and espionage networks, have increased the speed with which news'
              'can spread, as well as influenced its content.'
              'Throughout history, people have transported new information through oral means.'
              'Having developed in China over centuries, newspapers became established in Europe during the early modern period.'
              'In the 20th century, radio and television became an important means of transmitting newsWhilst in the 21st, the internet has also begun to play a similar role.'),
        ),
      ),
    );
  }
}
