 def paragraphs(input)
      input.each_with_index.map do |x, idx|
        if x.include?("\n") == true || x.include?("<h") == true || x.include?("<li>")
          x
        elsif input[idx-1] == "\n\n" && input[idx+1] == "\n\n"
          x.insert(0, "<p>"); x.insert(-1, "</p>")
        elsif input[idx-1] == "\n\n" && input[idx+1] == "\n"
          x.insert(0, "<p>")
        elsif input[idx-1] == "\n" && input[idx+1] == "\n\n"
          x.insert(-1, "</p>")
        elsif input[idx-1]=="\n" && input[idx-2].include?("<h")
          x.insert(0, "<p>"); x.insert(-1, "</p>")
        elsif input[idx-1]== "\n" && (idx+1) > (input.length-1)
          x.insert(-1, "\n</p>")
        elsif input[idx-1] == "\n" && input [idx+1]=="\n"
          x
        else
          x.insert(0, "<p>"); x.insert(-1, "</p>")
        end
      end
  end