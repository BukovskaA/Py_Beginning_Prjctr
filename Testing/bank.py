from typing import List

class Account:
    def __init__(self, balance, account_number):
        self._balance = balance
        self._account_number = account_number
    
    @classmethod
    def create_account(cls, account_number):
        return cls(0.0, account_number) # Creating an account with a default balance of 0.0
    
    def deposit(self, amount):
        # Depositing money -> the account
        if amount > 0:
            self._balance += amount
        else:
            raise ValueError('Amount must be positive')

    def withdraw(self, amount):
        # Withdraw money from the account
        if amount < 0:
            raise ValueError('Amount must be positive')
        
        if amount > self._balance:
            raise ValueError('Amount must less of equal to the current balance')
    
        self._balance -= amount

    def get_balance(self):
        # Getting the current account balance
        return self._balance
    
    def get_account_number(self):
        # Getting the account number
        return self._account_number

    def update(self):
        return
    
    def __str__(self):
        # String representation of the account
        return f'Account number: {self._account_number}, balance: {self._balance}'


class SavingsAccount(Account):
    def __init__(self, balance, account_number, interest_rate):
        super().__init__(balance, account_number)
        self._interest_rate = interest_rate

    def add_interest(self):
        self._balance += self._balance * self._interest_rate # Adding interest to the savings account balance

    def update(self):
        self.add_interest()
    
    @classmethod
    def create_account(cls, account_number, interest_rate):  # Adding interest_rate parameter
        return cls(0.0, account_number, interest_rate)  # Creating an account with a default balance of 0.0

class CurrentAccount(Account):
    def __init__(self, balance, account_number, overdraft_limit):
        super().__init__(balance, account_number)
        self._overdraft_limit = overdraft_limit

    def send_overdraft_letter(self):
        # Send an overdraft letter if the account is in overdraft
        print("Dear customer, your account is overdrawn. Please deposit funds immediately.")

    def update(self):
        if self._balance < self._overdraft_limit:
            self.send_overdraft_letter()


class Bank:
    def __init__(self):
        self._accounts: List[Account] = []
        

    def open_account(self, account):
        self._accounts.append(account)  # Opening an account by adding it to the list

    def close_account(self, account):
        self._accounts.remove(account) # Closing an account by removing it from the list

    def pay_dividend(self, amount): 
        for account in self._accounts:
            account.deposit(amount)

    def update_accounts(self):
        # Updating accounts (sending letters)
        for account in self._accounts:
            account.update()

# Example 
# savings_account = SavingsAccount(5000, "SA001", 0.05)
# current_account = CurrentAccount(-500, "CA001", -50)  

# bank = Bank()
# bank.open_account(savings_account)
# bank.open_account(current_account)

# bank.update_accounts()

# print(savings_account.get_balance())  # Should display the balance with added interest
# current_account.send_overdraft_letter()  # Should "send" an overdraft letter
