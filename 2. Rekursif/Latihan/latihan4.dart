import 'dart:io';

void menaraHanoi(int n, String asal, String tujuan, String perantara) {
  if (n == 1) {
    stdout.writeln("Memindahkan disc 1 dari pasak $asal ke pasak $tujuan");
    return;
  }

  menaraHanoi(n - 1, asal, perantara, tujuan);
  stdout.writeln("Memindahkan disc $n dari pasak $asal ke pasak $tujuan");
  menaraHanoi(n - 1, perantara, tujuan, asal);
}

void main() {
  int n = 3;
  menaraHanoi(n, 'A', 'C', 'B');
}
