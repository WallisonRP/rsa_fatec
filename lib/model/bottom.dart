import 'package:flutter/material.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Text("Análise e Desenvolvimento de Sistemas - Fatec RP"))
        ],
      ),
    );
  }
}
