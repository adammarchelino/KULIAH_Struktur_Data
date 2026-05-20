import 'dart:io';

class StringReverser {
  String kalimat;

  StringReverser(this.kalimat);

  String reverse() {
    return kalimat.split('').reversed.join('');
  }

  bool isPalindrome() {
    return kalimat == reverse();
  }
}

void main() {
  stdout.write('Masukkan kalimat : ');
  String input = stdin.readLineSync()!;

  var hasil = StringReverser(input);

  print('Hasil = ${hasil.reverse()}');
  print(hasil.isPalindrome() ? 'Palindrom' : 'Bukan palindrom');
}
