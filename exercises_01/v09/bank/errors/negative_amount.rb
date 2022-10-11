module Bank::Errors
  class NegativeAmount < StandardError
    def initialize(msg = 'Cannot process negative amounts.')
      super
    end
  end
end
