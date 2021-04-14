import 'package:flutter/material.dart';
import '../api/fuction.dart';

class Dola extends StatefulWidget {
  @override
  _DolaState createState() => _DolaState();
}

class _DolaState extends State<Dola> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: recuperarPreco('https://economia.awesomeapi.com.br/json/all/USD-BRL') ,
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

              String valor = snapshot.data["USD"]["low"];
              resultado = "Preço do dolar: ${valor.toString()} ";

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