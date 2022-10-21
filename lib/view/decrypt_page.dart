// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/decrypt_function.dart';
import '../model/caixa_de_aviso.dart';
import '../model/molde_texto.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Desencriptar"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: MoldeTexto(
                texto: "Nível de segurança: 1",
                tamanho: 18,
              ),
            ),
            // MoldeTexto(texto: "Chaves geradas", tamanho: 18),
            SizedBox(height: 50),
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
                  MoldeTexto(texto: "D = $d", tamanho: 18),
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
                  MoldeTexto(texto: "E = $e", tamanho: 18),
                ],
              ),
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
            SizedBox(height: 40),
            Center(
                child: MoldeTexto(
                    texto: "Cole abaixo o texto a ser desencriptado",
                    tamanho: 16)),
            SizedBox(height: 10),
            TextFormField(
              controller: _controller,
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
                  onPressed: () async {
                    String retorno = _decryptText(_controller.text);
                    showDialog(
                        context: context,
                        builder: (_) {
                          return CaixaAlerta(
                            texto: retorno,
                            context: context,
                          );
                        });
                  },
                  child: MoldeTexto(texto: "Desencriptar", tamanho: 18),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20))),
            ),
          ],
        ),
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
