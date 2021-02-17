import 'package:cotacao/moedas/aus.dart';
import 'package:cotacao/moedas/dola.dart';
import 'package:cotacao/moedas/euro.dart';
import 'package:flutter/material.dart';
import 'api/floact.dart';
import 'api/api.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _curretino = 0;
  int _color = 0;
//lista de widgets para nevegação 
  List<Widget> moedas = [
    Dola(),
    Euro(),
    Aus(),
    Homel(),

    
    
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cotacao moedas'),
        centerTitle: true,
      ),

      body: moedas[_color],

   //navegação inferior 
      bottomNavigationBar:
      Mateus(color: _color,
      curretino: _curretino,
      onTR: (index){
        setState(() {
          _color =index;
          _curretino = index;
        });
      },
      ),
      
    );
  }
}
