import 'dart:math';

/// Gera título de eleitor aleatório
class GenerateTitulo {
  static String generate() {
    var rng = Random();
    var newString = "";
    for (var i = 0; i < 12; i++) {
      newString += rng.nextInt(10).toString();
    }
    return newString;
  }
}
