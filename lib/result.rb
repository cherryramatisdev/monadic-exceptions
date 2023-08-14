# frozen_string_literal: true

require 'dry/monads/all'

require_relative 'result_sanitizer'

module MonadicExceptions
  # Result wrap a static method called `from_exception` that receive a Proc and
  # rescue it's exception raises returning either a Failure or a Success
  # variant of the Result monad.
  class Result
    # This static method act as a bridge between exception to Result, it
    # supress any raises a method invokes and transform into a valid Failure
    # return.
    # @param callback [Proc]
    # @return [Failure({error: Symbol, where: String, orig_exception: Exception, message: String}), Success(data)]
    def self.from_exception(callback)
      result = callback.call

      Dry::Monads::Result::Success.new(result)
    rescue => e
      exception_name = MonadicExceptions::ResultSanitizer.new.treat_exception_name(e.class.to_s)
      Dry::Monads::Result::Failure.new({ error: exception_name,
                                         where: callback.source_location.first, orig_exception: e,
                                         message: e.message })
    end
  end
end
