// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controller/chaves.dart';

import 'molde_texto.dart';

class Test extends StatefulWidget with ChavesPQ {
  final double valor;
  const Test({super.key, required this.valor});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // double _valor = 1.0;
  int? p = 0;
  int? q = 0;
  int? n = 0;
  int? z = 0;
  int? d = 0;
  int? e = 0;
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _recuperarChaves(),
      builder: ((context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MoldeTexto(texto: "Carregando chaves", tamanho: 18),
                SizedBox(
                  width: 20,
                ),
                CircularProgressIndicator()
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Row(
                children: [
                  MoldeTexto(texto: "Chaves privadas", tamanho: 18),
                  SizedBox(width: 14.0),
                  Icon(Icons.visibility_off)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: (1.0 / 0.2),
                  crossAxisCount: 3,
                  children: [
                    MoldeTexto(texto: "P = $p", tamanho: 18),
                    MoldeTexto(texto: "Q = $q", tamanho: 18),
                    MoldeTexto(texto: "D = $d", tamanho: 18),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  MoldeTexto(texto: "Chaves públicas", tamanho: 18.0),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: GridView.count(
                  shrinkWrap: true,
                  childAspectRatio: (1.0 / 0.2),
                  crossAxisCount: 3,
                  children: [
                    MoldeTexto(texto: "N = $n", tamanho: 18.0),
                    MoldeTexto(texto: "Z = $z", tamanho: 18.0),
                    MoldeTexto(texto: "E = 23", tamanho: 18.0),
                  ],
                ),
              ),
            ],
          );
        }
      }),
    );
  }

  _recuperarChaves() async {
    final prefs = await SharedPreferences.getInstance();
    p = await prefs.getInt('p');
    q = await prefs.getInt('q');
    n = await prefs.getInt('n');
    z = await prefs.getInt('z');
    d = await prefs.getInt('d');
    return true;
  }

  _gerarChaves() async {
    int teste = await widget.gerarChavesPQ(widget.valor.toInt());
    int aux1 = await widget.gerarChavesPQ(widget.valor.toInt());
    int aux2 = await widget.gerarChavesPQ(widget.valor.toInt());

    while (aux1 == aux2) {
      aux2 = await widget.gerarChavesPQ(widget.valor.toInt());
    }

    int aux3 = await widget.gerarChaveN(p: aux1, q: aux2);
    int aux4 = await widget.gerarChaveZ(p: aux1, q: aux2);
    int aux5 = await widget.gerarChaveD(
        seguranca: widget.valor.toInt(), z: z!.toInt());
  }

  userInfoConst() async {
    // Simula um delay de processamento de 2 segundos
    await Future.delayed(Duration(seconds: 2));

    return "FREE";
  }
}
