require 'pry'
class BankAccount
    # set a default for the transfer to be 'pending' 
    # and once done they will be set to 'complete'
    # another status they can go to is 'rejected'
    # a complete status can also be reversed and go to a 'reversed' status
    # use if/else statements for those ^^^ functions
    attr_reader :name, :balance, :status
    attr_writer :balance, :status

    def initialize(name, balance=1000, status = "open")
        @name = name
        @balance = balance
        @status = status
    end

    def deposit(money)
        @balance += money
    end
    def withdraw(money)
        @balance -= money 
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            true
        else
            false
        end
    end

    def close_account
        @status = "closed"
    end
end
