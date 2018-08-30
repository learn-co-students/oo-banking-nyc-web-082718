require 'pry'
class Transfer
  # your code here
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"

  end

  def valid?
    if @sender.valid? and @receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction

    if @status != "complete"
      if sender.valid? == false || (@sender.balance - amount < 0)
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        @receiver.deposit(amount)

        @sender.balance -= amount
        self.status = "complete"
      end
    end
  end

  def reverse_transfer

    if @status == "complete"
      @status = "reversed"
      @sender.deposit(amount)
      @receiver.balance -= amount
    end
  end

end
