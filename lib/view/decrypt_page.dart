// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/clipboard.dart';
import '../controller/decrypt_function.dart';
import '../model/bottom.dart';
import '../model/caixa_de_erro.dart';
import '../model/caixa_de_aviso.dart';
import '../model/molde_texto.dart';
import '../model/text_input.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({super.key});

  @override
  State<DecryptPage> createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
  TextEditingController _controller = TextEditingController();

  int p = 0;
  int q = 0;
  int n = 0;
  int z = 0;
  int d = 0;
  int e = 0;
  int seguranca = 1;
  var icon = Icons.visibility_off;
  String dPrivado = '***';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text("Desencriptar"),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: MoldeTexto(
                  texto: "Nível de segurança: $seguranca",
                  tamanho: 18,
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  // Row(
                  //   children: [
                  //     MoldeTexto(texto: "Chaves geradas", tamanho: 20.0),
                  //   ],
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: (1.0 / 0.2),
                      crossAxisCount: 3,
                      children: [
                        MoldeTexto(texto: "P = $p", tamanho: 18.0),
                        MoldeTexto(texto: "Q = $q", tamanho: 18.0),
                        MoldeTexto(texto: "Z = $z", tamanho: 18.0),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      MoldeTexto(texto: "Chaves públicas", tamanho: 18.0),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: (1.0 / 0.2),
                      crossAxisCount: 3,
                      children: [
                        MoldeTexto(texto: "E = $e", tamanho: 18.0),
                        MoldeTexto(texto: "N = $n", tamanho: 18.0),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
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
                    height: 10,
                  ),
                  Container(
                    child: GridView.count(
                      shrinkWrap: true,
                      childAspectRatio: (1.0 / 0.2),
                      crossAxisCount: 3,
                      children: [
                        icon == Icons.visibility_off
                            ? MoldeTexto(texto: "$dPrivado", tamanho: 20)
                            : MoldeTexto(texto: "D = $d", tamanho: 18),
                        icon == Icons.visibility_off
                            ? MoldeTexto(texto: "$dPrivado", tamanho: 20)
                            : MoldeTexto(texto: "N = $n", tamanho: 18),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      _recuperarChaves();
                    });
                  },
                  child: MoldeTexto(texto: "Recuperar chaves", tamanho: 18),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0)),
                ),
              ),
              SizedBox(height: 30),
              Center(
                  child: MoldeTexto(
                      texto: "Cole abaixo o texto a ser desencriptado",
                      tamanho: 14)),
              SizedBox(height: 16),
              TextInput(
                controller: _controller,
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () async {
                        _controller.text = await ClipBoardHelper.paste();
                      },
                      child: Text('Colar'))
                ],
              ),
              SizedBox(height: 25),
              Center(
                child: ElevatedButton(
                    onPressed: () async {
                      if (p == 0 ||
                          q == 0 ||
                          n == 0 ||
                          z == 0 ||
                          d == 0 ||
                          e == 0) {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return CaixaErro(
                                titulo: 'Chaves incorretas',
                                descricao:
                                    'Verifique as chaves recuperadas e tente novamente!',
                              );
                            });
                      } else if (_controller.text == "") {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return CaixaErro(
                                titulo: 'Texto incorreto',
                                descricao:
                                    'Ops, parece que nenhum texto foi inserido.',
                              );
                            });
                      } else {
                        String retorno = _decryptText(_controller.text);
                        showDialog(
                            context: context,
                            builder: (_) {
                              return CaixaAlerta(
                                texto: retorno,
                                titulo: 'Texto desencriptado',
                                descricao:
                                    'Copie o texto abaixo e faça bom uso: ',
                                context2: context,
                              );
                            });
                      }
                    },
                    child: MoldeTexto(texto: "Desencriptar", tamanho: 18),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 20))),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomInfo(),
      ),
    );
  }

  _recuperarChaves() async {
    final prefs = await SharedPreferences.getInstance();
    p = await prefs.getInt('p')!.toInt();
    q = await prefs.getInt('q')!.toInt();
    n = await prefs.getInt('n')!.toInt();
    z = await prefs.getInt('z')!.toInt();
    d = await prefs.getInt('d')!.toInt();
    e = await prefs.getInt('e')!.toInt();
    seguranca = await prefs.getInt('seguranca')!.toInt();

    return true;
  }

  _decryptText(String texto) {
    List<String> vetorAsciiString = texto.split(" ");

    List<int> vetorAsciiInt =
        vetorAsciiString.map((e) => int.parse(e)).toList();

    List vetorDescript = [];
    for (int i in vetorAsciiInt) {
      vetorDescript.add(i.modPow(d, n));
    }

    String resultado = "";
    for (int i = 0; i < vetorDescript.length; i++) {
      resultado += String.fromCharCode(vetorDescript[i]);
    }

    return resultado;
  }
}
