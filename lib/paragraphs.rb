require './lib/linemodule.rb'

class Para
  include Lines

  def paragraphs(str_arr)
    str_arr.each_with_index.map do |str, idx|
      prev_line = prev_line(str_arr, idx, 1)
      next_line = next_line(str_arr, idx, 1)
      prev_sec_line = prev_line(str_arr, idx, 1)
      str = case
      when str.include?("\n") == true || str.include?("<h") == true || str.include?("<li>")
        str
      when prev_line == "\n\n" && next_line == "\n\n"
        str.insert(0, "<p>"); str.insert(-1, "</p>")
      when prev_line == "\n\n" && next_line == "\n"
        str.insert(0, "<p>")
      when prev_line == "\n" && next_line == "\n\n"
        str.insert(-1, "</p>")
      when prev_line == "\n" && prev_sec_line.include?("<h")
        str.insert(0, "<p>"); str.insert(-1, "</p>")
      when prev_line == "\n" && (idx+1) > (str_arr.length-1)
        str.insert(-1, "</p>")
      when prev_line == "\n" && next_line == "\n"
        str
      else
        str.insert(0, "<p>")
        str.insert(-1, "</p>")
      end
    end
  end

end 