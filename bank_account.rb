class BankAccount
  
  attr_reader :name
  
  def initialize(name)
    @name = name
    @transactions = []
    add_transaction("Beginning Balance", 0)
  end
  
  def credit(description, amount)
    add_transaction(description, amount)
  end
  
  def debit(description, amount)
    add_transaction(description, -amount)
  end
  
  def add_transaction(description, amount)
    @transactions.push(description: description, amount: amount) # created hashes for description and amount
  end
  
  def balance
    balance = 0
    @transactions.each do |transaction| # loop through transactions to calculate the balance
      balance += transaction[:amount] # pulls the amount variable stored in the hash
    end # end transaction each loop
    return balance
  end # end balance
  
  def to_s
    "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
  end
  
  def print_register
    puts "#{name}'s Bank Account"
    puts "-" * 40
    
    puts "Description".ljust(30) + "Amount".rjust(10)
    @transactions.each do |transaction|
      puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount]).rjust(10)
    end
    
    puts "-" * 40
    puts "Balance:".ljust(30) + "#{sprintf("%0.2f", balance)}".rjust(10)
    puts "-" * 40
  end
 
end # end BankAccount class

  bank_account = BankAccount.new("Jason")
  bank_account.credit("Paycheck", 100)
  bank_account.debit("Groceries", 40)
  bank_account.debit("Gas", 10.51)
  # puts sprintf("%0.2f", bank_account.balance)
  # puts bank_account
  puts "Register: "
  bank_account.print_register
