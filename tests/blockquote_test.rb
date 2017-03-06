require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/blockquotes.rb'

class BlockquotesTest < Minitest::Test
  def test_it_exists
    assert Blockquotes.new
  end

  def test_it_can_identify_blockquote
    string = '> This is a blockquote.'
    e = Blockquotes.new
    assert e.line_contains_blockquote(string)
  end

  def test_it_can_remove_bq_tag
    string = '> this is the last line of a blockquote</blockquote>'
    e = Blockquotes.new
    expected = 'this is the last line of a blockquote</blockquote>'
    result = e.remove_md_bq_tag(string)

    assert_equal expected, string
  end

  def test_it_can_insert_bq_tags
    array = ["<p>> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,",
    "\n",
    "consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.",
    "\n",
    "Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.</p>",
    "\n\n",
    "<p>> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse",
    "\n",
    "id sem consectetuer libero luctus adipiscing.</p>"]
    e = Blockquotes.new
    expected = ["<blockquote> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,",
    "\n",
    "consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.",
    "\n",
    "Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae, risus.</blockquote>",
    "\n\n",
    "<blockquote> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse",
    "\n",
    "id sem consectetuer libero luctus adipiscing.</blockquote>"]
    result = e.lazy_insert_bq_open_and_close(array)

    assert_equal expected, result 
  end
  
  def test_it_can_un_md_bq_array
    array = ["<blockquote> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,",
    "\n",
    "> consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.",
    "\n",
    "> Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae,risus.<?blockquote>",
    "\n",
    "\>",
    "\n",
    "<blockquote> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse",
    "\n",
    "> id sem consectetuer libero luctus adipiscing.</blockquote>"]
    e = Blockquotes.new
    expected = ["<blockquote> This is a blockquote with two paragraphs. Lorem ipsum dolor sit amet,",
    "\n",
    "consectetuer adipiscing elit. Aliquam hendrerit mi posuere lectus.",
    "\n",
    "Vestibulum enim wisi, viverra nec, fringilla in, laoreet vitae,risus.<?blockquote>",
    "\n",
    "",
    "\n",
    "<blockquote> Donec sit amet nisl. Aliquam semper ipsum sit amet velit. Suspendisse",
    "\n",
    "id sem consectetuer libero luctus adipiscing.</blockquote>"]
    result = e.un_bq_array(array)

    assert_equal expected, result
  end
end