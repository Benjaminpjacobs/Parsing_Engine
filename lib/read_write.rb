class InOut

  attr_accessor :lines_array

  def read(input)  
    @lines_array = []
    @lines_array.push(File.read(input))
  end

  def write(input, destination)
    output_file = File.open(destination, "w")
    output_file.write(input.join)
    output_file.close
  end
  
end