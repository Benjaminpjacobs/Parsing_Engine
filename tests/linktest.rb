require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/links.rb'

class LinkTest < Minitest::Test
  def test_link_class_exists
    assert Link.new
  end

  def test_if_string_has_link
    string = "This is [an example](http://example.com/ \"Title\") inline link"
    assert Link.new.string_has_link(string)
  end

  def test_if_diff_string_has_link
    string = "[This link](http://example.net/) has no title attribute."
    assert Link.new.string_has_link(string)
  end

  def test_if_string_has_title
    string = "[This link](http://example.net/) has no title attribute."
    alt_string = "This is [an example](http://example.com/ \"Title\") inline link"
    refute Link.new.string_has_opt_title(string)
    assert Link.new.string_has_opt_title(alt_string)
  end

  def test_can_split_string
    string = "This is [an example](http://example.com/ \"Title\") inline link"
    result = Link.new.split_string(string)
    expected = ["This is ", "an example", "(http://example.com/ \"Title\"", " inline link"]

    assert_equal expected, result
  end

  def test_can_re_order_array
    string = "This is [an example](http://example.com/ \"Title\") inline link"
    e = Link.new
    array = e.split_string(string)
    result = e.re_order(array)
    expected = ["This is ", "(http://example.com/ \"Title\"", "an example", " inline link"]

    assert_equal expected, result
  end

  def test_can_change_elements_no_title
    string = "[This link](http://example.net/) has no title attribute."
    e = Link.new
    array = e.split_string(string)
    e.re_order(array)
    result = e.change_elements_no_title(array)
    expected = "<a href='http://example.net/'>This link</a> has no title attribute."

    assert_equal expected, result
  end
  
  def test_can_change_elements_with_title
    string = "This is [an example](http://example.com/ \"Title\") inline link"
    e = Link.new
    array = e.split_string(string)
    e.re_order(array)
    result = e.change_elements_with_title(array)
    expected = "This is <a href='http://example.com/' title=\"Title\">an example</a> inline link"

    assert_equal expected, result
  end
end
  
