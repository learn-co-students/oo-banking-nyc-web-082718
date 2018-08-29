class Transfer

require_relative "./bank_account"

attr_accessor :amount, :sender, :receiver, :status

def initialize(sender, receiver, amount)
  @amount = amount
  @sender = sender
  @receiver = receiver
  @status = "pending"
end

def valid?
  @sender.valid? and @receiver.valid?
end

def execute_transaction
  if @status == "pending" and self.valid? and @sender.balance > @amount
    @sender.deposit(-@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete" and self.valid? and @receiver.balance > @amount
    @receiver.deposit(-@amount)
    @sender.deposit(@amount)
    @status = "reversed"
  end
end

end
