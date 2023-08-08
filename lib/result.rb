# frozen_string_literal: true

require 'dry/monads/all'

module MonadicExceptions
  # Result wrap functions responsible to return Result monads
  class Result
    # wraps a function and act as a interception
    # returning to you result monads instead.
    # @param callback Function
    # @return [Failure({error: Symbol, where: String, orig_exception: Exception}), Success(data)]
    def self.from_exception(callback)
      result = method(callback).call

      Dry::Monads::Result::Success.new(result)
    rescue => e
      Dry::Monads::Result::Failure.new({ error: e.to_s.downcase.to_sym, where: callback, orig_exception: e })
    end
  end
end
