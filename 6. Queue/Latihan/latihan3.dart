import 'dart:io';

class AntrianBank {
  final List<String> _data = [];
  final int _maxSize;

  AntrianBank(this._maxSize);

  bool isEmpty() => _data.isEmpty;

  bool isFull() => _data.length >= _maxSize;

  void enqueue(String nama) {
    if (isFull()) {
      print("Antrian penuh! Tidak bisa menambahkan nasabah baru.");
      return;
    }
    _data.add(nama);
    print(
      "Nasabah '$nama' berhasil masuk antrian. "
      "Posisi: ${_data.length}",
    );
  }

  void dequeue() {
    if (isEmpty()) {
      print("Antrian kosong! Tidak ada nasabah yang bisa dilayani.");
      return;
    }
    String dilayani = _data.removeAt(0);
    print("Nasabah '$dilayani' sedang dilayani dan keluar dari antrian.");
  }

  void tampilAntrian() {
    if (isEmpty()) {
      print("Antrian kosong.");
      return;
    }
    print("\n===== ISI ANTRIAN SAAT INI =====");
    print("Kapasitas: ${_data.length}/$_maxSize");
    for (int i = 0; i < _data.length; i++) {
      String label = i == 0 ? " <-- Terdepan" : "";
      print("  [${i + 1}] ${_data[i]}$label");
    }
    print("================================\n");
  }

  void prosesHabis() {
    if (isEmpty()) {
      print("Antrian sudah kosong dari awal.");
      return;
    }
    print("\n===== MEMPROSES SEMUA ANTRIAN =====");
    int urutan = 1;
    while (!isEmpty()) {
      String dilayani = _data.removeAt(0);
      print("  [$urutan] Melayani: '$dilayani'");
      urutan++;
    }
    print("Semua nasabah sudah dilayani. Antrian kosong.");
    print("===================================\n");
  }
}

//MainFunction
void main() {
  AntrianBank antrian = AntrianBank(5);
  bool running = true;

  print("==============================");
  print("   SISTEM ANTRIAN LOKET BANK  ");
  print("==============================");

  while (running) {
    print("\n--- MENU ---");
    print("1. Tambah nasabah ke antrian");
    print("2. Layani nasabah terdepan");
    print("3. Tampilkan semua antrian");
    print("4. Proses semua antrian hingga kosong");
    print("5. Keluar");
    stdout.write("Pilih menu: ");

    String? input = stdin.readLineSync();

    switch (input) {
      case "1":
        stdout.write("Masukkan nama nasabah: ");
        String? nama = stdin.readLineSync();
        if (nama != null && nama.trim().isNotEmpty) {
          antrian.enqueue(nama.trim());
        } else {
          print("Nama tidak boleh kosong.");
        }
        break;

      case "2":
        antrian.dequeue();
        break;

      case "3":
        antrian.tampilAntrian();
        break;

      case "4":
        antrian.prosesHabis();
        break;

      case "5":
        print("Sistem antrian ditutup. Sampai jumpa!");
        running = false;
        break;

      default:
        print("Pilihan tidak valid. Masukkan angka 1-5.");
    }
  }
}
