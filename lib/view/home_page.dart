// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:rsa_fatec/view/decrypt_page.dart';

import 'encrypt_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double _largura = MediaQuery.of(context).size.width * 0.4;
    double _altura = MediaQuery.of(context).size.height * 0.14;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Criptografia RSA',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: Container(
                child: Center(
                    child: Text(
                  'Encriptar',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600),
                )),
                decoration: BoxDecoration(
                    color: Colors.blue[500],
                    borderRadius: BorderRadius.circular(15.0)),
                width: _largura,
                height: _altura,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EncryptPage()));
              },
            ),
            GestureDetector(
                child: Container(
                  child: Center(
                      child: Text(
                    'Desencriptar',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.w600),
                  )),
                  decoration: BoxDecoration(
                      color: Colors.blue[500],
                      borderRadius: BorderRadius.circular(15.0)),
                  width: _largura,
                  height: _altura,
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DecryptPage()));
                }),
          ],
        ),
      ), //SizedBox
      //Cent,
    );
  }
}
