require 'pry'

require_relative './bank_account.rb'

class Transfer

  attr_accessor :account, :sender, :receiver, :status
  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end

end

# def execute_transaction
#   if self.valid? == false
#     @status = "Transaction rejected. Please check your account balance."
#   else
#     @receiver.balance += @amount
#     @sender.balance -= @amount
#     @status = "complete"
#   end
# end
