class Customer {
  int account;
  String name = '';
  int balance;
  int? pin;

  Customer(
      {required this.name,
      required this.pin,
      required this.account,
      this.balance = 0});
}

List<Customer> user = <Customer>[
  Customer(name: 'Azalea', pin: 222, account: 123, balance: 1000000),
  Customer(name: 'Tritan', pin: 555, account: 456),
  Customer(name: 'Vision', pin: 000, account: 789, balance: 750000),
];
