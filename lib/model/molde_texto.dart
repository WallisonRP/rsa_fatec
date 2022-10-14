import 'package:flutter/material.dart';

class MoldeTexto extends StatelessWidget {
  final texto;
  final tamanho;
  const MoldeTexto({super.key, required this.texto, required this.tamanho});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(fontSize: tamanho, fontWeight: FontWeight.bold),
    );
  }
}
