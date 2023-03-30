import 'package:flutter/material.dart';
import 'package:rockinrio/pages/home_page.dart';

void main(){
  runApp(const RockInRio());
}

class RockInRio extends StatelessWidget {
  const RockInRio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock in Rio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple),
        home: const HomePage(),
    );
  }
}