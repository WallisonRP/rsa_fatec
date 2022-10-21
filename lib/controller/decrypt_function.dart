import 'package:flutter/services.dart';

class DecryptText {
  DecryptText._();

  static Future<String> decryptFunction(String texto, int d, int n) async {
    List<String> vetorAsciiString =
        texto.split(" "); //transformando frase em ASCII

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

    print("aaaaaaaaaa $resultado");
    return resultado;
  }
}
