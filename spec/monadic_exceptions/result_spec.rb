# frozen_string_literal: true

require_relative '../../lib/result'
require_relative '../spec_helper'

describe MonadicExceptions::Result do
  it 'works when raising a string from a proc' do
    function_to_throw = -> { raise 'A string error' }

    result = described_class.from_exception(function_to_throw).failure

    expect(result[:error]).to be(:runtimeerror)
    expect(result[:where]).to eq("#{Dir.pwd}/spec/monadic_exceptions/result_spec.rb")
    expect(result[:message]).to be('A string error')
  end

  it 'works when raising a string from a method' do
    result = MockClassRescueFromMethod.new.run.failure

    expect(result[:error]).to be(:runtimeerror)
    expect(result[:where]).to eq("#{Dir.pwd}/spec/spec_helper.rb")
    expect(result[:message]).to be('A error')
  end

  it 'works when raising a Exception class from a proc' do
    function_to_throw = -> { raise StandardError, 'This is a standard error' }

    result = described_class.from_exception(function_to_throw).failure

    expect(result[:error]).to be(:standarderror)
    expect(result[:where]).to eq("#{Dir.pwd}/spec/monadic_exceptions/result_spec.rb")
    expect(result[:message]).to be('This is a standard error')
  end
end
