// LATIHAN 12
// Ubah ke tail recursive:

bool gcdlike(int p, int q) {
  if (q == 0) {
    return (p == 1);
  }
  return gcdlike(q, p % q);
}

int gcdliketail(int p, int q) {
  if (q == 0) return p;
  return gcdliketail(q, p % q);
}

void main() {
  print(gcdliketail(84, 30));
}
