import 'package:flutter/material.dart';
import 'package:rsa_fatec/view/decrypt_page.dart';
import 'package:rsa_fatec/view/encrypt_page.dart';
import 'package:rsa_fatec/view/home_page.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'inicio',
    routes: {
      'inicio': ((context) => HomePage()),
      'encrypt': ((context) => EncryptPage()),
      'decrypt': ((context) => DecryptPage()),
    },
  ));
}
