import 'dart:io';

int i = 0;
bool loop = true;

void finish() {
  while (loop) {
    stdout.write('Apakah anda ingin keluar (y/t) :');
    String? confirm = stdin.readLineSync();

    i++;
    if (confirm == 'y') {
      loop = false;
      print(
          '========== TERIMA KASIH ATAS TRANSAKSI YANG DI LAKUKAN ==========');
    }
  }
}
