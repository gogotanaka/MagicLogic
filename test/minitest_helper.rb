$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'magic_logic'
require 'pry'
require 'minitest/autorun'

def assert_to_s(exp, obj)
  assert_equal(exp, obj.to_s)
end

def assert_dpll(exp, obj)
  assert_equal(exp, obj.dpll)
end
