// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/caixa_de_aviso.dart';
import '../model/molde_texto.dart';
import 'dart:math';

import '../model/popup_menu.dart';
import '../model/test.dart';
import '../model/text_input.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({
    super.key,
  });

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {
  TextEditingController _controller = TextEditingController();
  double _valor = 1.0;

  int p = 0;
  int q = 0;
  int n = 0;
  int z = 0;
  int d = 0;
  int e = 0;

  var icon = Icons.visibility_off;

  @override
  void initState() {
    super.initState();
  }

  _recuperarChaves() async {
    final prefs = await SharedPreferences.getInstance();
    p = await prefs.getInt('p')!.toInt();
    q = await prefs.getInt('q')!.toInt();
    n = await prefs.getInt('n')!.toInt();
    z = await prefs.getInt('z')!.toInt();
    d = await prefs.getInt('d')!.toInt();
    e = await prefs.getInt('e')!.toInt();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double _tamanho = MediaQuery.of(context).size.width * 0.2;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Encriptar"),
          actions: [
            PopupMenuButton(itemBuilder: (context2) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text("Recuperar Chaves"),
                ),
              ];
            }, onSelected: (value) {
              if (value == 0) {
                setState(() {
                  _recuperarChaves();
                });
              }
            })
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: MoldeTexto(
                  texto: "Nível de segurança",
                  tamanho: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              SfSlider(
                  inactiveColor: Colors.grey,
                  value: _valor,
                  min: 1,
                  max: 4,
                  interval: 1.0,
                  showLabels: true,
                  stepSize: 1.0,
                  onChanged: (dynamic valor) {
                    setState(() {
                      _valor = valor;
                    });
                  }),
              SizedBox(height: 30.0),
              // MoldeTexto(texto: "Chaves geradas", tamanho: 18),
              Column(
                children: [
                  Row(
                    children: [
                      MoldeTexto(texto: "Chaves privadas", tamanho: 18),
                      SizedBox(width: 14.0),
                      GestureDetector(
                        child: Icon(icon),
                        onTap: () {
                          if (icon == Icons.visibility_off) {
                            icon = Icons.visibility;
                          } else if (icon == Icons.visibility) {
                            icon = Icons.visibility_off;
                          }
                          setState(() {});
                        },
                      )
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
                        MoldeTexto(texto: "E = $e", tamanho: 18.0),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    p = await _gerarChavesPQ(_valor.toInt());
                    q = await _gerarChavesPQ(_valor.toInt());

                    while (p == q) {
                      q = await _gerarChavesPQ(_valor.toInt());
                    }

                    n = await _gerarChaveN(p: p, q: q);
                    z = await _gerarChaveZ(p: p, q: q);
                    d = await _gerarChaveD(_valor.toInt());
                    e = await _gerarChaveE();

                    // while (e == 0) {
                    //   e = await _gerarChaveE(seguranca: _valor.toInt());
                    // }
                    // _gerarChaveE(seguranca: _valor.toInt(), d: d, z: z);
                    // await _salvarChaves();
                    // await _recuperarChaves();
                    setState(() {});
                  },
                  child: MoldeTexto(texto: "Gerar novas chaves", tamanho: 18),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0)),
                ),
              ),
              SizedBox(height: 40.0),
              Center(
                  child:
                      MoldeTexto(texto: "Texto a ser encriptado", tamanho: 18)),
              SizedBox(height: 10.0),
              TextInput(
                controller: _controller,
              ),
              // TextFormField(
              //   controller: _controller,
              //   maxLength: 280,
              //   maxLines: 5,
              //   decoration: InputDecoration(
              //       enabledBorder: OutlineInputBorder(
              //           borderSide: BorderSide(width: 3.0, color: Colors.blue),
              //           borderRadius: BorderRadius.circular(15.0))),
              // ),
              SizedBox(height: 10.0),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      String retorno = _encryptText(_controller.text);
                      _salvarChaves();
                      showDialog(
                          context: context,
                          builder: (_) {
                            return CaixaAlerta(
                              texto: retorno,
                              titulo: 'Texto encriptado',
                              descricao: 'Copie o texto abaixo e o mantenha em segurança: ',
                              context2: context,
                            );
                          });
                    },
                    child: MoldeTexto(texto: "Encriptar", tamanho: 18),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0))),
              ),
              // ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         _recuperarChaves();
              //       });
              //     },
              //     child: Text("Teste"))
            ],
          ),
        ),
      ),
    );
  }

  _salvarChaves() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('p', p);
    await prefs.setInt('q', q);
    await prefs.setInt('n', n);
    await prefs.setInt('z', z);
    await prefs.setInt('d', d);
    await prefs.setInt('e', e);
  }

  _encryptText(String texto) {
    List vetorAscii = texto.codeUnits;

    List vetorCript = [];
    for (int i in vetorAscii) {
      vetorCript.add(i.modPow(e, n));
    }

    String textoCript = vetorCript
        .toString()
        .replaceAll(',', '')
        .replaceAll('[', '')
        .replaceAll(']', '');
    return textoCript;
  }

  _gerarChaveE() {
    List vetorE = [];
    for (int e = 1, i = 1; vetorE.length != 1; e++, i++) {
      if ((e * d) % z == 1) {
        vetorE.add(e);
      }
    }

    var numeroE = Random().nextInt(vetorE.length);
    return vetorE[numeroE];
  }

  _gerarChaveD(int seguranca) {
    List vetorD = [];

    for (int d = 7; vetorD.length != 10; d++) {
      bool inserir = true; //controla a inserção de D no vetor
      for (int i = z; i > 1; i--) {
        if ((d % i == 0) && (z % i == 0)) {
          inserir = false;
          break; //não são primos
        }
      }

      if (inserir) {
        vetorD.add(d);
      }
    }

    var _numero = Random().nextInt(vetorD.length);
    return vetorD[_numero];
  }

  _gerarChaveN({required p, required q}) {
    return p * q;
  }

  _gerarChaveZ({required p, required q}) {
    return ((p - 1) * (q - 1));
  }

  _gerarChavesPQ(int seguranca) {
    late int valor;
    switch (seguranca) {
      case 1:
        valor = _geradorDePrimos(53);
        // valor = _geradorDePrimos(15);
        break;
      case 2:
        valor = _geradorDePrimos(95);
        // valor = _geradorDePrimos(25);
        break;
      case 3:
        valor = _geradorDePrimos(132);
        // valor = _geradorDePrimos(35);
        break;
      case 4:
        valor = _geradorDePrimos(167);
        // valor = _geradorDePrimos(46);
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
          (i % 37 != 0)) {
        vetorPrimo.add(i);
      }
    }

    vetorFinal = numeroComplementares + vetorPrimo;

    var _numero = Random().nextInt(limite);
    return vetorFinal[_numero];
  }
}

class _recuperarChaves2 {
  static _recuperarChaves(String chave) async {
    final prefs = await SharedPreferences.getInstance();
    int retorno = await prefs.getInt('$chave')!.toInt();

    return retorno;
  }
}
