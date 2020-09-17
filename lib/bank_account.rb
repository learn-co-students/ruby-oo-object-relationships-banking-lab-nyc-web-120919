class BankAccount
    attr_accessor :balance, :status 
    attr_reader :name 

    def initialize(name)
        @name = name 
        @balance = 1000
        @status = "open"
        @@accounts = [] 
        @@accounts << name
    end 

    def deposit(deposit)
        @balance = @balance + deposit
    end 

    def display_balance
        "Your balance is $#{@balance}."
    end
    
    def valid?
        if @status == "open" && @balance > 0
            return true 
        else return false
        end 
    end

    def close_account
        @status = "closed"
    end 

    def self.accounts
        @@accounts
    end

end