// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../model/molde_texto.dart';

class EncryptPage extends StatefulWidget {
  const EncryptPage({super.key});

  @override
  State<EncryptPage> createState() => _EncryptPageState();
}

class _EncryptPageState extends State<EncryptPage> {
  double _valor = 1;

  @override
  Widget build(BuildContext context) {
    double _tamanho = MediaQuery.of(context).size.width * 0.2;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Criptografia RSA"),
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
            SizedBox(height: 40),
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
            SizedBox(
              height: 30,
              child: GridView.count(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
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
            SizedBox(
              height: 30,
              child: GridView.count(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                children: [
                  MoldeTexto(texto: "N = 187", tamanho: 18),
                  MoldeTexto(texto: "Z = 160", tamanho: 18),
                  MoldeTexto(texto: "E = 23", tamanho: 18),
                ],
              ),
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: MoldeTexto(texto: "Gerar novas chaves", tamanho: 18),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20)),
              ),
            ),
            SizedBox(height: 40),
            Center(
                child: MoldeTexto(
                    texto: "Texto a ser criptografado", tamanho: 18)),
            SizedBox(height: 10),
            TextFormField(
              maxLength: 280,
              maxLines: 5,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15.0))),
            ),
            SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                  onPressed: () {},
                  child: MoldeTexto(texto: "Criptografar", tamanho: 18),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.fromLTRB(40, 20, 40, 20))),
            ),
          ],
        ),
      ),
    );
  }
}
