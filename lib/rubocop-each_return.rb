# frozen_string_literal: true

require 'rubocop'

require_relative 'rubocop/each_return'
require_relative 'rubocop/each_return/version'
require_relative 'rubocop/each_return/inject'

RuboCop::EachReturn::Inject.defaults!

require_relative 'rubocop/cop/each_return_cops'
