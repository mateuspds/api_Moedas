import 'package:flutter/material.dart';

class Mateus extends StatelessWidget {
  final int color;
  final Function onTR;
  final int curretino;
  const Mateus({ 
    this.color, this.curretino, this.onTR
  });
 
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: curretino,
      items: [
        BottomNavigationBarItem(
        icon: Icon(Icons.ac_unit, 
        color: color ==0 ? Colors.pink : Colors.white,),
        label: 'dola',
        backgroundColor: Colors.indigo
        ),

        BottomNavigationBarItem(
        icon: Icon(Icons.account_balance, 
        color: color ==1 ? Colors.pink : Colors.white,),
         label: 'euro',
        backgroundColor: Colors.black,
        ),

        BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_sharp,
        color: color ==2 ? Colors.pink : Colors.white,),
         label: 'canadense',
        backgroundColor: Colors.purple,
        ),

        BottomNavigationBarItem(
        icon: Icon(Icons.account_tree, color: color ==3 ? Colors.pink : Colors.white,),
        label: 'chineses',
        backgroundColor: Colors.greenAccent,
        ),

      ],
      onTap: onTR,
    );
    }
    }