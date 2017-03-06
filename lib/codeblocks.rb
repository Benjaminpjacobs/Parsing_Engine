class CodeBlock
  def identify_code_block(str)
    str[0..6] == "<p>    " || str[0..3] == "    "
  end

  def insert_cb_open_tag(str)
    str.sub!("<p>    ", "<pre><code>")
  end

  def insert_cb_close_tag(str)
    str.sub!("</p>", "</pre></code>")
  end

  def remove_indentaion(str)
    str.sub!("    ", '')
  end

  def id_first_line_of_cb(arr, str, idx)
    true if identify_code_block(str) && arr[idx - 1] == "\n\n"
  end

  def id_last_line_of_cb(arr, str, idx)
    true if identify_code_block(str) &&  str[-4..-1] == "</p>"
  end
  
  def cb_open_and_close(arr)
    arr.each_with_index do |str, idx|
      str = case
      when id_first_line_of_cb(arr, str, idx)
        insert_cb_open_tag(str)
      when id_last_line_of_cb(arr, str, idx)
        insert_cb_close_tag(str)
      end
    end
  end

  def remove_indentaion_from_cb(arr)
    arr.each_with_index do |str, idx|
      remove_indentaion(str) if identify_code_block(str)
    end
  end

  def implement_cb(arr)
    cb_open_and_close(arr)
    remove_indentaion_from_cb(arr)
  end
end
