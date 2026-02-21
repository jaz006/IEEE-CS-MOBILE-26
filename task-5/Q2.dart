import 'dart:io';

// Bankaccount
class BankAccount {
  int accountnum;
  String accountType;
  double balance;
  String currency;

  //bankaccount constructor
  BankAccount(this.accountnum, this.accountType, this.balance, this.currency);

  //deposit function
  void deposit(double amount) {
    balance += amount;
    print("$amount $currency deposited successfull");
  }

  //withdraw fun
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print("$amount $currency withdrawed successfully");
    } else {
      print("your balance is insufficient");
    }
  }

  //convert data to string
  @override
  String toString() {
    return "Account Number : $accountnum \nAccount Type: $accountType \nBalance: $balance $currency";
  }
}

//client class
class Client {
  int clientnum;
  String name;
  List<BankAccount> accounts = [];
  Client(this.clientnum, this.name);

  //adding an acount for a client
  void addAccount(BankAccount account) {
    accounts.add(account);
  }

  //printing client data and their accounts
  void displayinfo() {
    print("Client Number: $clientnum");
    print("Client Name: $name");
    print("Account Details:");
    for (var acc in accounts) {
      print(acc);
    }
  }
}


void main() {
  print("Enter the Client Number:");
  int cNum = int.parse(stdin.readLineSync()!);
  print("Enter the Client Name:");
  String cName = stdin.readLineSync()!;

  Client client = Client(cNum, cName);

  BankAccount acc1 = BankAccount(73740192, "Current", 25000, "EGP");
  BankAccount acc2 = BankAccount(73700438, "Saving", 1800, "USD");

  client.addAccount(acc1);
  client.addAccount(acc2);

  client.accounts[0].deposit(1500);
  client.accounts[1].withdraw(5000);
  client.accounts[1].withdraw(300);

  print("\n------------------------");
  client.displayinfo();
}