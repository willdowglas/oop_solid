module Bank::Errors
  class InvalidPin < StandardError
    def initialize(msg = 'Access denied: invalid PIN.')
      super
    end
  end
end
