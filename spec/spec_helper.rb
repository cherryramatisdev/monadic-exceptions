# frozen_string_literal: true

class MockClassRescueFromMethod
  def method_to_throw
    raise 'A error'
  end

  def run
    MonadicExceptions::Result.from_exception(proc { method_to_throw })
  end
end
