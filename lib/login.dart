import 'dart:io';

import 'service.dart';
import 'user.dart';

Customer? currentUser;

void login() {
  print('Masukkan Pin Anda');
  stdout.write('PIN : ');
  int? pin_input = int.parse(stdin.readLineSync()!);

  user.forEach((Customer user) {
    // ignore: unrelated_type_equality_checks
    if (pin_input == user.pin) {
      currentUser = user;
    }
  });
  if (pin_input == currentUser!.pin) {
    service(currentUser);
  } else {
    login();
  }
}
