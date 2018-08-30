require 'pry'
class BankAccount

  attr_accessor :balance, :status, :amount
  attr_reader :name

  #initializes instance of BankAccount with name, starting balance of 1000, and an open status.
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  #adds an amount of money into @balance
  def deposit(amount)
    @balance += amount
  end

  #returns current balance amount
  def display_balance
    "Your balance is $#{@balance}."
  end

  #returns true if account has open status and has a balance of greater than $0
  def valid?
    if @status == "open" && @balance > 0
      return true
    else
      return false
    end
  end

  #changes status from open to closed
  def close_account
    @status = "closed"
  end

end
