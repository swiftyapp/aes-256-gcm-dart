import 'package:test/test.dart';
import 'package:cryptography/cryptography.dart';
import 'package:aes256gcm/aes256gcm.dart';

void main() {
  final password = 'password';
  final plainText = 'Hello World!';

  test('Encrypts and decrypts string', () async {
    String encrypted = await Aes256Gcm.encrypt(plainText, password);
    String decrypted = await Aes256Gcm.decrypt(encrypted, password);

    expect(decrypted, equals(plainText));
  });

  test('Encryption generates a different value each time', () async {
    String encrypted1 = await Aes256Gcm.encrypt(plainText, password);
    String encrypted2 = await Aes256Gcm.encrypt(plainText, password);

    expect(encrypted1, isNot(equals(encrypted2)));
  });

  test('Encrypted data is a hex string', () async {
    String encrypted = await Aes256Gcm.encrypt(plainText, password);

    expect(encrypted, matches(RegExp(r'^[0-9a-f]+$')));
  });

  test('Decrypts data encrypted with JavaScript', () async {
    final encrypted = '6d38ce529ee3cea82ba7580270cf63a22aa41364c35b84b54e92a342b8871a77a8faa30cbfac35948e359362e4417d39993035dde37791233eae72779768495f4e14c62c9c';
    final password = 'mysecretpassword';

    String decrypted = await Aes256Gcm.decrypt(encrypted, password);

    expect(decrypted, equals('sensitive data to encrypt'));
  });

  test('Encrypts and decrypts string with a different password', () async {
    String encrypted = await Aes256Gcm.encrypt(plainText, password);
    try {
      await Aes256Gcm.decrypt(encrypted, 'different password');
    } catch (e) {
      expect(e, new isInstanceOf<SecretBoxAuthenticationError>());
    }
  });
}
