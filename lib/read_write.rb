  def input(file)  
    @lines_array = []
    input = File.open(file, 'r')
    @lines_array.push(input.read)
    input.close
  end

  def write_file(input, destination)
    output_file = File.open(destination, "w")
    output_file.write(input.join)
    output_file.close
  end
