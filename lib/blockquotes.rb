class Blockquotes
  def line_contains_blockquote(string)
    string[0] == ">"
  end

  def remove_md_bq_tag(string)
   string.sub!(">", '')
   string.sub!(' ', '')
  end
  
  def lazy_insert_bq_open_and_close(arr)
    arr.each_with_index do |str, idx|
      if str.include?("<p>>")
        str.sub!("<p>>", "<blockquote>")
        endquote = (idx + 1) + (arr.drop(idx+1).find_index{|str| str.include?("</p>")})
        arr[endquote].sub!("</p>", "</blockquote>")
      else
        str
      end
    end
  end

  def un_bq_array(arr)
    arr.each{|str| remove_md_bq_tag(str) if line_contains_blockquote(str)}
  end

  def implement_bq(arr)
    lazy_insert_bq_open_and_close(arr)
    un_bq_array(arr)
  end
  
end