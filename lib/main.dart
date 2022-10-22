import 'package:flutter/material.dart';
import 'package:rsa_fatec/view/about_page.dart';
import 'package:rsa_fatec/view/decrypt_page.dart';
import 'package:rsa_fatec/view/encrypt_page.dart';
import 'package:rsa_fatec/view/home_page.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // int p = await _recuperarChaves1('p');
  // int q = await _recuperarChaves1('q');
  // int n = await _recuperarChaves1('n');
  // int z = await _recuperarChaves1('z');
  // int d = await _recuperarChaves1('d');
  // int e = await _recuperarChaves1('e');
  runApp(MaterialApp(
    title: 'RSA FatecRP',
    debugShowCheckedModeBanner: false,
    initialRoute: 'inicio',
    routes: {
      'inicio': ((context) => HomePage()),
      'encrypt': ((context) => EncryptPage()),
      'decrypt': ((context) => DecryptPage()),
      'about': ((context) => AboutPage()),
    },
  ));
}

_recuperarChaves1(String chave) async {
  final prefs = await SharedPreferences.getInstance();
  int retorno = await prefs.getInt('$chave')!.toInt();

  return retorno;
}
