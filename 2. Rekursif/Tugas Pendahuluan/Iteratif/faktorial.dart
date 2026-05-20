int FaktorialIteratif(int number) {
  if (number < 0) {
    return -1;
  } else if (number > 1) {
    int faktorial = 1;
    for (int i = number; i > 0; i--) {
      faktorial *= i;
    }
    return faktorial;
  } else {
    return 1;
  }
}

void main() {
  int number = 5;
  print("Faktorial dari $number (iteratif) = ${FaktorialIteratif(number)}");
}
