// LATIHAN 6
// Jelaskan proses rekursif untuk pemanggilan test("01101", 4)

int test(String s, int last) {
  if (last < 0) {
    return 0;
  }
  if (s[last] == "0") {
    return 2 * test(s, last - 1);
  }
  return 1 + 2 * test(s, last - 1);
}

void main() {
  print(test("01101", 4));
}
