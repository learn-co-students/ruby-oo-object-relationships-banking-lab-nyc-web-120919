require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver= receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "complete" then 
      return nil
    end
    if @sender.balance < @amount || !@receiver.valid? 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
    @sender.balance = @sender.balance - @amount
    @receiver.balance = @receiver.balance + @amount
    @status = "complete"
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + @amount
      @receiver.balance = @receiver.balance - @amount
      @status = "reversed"
    end
  end



end
