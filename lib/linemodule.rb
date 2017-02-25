module Lines
  def next_line(str_arr, idx, pos)
    str_arr[idx + pos]
  end
  
  def prev_line(str_arr, idx, pos)
    str_arr[idx - pos]
  end
end
