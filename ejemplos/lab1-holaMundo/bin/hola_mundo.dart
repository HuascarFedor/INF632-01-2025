import 'package:hola_mundo/hola_mundo.dart' as hola_mundo;

void main(List<String> arguments) {
  print('Hello world: ${hola_mundo.calculate()}!');
  print('Es palíndromo: ${hola_mundo.esPalindromo('Anita lava la tina')}');
  print('Es perfecto: ${hola_mundo.esPerfecto(28)}');
  print('son amigos: ${hola_mundo.sonAmigos(220, 284)}');
}
