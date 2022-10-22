import 'package:flutter/material.dart';

class Pessoa extends StatelessWidget {
  final String nome;
  final String funcao;
  final String foto;
  final String email;
  const Pessoa(
      {super.key,
      required this.nome,
      required this.funcao,
      required this.foto,
      required this.email});

  @override
  Widget build(BuildContext context) {
    String caminho = 'assets/images/${foto}.jpg';
    String emailFinal = '${email}@fatec.sp.gov.br';
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            caminho,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 4,
            ),
            Text(nome,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 4,
            ),
            Text(funcao),
            SizedBox(
              height: 4,
            ),
            Text(emailFinal)
          ],
        )
      ],
    );
  }
}
