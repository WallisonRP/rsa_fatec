import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../controller/clipboard.dart';
import '../view/encrypt_page.dart';

class CaixaAlerta extends StatelessWidget {
  final String texto;
  final context;
  const CaixaAlerta({super.key, this.context, required this.texto});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width * 0.6;
    return AlertDialog(
      title: Text('Texto encriptado'),
      content: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Copie o texto abaixo e o mantenha em segurança: '),
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
              Navigator.pop(context);
            },
            child: Text("Copiar"))
      ],
    );
  }
}
