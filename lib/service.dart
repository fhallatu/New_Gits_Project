import 'dart:io';

import 'package:simple_application/finish.dart';

import 'user.dart';
import 'login.dart';

Customer? target;

void service(currentUser) {
  print('========== PILIH LAYANAN TRANSAKSI ==========');
  print('1. Informasi Saldo');
  print('2. Tarik Tunai');
  print('3. Setoran Tunai');
  print('4. Transfer');
  print('5. Ganti Akun');

  print('Masukkan Layanan Yang Anda Pilih');
  stdout.write('Layanan : ');
  int? service_input = int.parse(stdin.readLineSync()!);

  switch (service_input) {
    case 1:
      {
        print('===== Informasi Saldo =====');
        print(currentUser.balance);
        login();
        break;
      }
    case 2:
      {
        print('===== Masukkan Nominal Tarik Tunai =====');
        print('Nominal : ');
        int? cashWithdraw_input = int.parse(stdin.readLineSync() ?? '');
        if (cashWithdraw_input > currentUser.balance) {
          print(' Saldo Anda Tidak Cukup');
          service(currentUser);
          return;
        } else {
          currentUser.balance -= cashWithdraw_input;
          print('===== Sisa Saldo Anda =====');
          print(currentUser.balance);
        }
        break;
      }
    case 3:
      {
        print('===== Masukkan Uang Anda =====');
        stdout.write('Nominal : ');
        int? cashDeposit_input = int.parse(stdin.readLineSync()!);
        currentUser.balance += cashDeposit_input;
        print('===== Saldo Anda =====');
        print(currentUser.balance);
        break;
      }
    case 4:
      {
        print('===== Transfer =====');
        print('===== Masukkan Nomor Rekening Tujuan =====');
        stdout.write('Nomor Rekening Tujuan : ');
        int? account_input = int.parse(stdin.readLineSync()!);
        user.forEach((Customer user) {
          if (account_input == user.account) target = user;
        });
        if (account_input == target!.account) {
          print('===== Rekening Tujuan =====');
          print('Nama : ' + target!.name);
          print('Nomor Rekening : ${target!.account} ');
          print('===== Masukkan Nominal Transfer =====');
          stdout.write('Nominal Transfer : ');
          int? transfer_input = int.parse(stdin.readLineSync()!);
          if (transfer_input > currentUser.balance) {
            print(' Saldo Anda Tidak Cukup');
            service(currentUser);
            return;
          } else {
            currentUser.balance -= transfer_input;
            target!.balance += transfer_input;
            print('===== Saldo Anda =====');
            print(currentUser.balance);
          }
        }
        break;
      }
    case 5:
      {
        login();
        break;
      }
    default:
  }
  login();
}
