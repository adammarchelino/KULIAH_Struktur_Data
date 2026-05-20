class Pegawai {
  int nip;
  String nama;
  String alamat;
  String golongan;

  Pegawai(this.nip, this.nama, this.alamat, this.golongan);
}

void cariByNip(List<Pegawai> data, int nip) {
  for (var p in data) {
    if (p.nip == nip) {
      print("Data ditemukan:");
      print("${p.nip} - ${p.nama} - ${p.alamat} - ${p.golongan}");
      return;
    }
  }
  print("Data tidak ditemukan");
}

void cariByNama(List<Pegawai> data, String nama) {
  for (var p in data) {
    if (p.nama.toLowerCase() == nama.toLowerCase()) {
      print("${p.nip} - ${p.nama} - ${p.alamat} - ${p.golongan}");
    }
  }
}

void insertBefore(List<Pegawai> data, int nipKey, Pegawai baru) {
  int index = data.indexWhere((p) => p.nip == nipKey);
  if (index != -1) {
    data.insert(index, baru);
  }
}

void insertAfter(List<Pegawai> data, int nipKey, Pegawai baru) {
  int index = data.indexWhere((p) => p.nip == nipKey);
  if (index != -1) {
    data.insert(index + 1, baru);
  }
}

void deletePegawai(List<Pegawai> data, int nip) {
  data.removeWhere((p) => p.nip == nip);
}

void main() {
  List<Pegawai> pegawai = [
    Pegawai(101, "Andi", "Banyuwangi", "A"),
    Pegawai(102, "Budi", "Jember", "B"),
    Pegawai(103, "Citra", "Malang", "A"),
  ];

  print("Cari berdasarkan NIP");
  cariByNip(pegawai, 102);

  print("\nCari berdasarkan Nama");
  cariByNama(pegawai, "Citra");

  insertAfter(pegawai, 102, Pegawai(104, "Dina", "Surabaya", "B"));

  deletePegawai(pegawai, 101);

  print("\nData Pegawai Sekarang:");
  for (var p in pegawai) {
    print("${p.nip} - ${p.nama} - ${p.alamat} - ${p.golongan}");
  }
}
