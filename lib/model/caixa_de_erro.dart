import 'package:flutter/material.dart';

class CaixaErro extends StatelessWidget {
    final String titulo;
  final String descricao;
  const CaixaErro({super.key, required this.titulo, required this.descricao});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(titulo),
      content: Container(
        child: SingleChildScrollView(
          child: Text(descricao),
        ),
      ),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Ok"))
      ],
    );
  }
}