import unittest
import sys  # Add this line to import the sys module
from io import StringIO
from bank import Account, SavingsAccount, CurrentAccount, Bank

class TestBankMethods(unittest.TestCase):

    def test_open_account(self):
        bank = Bank()

        # Creating a SavingsAccount instance and open the account
        savings_account = SavingsAccount.create_account("SA001", 0.05)  # Provide the interest rate here
        bank.open_account(savings_account)

        # Checking if the account is in the bank's list of accounts
        self.assertIn(savings_account, bank._accounts)

        # Checking if the account has a balance of 0.0 (default)
        self.assertEqual(savings_account.get_balance(), 0.0)

    def test_update_accounts(self):
        bank = Bank()

        # Creating a SavingsAccount instance with a balance and interest rate
        savings_account = SavingsAccount(1000, "SA001", 0.05)  # Provide the interest rate here
        bank.open_account(savings_account)

        # Creating a CurrentAccount instance in overdraft
        current_account = CurrentAccount(-500, "CA001", -50)
        bank.open_account(current_account)

        # Capturing the standard output to check printed messages
        captured_output = StringIO()
        original_stdout = sys.stdout
        sys.stdout = captured_output

        # Updating accounts
        bank.update_accounts()

        # Restoring the original standard output
        sys.stdout = original_stdout

        # Getting the captured output
        output = captured_output.getvalue()

        # Checking if interest is added to the savings account
        self.assertEqual(savings_account.get_balance(), 1050.0)

        # Checking if the overdraft letter is sent
        self.assertIn("Dear customer, your account is overdrawn. Please deposit funds immediately.", output)

if __name__ == '__main__':
    unittest.main()
