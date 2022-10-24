  
import 'dart:math';
  
  
  
  
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
        break;
      case 2:
        valor = _geradorDePrimos(95);
        break;
      case 3:
        valor = _geradorDePrimos(132);
        break;
      case 4:
        valor = _geradorDePrimos(167);
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











    int p = 0;
  int q = 0;
  int n = 0;
  int z = 0;
  int d = 0;
  int e = 0;
  