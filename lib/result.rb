# frozen_string_literal: true

require 'dry/monads/all'

module MonadicExceptions
  # Result wrap functions responsible to return Result monads
  class Result
    include Dry::Monads[:result]

    # wraps a function and act as a interception
    # returning to you result monads instead.
    # @param callback Function
    # @return [Failure({error: Symbol, where: String}), Success(data)]
    def from_exception(callback)
      puts callback
    end
  end
end
