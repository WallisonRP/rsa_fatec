// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../model/molde_texto.dart';
import 'dart:math';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {
  double _valor = 1;
  int p = 0;
  int q = 0;
  int n = 0;
  int z = 0;

  @override
  Widget build(BuildContext context) {
    double _tamanho = MediaQuery.of(context).size.width * 0.2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Encriptar"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: MoldeTexto(
                texto: "Nível de segurança",
                tamanho: 18,
              ),
            ),
            SizedBox(height: 10),
            SfSlider(
                inactiveColor: Colors.grey,
                value: _valor,
                min: 1,
                max: 4,
                interval: 1,
                showLabels: true,
                stepSize: 1,
                onChanged: (dynamic valor) {
                  setState(() {
                    _valor = valor;
                  });
                }),
            SizedBox(height: 30),
            // MoldeTexto(texto: "Chaves geradas", tamanho: 18),
            SizedBox(height: 15),
            Row(
              children: [
                MoldeTexto(texto: "Chaves privadas", tamanho: 18),
                SizedBox(width: 14),
                Icon(Icons.visibility_off)
              ],
            ),
            SizedBox(height: 8),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (1 / 0.2),
                crossAxisCount: 3,
                children: [
                  MoldeTexto(texto: "P = $p", tamanho: 18),
                  MoldeTexto(texto: "Q = $q", tamanho: 18),
                  MoldeTexto(texto: "D = 7", tamanho: 18),
                ],
              ),
            ),
            SizedBox(height: 30),
            MoldeTexto(texto: "Chaves públicas", tamanho: 18),
            SizedBox(height: 8),
            Container(
              child: GridView.count(
                shrinkWrap: true,
                childAspectRatio: (1 / 0.2),
                crossAxisCount: 3,
                children: [
                  MoldeTexto(texto: "N = $n", tamanho: 18),
                  MoldeTexto(texto: "Z = $z", tamanho: 18),
                  MoldeTexto(texto: "E = 23", tamanho: 18),
                ],
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  int aux1 = _gerarChavesPQ(_valor.toInt());
                  int aux2 = _gerarChavesPQ(_valor.toInt());

                  while (aux1 == aux2) {
                    aux2 = _gerarChavesPQ(_valor.toInt());
                  }

                  int aux3 = _gerarChaveN(p: aux1, q: aux2);
                  int aux4 = _gerarChaveZ(p: aux1, q: aux2);

                  setState(() {
                    p = aux1;
                    q = aux2;
                    n = aux3;
                    z = aux4;
                  });
                },
                child: MoldeTexto(texto: "Gerar novas chaves", tamanho: 18),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20)),
              ),
            ),
            SizedBox(height: 40),
            Center(
                child:
                    MoldeTexto(texto: "Texto a ser encriptado", tamanho: 18)),
            SizedBox(height: 10),
            TextFormField(
              maxLength: 280,
              maxLines: 5,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blue),
                      borderRadius: BorderRadius.circular(15.0))),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                  onPressed: () {},
                  child: MoldeTexto(texto: "Encriptar", tamanho: 18),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20))),
            ),
          ],
        ),
      ),
    );
  }

  _gerarChaveN({required p, required q}) {
    return p * q;
  }

  _gerarChaveZ({required p, required q}) {
    return ((p - 1) * (q - 1));
  }

  int _gerarChavesPQ(int seguranca) {
    late int valor;
    switch (seguranca) {
      case 1:
        valor = _geradorDePrimos(25);
        break;
      case 2:
        valor = _geradorDePrimos(168);
        break;
      case 3:
        valor = _geradorDePrimos(1229);
        break;
      case 4:
        valor = _geradorDePrimos(9592);
        break;
    }

    return valor;
  }

  _geradorDePrimos(int limite) {
    List vetorPrimo = [];
    List numeroComplementares = [
      2,
      3,
      5,
      7,
      11,
      13,
      17,
      19,
      23,
      29,
      31,
      37,
      41,
      43,
      47,
      53,
      59,
      61,
      67,
      71,
      73,
      79,
      83,
      89,
      97,
      101,
      103,
      107,
      109,
      113,
      127,
      131,
      137,
      139,
      149,
      151,
      157,
      163,
      167,
      173,
      179,
      181,
      191,
      193,
      197,
      199,
      211,
      223,
      227,
      229,
      233,
      239,
      241,
      251,
      257,
      263,
      269,
      271,
      277,
      281,
      283,
      293,
      307,
      311,
      313
    ];

    List vetorFinal = [];

    for (int i = 5; i < 100000; i++) {
      if ((i % 2 != 0) &&
          (i % 3 != 0) &&
          (i % 5 != 0) &&
          (i % 7 != 0) &&
          (i % 11 != 0) &&
          (i % 13 != 0) &&
          (i % 17 != 0) &&
          (i % 19 != 0) &&
          (i % 23 != 0) &&
          (i % 29 != 0) &&
          (i % 31 != 0) &&
          (i % 37 != 0) &&
          (i % 41 != 0) &&
          (i % 43 != 0) &&
          (i % 47 != 0) &&
          (i % 53 != 0) &&
          (i % 59 != 0) &&
          (i % 61 != 0) &&
          (i % 67 != 0) &&
          (i % 71 != 0) &&
          (i % 73 != 0) &&
          (i % 79 != 0) &&
          (i % 83 != 0) &&
          (i % 89 != 0) &&
          (i % 97 != 0) &&
          (i % 101 != 0) &&
          (i % 103 != 0) &&
          (i % 107 != 0) &&
          (i % 109 != 0) &&
          (i % 113 != 0) &&
          (i % 127 != 0) &&
          (i % 131 != 0) &&
          (i % 137 != 0) &&
          (i % 139 != 0) &&
          (i % 149 != 0) &&
          (i % 151 != 0) &&
          (i % 157 != 0) &&
          (i % 163 != 0) &&
          (i % 167 != 0) &&
          (i % 173 != 0) &&
          (i % 179 != 0) &&
          (i % 181 != 0) &&
          (i % 191 != 0) &&
          (i % 193 != 0) &&
          (i % 197 != 0) &&
          (i % 199 != 0) &&
          (i % 211 != 0) &&
          (i % 223 != 0) &&
          (i % 227 != 0) &&
          (i % 229 != 0) &&
          (i % 233 != 0) &&
          (i % 239 != 0) &&
          (i % 241 != 0) &&
          (i % 251 != 0) &&
          (i % 257 != 0) &&
          (i % 263 != 0) &&
          (i % 269 != 0) &&
          (i % 271 != 0) &&
          (i % 277 != 0) &&
          (i % 281 != 0) &&
          (i % 283 != 0) &&
          (i % 293 != 0) &&
          (i % 307 != 0) &&
          (i % 311 != 0) &&
          (i % 313 != 0)) {
        vetorPrimo.add(i);
      }
    }

    vetorFinal = numeroComplementares + vetorPrimo;

    var _numero = Random().nextInt(limite);
    return vetorFinal[_numero];
  }
}
