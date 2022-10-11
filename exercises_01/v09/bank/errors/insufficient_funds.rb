module Bank::Errors
  class InsufficientFunds < StandardError
    def initialize(msg = 'Insufficient funds!')
      super
    end
  end
end
