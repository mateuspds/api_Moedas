import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
class Aus extends StatefulWidget {
  @override
  _AusState createState() => _AusState();
}
class _AusState extends State<Aus> {
  Future<Map>recuperarpreco()async{
    String url = 'https://economia.awesomeapi.com.br/json/all/CAD-BRL';
    http.Response response= await http.get(url);
    return jsonDecode(response.body) ;
  }
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Map>(
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

              String valor = snapshot.data["CAD"]["low"];
              resultado = "Preço do dolar canadense: ${valor.toString()} ";

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