import 'package:flutter/material.dart';
import '../api/fuction.dart';
class Aus extends StatefulWidget {
  @override
  _AusState createState() => _AusState();
}
class _AusState extends State<Aus> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<Map>(
      future: recuperarPreco
        ('https://economia.awesomeapi.com.br/json/all/CAD-BRL'),
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