module Bank
  class Account
    def initialize(pin:, balance:, overdraft_limit:, transactions: [])
      @pin = pin
      @balance = balance
      @overdraft_limit = overdraft_limit
      @transactions = transactions
    end

    attr_reader :balance, :transactions

    def valid?(given_pin)
      pin == given_pin
    end

    def update_balance(amount:, pin:, type:)
      raise Errors::InvalidPin unless valid?(pin)
      raise Errors::NegativeAmount if amount.negative?
      raise Errors::InsufficientFunds if (balance + overdraft_limit) < amount && type == 'withdraw'

      case type
      when 'deposit' then @balance += amount
      when 'withdraw' then @balance -= amount
      end
    end

    def append_transaction(transaction, given_pin)
      return Display.invalid_pin unless valid?(given_pin)

      transactions << transaction
    end

    private

    attr_reader :pin, :overdraft_limit
  end
end
