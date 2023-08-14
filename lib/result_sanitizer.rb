# frozen_string_literal: true

module MonadicExceptions
  # ResultSanitizer hold methods responsible to perform string transformations on the exception name
  class ResultSanitizer
    # @param exception [String] before calling this method call the .to_s method on the exception at hand.
    # @return [Symbol]
    def treat_exception_name(exception)
      apply_transformations_to_string(exception, [
                                        proc { |x| x.downcase },
                                        proc { |x| remove_non_ascii_characters(x) },
                                        proc { |x| x.to_sym }
                                      ])
    end

    # @param input [String]
    # @return [String] without any character outside the ascii range
    def remove_non_ascii_characters(input)
      input.gsub(/[^\x00-\x7F]/, '')
    end

    # This function apply any number of transformations (a proc that receive
    # the value and return the transformed value) into a string input.
    # @param input [String] A target to start the transformations
    # @param transformations [Array<Proc>] An list of procs that perform pure transformation at a target
    # @return [String] The modified input
    def apply_transformations_to_string(input, transformations)
      modified_string = input.dup

      transformations.each do |transformation|
        modified_string = transformation.call(modified_string)
      end

      modified_string
    end
  end
end
