require './lib/linemodule.rb'

class Para
  include Lines

  def paragraphs(str_arr)
    str_arr.each_with_index.map do |str, idx|
      if str.include?("\n") == true || str.include?("<h") == true || str.include?("<li>")
        str
      elsif prev_line(str_arr, idx, 1) == "\n\n" && next_line(str_arr, idx, 1) == "\n\n"
        str.insert(0, "<p>"); str.insert(-1, "</p>")
      elsif prev_line(str_arr, idx, 1) == "\n\n" && next_line(str_arr, idx, 1) == "\n"
        str.insert(0, "<p>")
      elsif prev_line(str_arr, idx, 1) == "\n" && next_line(str_arr, idx, 1) == "\n\n"
        str.insert(-1, "</p>")
      elsif prev_line(str_arr, idx, 1) == "\n" && prev_line(str_arr, idx, 2).include?("<h")
        str.insert(0, "<p>"); str.insert(-1, "</p>")
      elsif prev_line(str_arr, idx, 1) == "\n" && (idx+1) > (str_arr.length-1)
        str.insert(-1, "</p>")
      elsif prev_line(str_arr, idx, 1) == "\n" && next_line(str_arr, idx, 1) == "\n"
        str
      else
        str.insert(0, "<p>")
        str.insert(-1, "</p>")
      end
    end
  end

end 