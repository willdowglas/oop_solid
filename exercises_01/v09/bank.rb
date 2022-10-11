module Bank
  require_relative 'bank/account'
  require_relative 'bank/deposit'
  require_relative 'bank/display'
  require_relative 'bank/withdraw'
  require_relative 'bank/errors/insufficient_funds'
  require_relative 'bank/errors/invalid_pin'
  require_relative 'bank/errors/negative_amount'
end

