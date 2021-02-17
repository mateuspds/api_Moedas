import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Euro extends StatefulWidget {
  @override
  _EuroState createState() => _EuroState();
}

class _EuroState extends State<Euro> {
  Future<Map>recuperarpreco()async{
    String url = 'https://economia.awesomeapi.com.br/json/all/EUR-BRL';
    http.Response response= await http.get(url);
    return jsonDecode(response.body) ;
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: recuperarpreco(),
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

              String valor = snapshot.data["EUR"]["low"];
              resultado = "Preço do euro: ${valor.toString()} ";

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