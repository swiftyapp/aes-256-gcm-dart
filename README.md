# aes-256-gcm-dart

AES 256 GCM encryption algorithm in Dart

## Use

```dart
var text = 'SOME DATA TO ENCRYPT';
var password = 'password';

var encrypted = Aes256Gcm.encrypt(text, password);
var decrypted = Aes256Gcm.decrypt(encrypted, password);

print(encrypted);
print(decrypted);
```
