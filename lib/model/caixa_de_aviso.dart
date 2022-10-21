// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controller/clipboard.dart';
import '../view/encrypt_page.dart';

class CaixaAlerta extends StatelessWidget {
  final String texto;
  final String titulo;
  final String descricao;
  final context2;

  CaixaAlerta(
      {super.key,
      this.context2,
      required this.texto,
      required this.titulo,
      required this.descricao});

  var snackBar = SnackBar(
    content: Text('Copiado com sucesso!'),
    backgroundColor: Color.fromARGB(255, 61, 143, 64),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
    margin: EdgeInsets.all(24),
  );
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width * 0.6;
    return AlertDialog(
      title: Text(titulo),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(descricao),
              SizedBox(
                height: 40,
              ),
              Text(texto)
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Sair')),
        SizedBox(
          width: 15,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16)),
            onPressed: () {
              ClipBoardHelper.copy(texto);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            },
            child: Text("Copiar"))
      ],
    );
  }
}
