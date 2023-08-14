# frozen_string_literal: true

require 'dry/monads/all'

require_relative 'result_sanitizer'

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
      exception_name = MonadicExceptions::ResultSanitizer.new.treat_exception_name(e.class.to_s)
      Dry::Monads::Result::Failure.new({ error: exception_name,
                                         where: callback.source_location.first, orig_exception: e,
                                         message: e.message })
    end
  end
end
