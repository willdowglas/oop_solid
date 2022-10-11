module Bank
  class Withdraw
    def initialize(account:, pin:)
      @account = account
      @pin = pin
    end

    def call(amount)
      account.update_balance(amount:, pin:, type: 'withdraw')

      account.append_transaction(transaction(amount), pin)

      display_withdrawn(account, amount)
    rescue Errors::InvalidPin, Errors::NegativeAmount, Errors::InsufficientFunds => e
      puts e.message
    end

    private

    attr_reader :account, :pin

    def transaction(amount)
      { type: 'debit', amount:, balance: account.balance, recorded_at: Time.now }
    end

    def display_withdrawn(account, amount) = puts "Withdrawn: #{amount} | New balance: #{account.balance}"
  end
end
