# frozen_string_literal: true

require 'rubocop'

module RuboCop
  module Cop
    # This cop checks for the use of return values when calling `each` method.
    #
    # `each` method just returns the same object that was originally being called, so it makes no sense
    # to store it in another variable.
    # Most probably the author thought she was calling `map` and wanted to use the result, this
    # cop helps the developer identify those cases.
    #
    # @example
    #   # bad
    #   value = object.each { |x| x*2 }
    #
    #   # good
    #   object.each { |x| operation! }
    #   value = object.map { |x| x*2 }
    #
    class EachReturnValue < RuboCop::Cop::Base
      extend AutoCorrector
      include RangeHelp

      def_node_matcher(:array_each?, '(lvasgn _ (block (send _ :each) ...))')

      def on_lvasgn(node)
        if array_each?(node)
          add_offense(node, message: 'Do not use the return value of .each') do |corrector|
            corrector.remove(node.loc.name)
            corrector.remove(range_with_surrounding_space(range: node.loc.operator))
          end
        end
      end
    end
  end
end
