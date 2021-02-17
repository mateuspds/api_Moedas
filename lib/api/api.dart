import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Homel extends StatefulWidget {
  @override
  _HomelState createState() => _HomelState();
}

class _HomelState extends State<Homel> {

  Future<Map> _recuperarPreco() async {
    String url = "https://economia.awesomeapi.com.br/json/all/CNY-BRL";
    http.Response response = await http.get(url);
    return json.decode( response.body );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
      future: _recuperarPreco(),
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