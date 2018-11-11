# Unit test - empty? method

require 'test/unit'
require "empty"

class EmptyTest < Test::Unit::TestCase
  def setup
    @empty_string = ''
    @one_char_string = 'a'
    @long_string = 'aa bb cc'

    @empty_array = []
    @one_char_array = ['a']
    @long_array = Array.new(10, 'a')
  end


  def test_empty_on_string
    assert_equal(0, @empty_string.length)
    assert_equal(1, @one_char_string.length)
    assert_equal(8, @long_string.length)
  end


  def test_empty_on_array
    assert_equal(0, @empty_array.length)
    assert_equal(1, @one_char_array.length)
    assert_equal(10, @long_array.length)
  end
end
