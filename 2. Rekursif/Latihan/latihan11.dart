// LATIHAN 11
// Ubah ke tail recursive:

void decToBin(int num) {
  if (num > 0) {
    decToBin(num ~/ 2);
  }
}

String decToBinTail(int num, String acc) {
  if (num == 0) return acc;
  return decToBinTail(num ~/ 2, (num % 2).toString() + acc);
}

void main() {
  print(decToBinTail(13, ""));
}
