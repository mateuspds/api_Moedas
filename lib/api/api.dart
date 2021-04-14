import 'package:flutter/material.dart';
import 'fuction.dart';

class Homel extends StatefulWidget {
  @override
  _HomelState createState() => _HomelState();
}

class _HomelState extends State<Homel> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: recuperarPreco("https://economia.awesomeapi.com.br/json/all/CNY-BRL"),
      builder: (context, snapshot){

        String resultado;
        switch( snapshot.connectionState ){
          case ConnectionState.none :
          case ConnectionState.waiting :
            print("conexao waiting");
            resultado = "Carregando...";
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            print("conexao done");
            if( snapshot.hasError ){
              resultado = "Erro ao carregar os dados.";
            }else {

              String valor = snapshot.data["CNY"]["low"];
              resultado = "Preço do Yuan: ${valor.toString()} ";

            }
            break;
        }

        return Center(
          child: Text( resultado ),
        );

      },
    );
  }
}