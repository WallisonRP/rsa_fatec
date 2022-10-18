import 'dart:math';
import 'package:flutter/cupertino.dart';

mixin ChavesPQ on StatefulWidget {
  gerarChaveD({required int seguranca, required int z}) {
    List vetorD = [];
    late int valor;

    switch (seguranca) {
      case 1:
        // valor = _geradorDePrimos(25);
        valor = 53;
        break;
      case 2:
        // valor = _geradorDePrimos(168);
        valor = 95;
        break;
      case 3:
        // valor = _geradorDePrimos(1229);
        valor = 132;
        break;
      case 4:
        // valor = _geradorDePrimos(9592);
        valor = 168;
        break;
    }

    for (int d = 0; d <= valor; d++) {
      bool inserir = true; //controla a inserção de D no vetor
      for (int i = z; i > 1; i--) {
        if ((d % i == 0) && (z % i == 0)) {
          inserir = false;
          break; //não são primos
        }
      }

      if (inserir) vetorD.add(d);
    }

    var _numero = Random().nextInt(vetorD.length);
    return vetorD[_numero];
  }

  gerarChaveZ({required p, required q}) {
    return ((p - 1) * (q - 1));
  }

  gerarChaveN({required p, required q}) {
    return p * q;
  }

  gerarChavesPQ(int seguranca) {
    late int valor;
    switch (seguranca) {
      case 1:
        // valor = _geradorDePrimos(25);
        valor = geradorDePrimos(53);
        break;
      case 2:
        // valor = _geradorDePrimos(168);
        valor = geradorDePrimos(95);
        break;
      case 3:
        // valor = _geradorDePrimos(1229);
        valor = geradorDePrimos(132);
        break;
      case 4:
        // valor = _geradorDePrimos(9592);
        valor = geradorDePrimos(168);
        break;
    }

    return valor;
  }

  geradorDePrimos(int limite) {
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
