def get_file_as_string(filename)
  data = ''
  f = File.open(filename, "r") 
  f.each_line do |line|
    data += line
  end
  return data
end

##### MAIN #####

txt_data = get_file_as_string 'test.txt'

# print out the string
puts txt_data
