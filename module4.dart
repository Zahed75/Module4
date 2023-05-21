// Dart Object Oriented Programming

abstract class Account {
  int accountNumber;
  double balance;

  Account(this.accountNumber, this.balance);

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount);
}

class SavingsAccount extends Account {
  double interestRate;

  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount > balance) {
      print('Insufficient funds.');
      return;
    }
    balance -= amount;
    balance *= (1 + interestRate);
  }
}

class CurrentAccount extends Account {
  double overdraftLimit;

  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  @override
  void withdraw(double amount) {
    if (amount > (balance + overdraftLimit)) {
      print('Insufficient funds.');
      return;
    }
    balance -= amount;
  }
}

void main() {
  // Create an instance of SavingsAccount
  SavingsAccount savingsAccount = SavingsAccount(123456, 1000.0, 0.05);
  print('Savings Account Balance: ${savingsAccount.balance}');
  savingsAccount.deposit(500.0);
  print('After depositing \$500, Balance: ${savingsAccount.balance}');
  savingsAccount.withdraw(200.0);
  print('After withdrawing \$200, Balance: ${savingsAccount.balance}');

  // Create an instance of CurrentAccount
  CurrentAccount currentAccount = CurrentAccount(789012, 2000.0, 1000.0);
  print('Current Account Balance: ${currentAccount.balance}');
  currentAccount.deposit(800.0);
  print('After depositing \$800, Balance: ${currentAccount.balance}');
  currentAccount.withdraw(3500.0);
  print('After withdrawing \$3500, Balance: ${currentAccount.balance}');
}
