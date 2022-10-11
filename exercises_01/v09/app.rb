require_relative 'bank'

account = Bank::Account.new(pin: '1234', balance: 0, overdraft_limit: 100)

Bank::Deposit.new(account: account, pin: '1234').call(100)

puts

Bank::Withdraw.new(account: account, pin: '1234').call(100)
Bank::Withdraw.new(account: account, pin: '1234').call(100)
Bank::Withdraw.new(account: account, pin: '1234').call(100)

puts

Bank::Display.statement(account: account, pin: '1234')

puts

Bank::Withdraw.new(account: account, pin: '1235').call(100)
Bank::Display.balance(account: account, pin: '1235')
Bank::Display.statement(account: account, pin: '1235')
