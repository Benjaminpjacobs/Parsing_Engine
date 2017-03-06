require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/codeblocks.rb'

class CodeBlockTest < Minitest::Test
  def test_it_exists
    assert CodeBlock.new
  end

  def test_it_can_identify_cb
    e = CodeBlock.new
    string = "<p>    This is the beginning of a code block"
    assert e.identify_code_block(string)
  end

  def test_it_can_insert_cb_open
    e = CodeBlock.new
    string = "<p>    This is the beginning of a code block"
    expected = "<pre><code>This is the beginning of a code block"
    result = e.insert_cb_open_tag(string)
    assert_equal expected, result
  end

  def test_it_can_insert_cb_close
    e = CodeBlock.new
    string = "<pre><code>This is the beginning of a code block</p>" 
    expected = "<pre><code>This is the beginning of a code block</pre></code>"
    result = e.insert_cb_close_tag(string)
    assert_equal expected, result
  end
  
  def test_it_can_remove_indentation
    e = CodeBlock.new
    string = "    This is an interior bit of a code block"
    expected = "This is an interior bit of a code block"
    result = e.remove_indentaion(string)
    assert_equal expected, result
  end
  
  def test_it_can_identify_first_line_of_cb
    e = CodeBlock.new
    array = ["This a regular paragraph", "\n\n","<p>    This is the first line of a cb"]
    expected = ["<p>    This is the first line of a cb", 2]
    result = array.each_with_index.find do |string, idx|
      e.id_first_line_of_cb(array, string, idx)
    end
    
    assert_equal expected, result
  end

  def test_it_can_identify_last_line_of_cb
    e = CodeBlock.new
    array = ["    This a middle line of a code block", "\n","    This is the last line of a cb</p>", "\n\n"]
    expected = ["    This is the last line of a cb</p>", 2]
    result = array.each_with_index.find do |string, idx|
      e.id_last_line_of_cb(array, string, idx)
    end
    
    assert_equal expected, result
  end
  

end