// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/bottom.dart';
import '../model/pessoa.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informações do projeto',
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16, 16, 10, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Text(
                'Aplicativo desenvolvido para a disciplina de Segurança da Informação na Fatec Ribeirão Preto, com a proposta de criar um algoritmo RSA, para criptografia de textos.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text('Participantes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Pessoa(
              nome: 'Carlos Danilo Gaioli Euzebio',
              funcao: 'Professor responsável',
              foto: 'carlos',
              email: 'carlos.euzebio',
            ),
            SizedBox(
              height: 12,
            ),
            Pessoa(
              nome: 'Ciro Emanuel Augusto Abib',
              funcao: 'Aluno da Fatec RP',
              foto: 'ciro',
              email: 'ciro.abib',
            ),
            SizedBox(
              height: 12,
            ),
            Pessoa(
              nome: 'Gabriel Afonso Pinho de Oliveira',
              funcao: 'Aluno da Fatec RP',
              foto: 'gabriel',
              email: 'gabriel.oliveira237',
            ),
            SizedBox(
              height: 12,
            ),
            Pessoa(
              nome: 'Gustavo da Silva Patrocínio',
              funcao: 'Aluno da Fatec RP',
              foto: 'gustavomm',
              email: 'gustavo.patrocinio',
            ),
            SizedBox(
              height: 12,
            ),
            Pessoa(
              nome: 'Gustavo Macrini Godencio',
              funcao: 'Aluno da Fatec RP',
              foto: 'gustavo',
              email: 'gustavo.godencio',
            ),
            SizedBox(
              height: 12,
            ),
            Pessoa(
              nome: 'Wallison Franklin Pereira',
              funcao: 'Aluno da Fatec RP',
              foto: 'wallison',
              email: 'wallison.pereira',
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomInfo(),
    );
  }
}
