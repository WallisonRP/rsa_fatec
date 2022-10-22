// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

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
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffD9D9D9),
        title: Text(
          'Sobre',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Informações do projeto',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Flexible(
                  child: Text(
                      'Aplicativo desenvolvido para a disciplina de Segurança da Informação na Fatec Ribeirão Preto, com a proposta de criar um algoritmo RSA, para criptografia de textos.')),
            ),
            SizedBox(
              height: 25,
            ),
            Text('Participantes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 25,
            ),
            Pessoa(
              nome: 'Carlos Danilo Gaioli Euzebio',
              funcao: 'Professor responsável',
              foto: 'carlos',
            ),
            SizedBox(
              height: 18,
            ),
            Pessoa(
              nome: 'Ciro Emanuel Augusto Abib',
              funcao: 'Aluno da Fatec RP',
              foto: 'ciro',
            ),
            SizedBox(
              height: 18,
            ),
            Pessoa(
              nome: 'Gabriel Afonso Pinho de Oliveira',
              funcao: 'Aluno da Fatec RP',
              foto: 'gabriel',
            ),
            SizedBox(
              height: 18,
            ),
            Pessoa(
              nome: 'Gustavo da Silva Patrocínio',
              funcao: 'Aluno da Fatec RP',
              foto: 'gustavomm',
            ),
            SizedBox(
              height: 18,
            ),
            Pessoa(
              nome: 'Gustavo Macrini Godencio',
              funcao: 'Aluno da Fatec RP',
              foto: 'gustavo',
            ),
            SizedBox(
              height: 18,
            ),
            Pessoa(
              nome: 'Wallison Franklin Pereira',
              funcao: 'Aluno da Fatec RP',
              foto: 'wallison',
            ),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }
}
