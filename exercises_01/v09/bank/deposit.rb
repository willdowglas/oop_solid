module Bank
  class Deposit
    def initialize(account:, pin:)
      @account = account
      @pin = pin
    end

    def call(amount)
      account.update_balance(amount:, pin:, type: 'deposit')

      account.append_transaction(transaction(amount), pin)

      display_balance
    rescue Errors::InvalidPin, Errors::NegativeAmount => e
      puts e.message
    end

    private

    attr_reader :account, :pin

    def transaction(amount)
      { type: 'credit', amount:, balance: account.balance, recorded_at: Time.now }
    end

    def display_balance
      Display.balance(account:, pin:)
    end
  end
end
