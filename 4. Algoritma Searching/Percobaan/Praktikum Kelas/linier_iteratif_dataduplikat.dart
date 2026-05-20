import "dart:io";

// data dalam list yang duplikat bisa di print beserta indexnya
void main() {
  List<int> arr = [1, 2, 5, 4, 5, 6, 7, 8, 9, 5, 5];
  arr.shuffle();
  int X = 5;
  print("DENGAN METODE ITERATIF \n");
  print("Array: $arr");

  if (!arr.contains(X)) {
    print("Nilai $X tidak ditemukan dalam array.");
    return;
  }
  print("Nilai $X ditemukan pada indeks ke-");

  for (int i = 0; i < arr.length; i++) {
    if (arr[i] == X) {
      stdout.write("$i ");
    }
  }
}

// index di bisa diprint duplikat karena menggunakan for loop untuk mengecek semua elemen dalam array
// outputnya akan menampilkan semua index yang memiliki nilai 5, yaitu index ke-4 dan index ke-10.

// berbeda dengan fungsi yang sebelumnya, fungsi ini tidak akan berhenti setelah menemukan nilai pertama yang cocok,
// melainkan akan terus memeriksa seluruh array untuk mencari semua kemunculan nilai tersebut.

// karena tadi pake return, maka fungsi akan berhenti setelah menemukan nilai pertama yang cocok, sehingga hanya akan menampilkan index ke-4 saja.
// sedangkan ini menggunakan print, sehingga akan menampilkan semua index yang memiliki nilai 5.
