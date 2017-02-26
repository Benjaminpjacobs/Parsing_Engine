class Headers

  def headings(str_arr)
    str_arr.map do |str|
      if str.include?("# ")
        strength = str.split(" ")[0].length
        return str if strength > 6 || strength < 1
        str[0] = "<h#{strength}>"
        str.insert(-1, "</h#{strength}>")
      else
        str
      end
    end
  end

end 