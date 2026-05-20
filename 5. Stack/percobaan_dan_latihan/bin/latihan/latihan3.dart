import 'dart:io';
import 'dart:math';

class Tumpukan<T> {
  final List<T> _data = [];

  void masukkan(T elemen) => _data.add(elemen);

  T keluarkan() {
    if (kosong()) throw EksepsiAritmatika('Tumpukan kosong');
    return _data.removeLast();
  }

  T puncak() {
    if (kosong()) throw EksepsiAritmatika('Tumpukan kosong');
    return _data.last;
  }

  bool kosong() => _data.isEmpty;

  @override
  String toString() => _data.toString();
}

// Exception khusus untuk kesalahan aritmatika
class EksepsiAritmatika implements Exception {
  final String pesan;
  EksepsiAritmatika(this.pesan);

  @override
  String toString() => 'EksepsiAritmatika: $pesan';
}

class EvaluasiPostfix {
  String _ekspresiPostfix = '';

  EvaluasiPostfix();

  void aturEkspresi(String ekspresi) {
    _ekspresiPostfix = ekspresi;
  }

  String ambilEkspresi() => _ekspresiPostfix;

  // Cek apakah karakter adalah operator valid
  bool adalahOperator(String karakter) {
    return karakter == '+' ||
        karakter == '-' ||
        karakter == '*' ||
        karakter == '/' ||
        karakter == '%' ||
        karakter == '^';
  }

  // Hitung dua operand dengan operator yang diberikan
  int hitung(int kiri, int kanan, String operator) {
    switch (operator) {
      case '+':
        return kiri + kanan;
      case '-':
        return kiri - kanan;
      case '*':
        return kiri * kanan;
      case '/':
        if (kanan == 0) throw EksepsiAritmatika('Pembagian dengan nol');
        return kiri ~/ kanan;
      case '%':
        if (kanan == 0) throw EksepsiAritmatika('Modulo dengan nol');
        return kiri % kanan;
      case '^':
        return pow(kiri, kanan).toInt();
      default:
        throw EksepsiAritmatika('Operator tidak dikenal: $operator');
    }
  }

  // Ambil operand dari tumpukan, lempar eksepsi jika tumpukan kosong
  int ambilOperand(Tumpukan<int> tumpukan) {
    if (tumpukan.kosong())
      throw EksepsiAritmatika('Tumpukan kosong saat mengambil operand');
    return tumpukan.keluarkan();
  }

  // Evaluasi ekspresi postfix dan kembalikan hasilnya
  int evaluasi() {
    var tumpukan = Tumpukan<int>();
    List<String> token = _ekspresiPostfix.split(' ');

    for (var t in token) {
      if (t.isEmpty) continue;

      if (adalahOperator(t)) {
        int operandKanan = ambilOperand(tumpukan); // ambil operand kanan dulu
        int operandKiri = ambilOperand(tumpukan); // lalu operand kiri
        int hasil = hitung(operandKiri, operandKanan, t);
        tumpukan.masukkan(hasil);
      } else {
        tumpukan.masukkan(int.parse(t));
      }
    }

    return tumpukan.keluarkan();
  }
}

void main() {
  var evaluator = EvaluasiPostfix();

  stdout.write('Masukkan ekspresi postfix : ');
  String masukan = stdin.readLineSync()!;

  evaluator.aturEkspresi(masukan);

  try {
    int hasil = evaluator.evaluasi();
    print('Hasil = $hasil');
  } on EksepsiAritmatika catch (e) {
    print('Error: $e');
  } on FormatException {
    print('Error: Input mengandung karakter yang tidak valid');
  }
}
