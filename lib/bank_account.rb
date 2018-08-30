require_relative "./transfer.rb"

class BankAccount

  attr_accessor :bank_account, :balance, :status
  attr_reader :name

  def initialize(name)
    @bank_account = bank_account
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    @balance += deposit_amount
  end

  def display_balance
    return "Your balance is $#{@balance}."
  end

  def valid?
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def sender
    @name
  end

  def close_account
    @status = "closed"
  end

end
