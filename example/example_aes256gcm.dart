import 'package:aes256gcm/aes256gcm.dart';

void main() {
  final text = 'SOME DATA TO ENCRYPT';
  final password = 'password';

  final encrypted = Aes256Gcm.encrypt(text, password);
  final decrypted = Aes256Gcm.decrypt(encrypted, password);

  print(encrypted);
  print(decrypted);
}