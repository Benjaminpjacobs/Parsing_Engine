  def split_by_double(input)
    input.map!{|x| x.split(/(\n\n)/)}.flatten!
  end

  def split_by_single(input)
    input.map! do |x|
      if x.include?("\n") && x != "\n\n"
        x.split(/(\n)/)
      else
        x
      end
    end
    input.flatten!
  end



