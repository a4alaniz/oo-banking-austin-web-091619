  #require_relative "bank_account"
class Transfer
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? == true && @receiver.valid? == true

  end
  
  def execute_transaction
      if @sender.balance >= amount && @status != "complete" && self.valid?
      @receiver.balance += amount
      @sender.balance -= amount
      @status = "complete"

      elsif @sender.balance < amount || !self.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
  end
  
def reverse_transfer 
  if @status == "complete"
    @sender.balance += amount
    @receiver.balance -= amount
    @status = "reversed"
  end
end
end

