require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount = 0)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && receiver.valid? 
      return true
    end
  end

  def execute_transaction
    if @status == "pending"
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      @status = "complete"
    end
    truthy = valid?
    if !truthy 
      @status = "rejected"
      reverse_transfer
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" || @status == "rejected"
      @sender.deposit(amount)
      @receiver.withdraw(amount)
      @status = "reversed"
    end
  end

end
