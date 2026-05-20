int Faktorialrekursif(int number) {
  if (number < 0) {
    return -1;
  } else if (number > 1) {
    print(number);
    return number * Faktorialrekursif(number - 1);
  } else {
    return 1;
  }
}
