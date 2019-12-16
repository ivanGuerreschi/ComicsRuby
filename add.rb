module Add
  def self.add
    File.open('comics.txt', 'a') do |file|
      file.puts '14/02/20:3:Terzo'
    end    
  end
end
