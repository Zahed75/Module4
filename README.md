# Module4/Dart Object Oriented Programming

```
Problem

```

```
Define an abstract class Account with the following properties:
● accountNumber (integer)
● balance (double)
It should also have the following methods:
● deposit(double amount): Adds the specified amount to the account balance.
● withdraw(double amount): Abstract method that deducts the specified amount from
the account balance.
Define a class SavingsAccount that extends the Account class. It should have an additional
property called interestRate (double).
Implement the withdraw() method in the SavingsAccount class as follows:
● Subtract the specified amount from the account balance.
● Apply the interest rate to the remaining balance.
Define a class CurrentAccount that extends the Account class. It should have an
additional property called overdraftLimit (double).
Implement the withdraw() method in the CurrentAccount class as follows:
● Allow withdrawals up to the overdraft limit.
● If the withdrawal amount exceeds the overdraft limit, print a message indicating
insufficient funds.

In main()
● Create an instance of the SavingsAccount class by providing values for the account
number, initial balance, and interest rate.
● Use the instance to perform operations like depositing and withdrawing money.
● Create an instance of the CurrentAccount class by providing values for the account
number, initial balance, and overdraft limit.
● Use the instance to perform operations like depositing and withdrawing.

```



# Solution

```

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

```

