int calculate() {
  return 6 * 7;
}

bool esPalindromo(String cad) {
  String cad2 = cad.toLowerCase();
  cad2 = cad2.replaceAll(' ', '');
  String invertida = cad2.split('').reversed.join();
  return cad2 == invertida;
}

bool esPerfecto(int num) {
  int suma = 0;
  for (int i = 1; i <= num / 2; i++) {
    if (num % i == 0) {
      suma += i;
    }
  }
  return suma == num;
}

bool sonAmigos(int a, int b) {
  int sumaA = 0;
  int sumaB = 0;
  for (int i = 1; i <= a / 2; i++) {
    if (a % i == 0) {
      sumaA += i;
    }
  }
  for (int i = 1; i <= b / 2; i++) {
    if (b % i == 0) {
      sumaB += i;
    }
  }
  return sumaA == b && sumaB == a;
}
