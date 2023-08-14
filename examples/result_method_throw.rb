# frozen_string_literal: true

require_relative '../lib/monadic_exceptions'

def function_that_throws
  raise 'Some error string'
end

result = MonadicExceptions::Result.from_exception(proc { function_that_throws })

if result.failure?
  puts "The error symbol -> #{result.failure[:error]}"
  puts "Where it was called -> #{result.failure[:where]}"
  puts "The original exception class -> #{result.failure[:orig_exception]}"
  puts "The error message -> #{result.failure[:message]}"

  return
end
