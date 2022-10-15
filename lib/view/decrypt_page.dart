// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../model/molde_texto.dart';

class DecryptPage extends StatefulWidget {
  const DecryptPage({super.key});

  @override
  State<DecryptPage> createState() => _DecryptPageState();
}

class _DecryptPageState extends State<DecryptPage> {
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
                  MoldeTexto(texto: "P = 17", tamanho: 18),
                  MoldeTexto(texto: "Q = 11", tamanho: 18),
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
                  MoldeTexto(texto: "N = 187", tamanho: 18),
                  MoldeTexto(texto: "Z = 160", tamanho: 18),
                  MoldeTexto(texto: "E = 23", tamanho: 18),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(height: 40),
            Center(
                child: MoldeTexto(
                    texto: "Texto a ser desencriptado", tamanho: 18)),
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
}
