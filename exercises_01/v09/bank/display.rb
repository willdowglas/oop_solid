module Bank
  module Display
    def self.balance(account:, pin:)
      raise Errors::InvalidPin unless account.valid?(pin)

      puts "Balance: #{account.balance}"
    rescue Errors::InvalidPin => e
      puts e.message
    end

    def self.statement(account:, pin:)
      raise Errors::InvalidPin unless account.valid?(pin)

      header = 'date       | type   | amount | balance'
      rows = ''

      account.transactions.map do |transaction|
        rows << (
          "#{transaction[:recorded_at].strftime("%Y-%m-%d")} | " +
          "#{transaction[:type] == 'credit' ? 'credit' : 'debit '} | " +
          "   #{transaction[:amount]} | " +
          "#{transaction[:balance]} \n"
        )
      end

      puts header, rows
    rescue Errors::InvalidPin => e
      puts e.message
    end
  end
end
