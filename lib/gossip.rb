require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
      @content = content
      @author = author
    end

  def save
      CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
      end
  end

  def self.all
      all_gossips = []

      CSV.read("./db/gossip.csv").each do |row|   # lit le csv
        gossip_temp = Gossip.new(row[0],row[1])   
        all_gossips << gossip_temp
      end
      all_gossips 
  end

  def self.find(id)
  gossips = []   
  CSV.read("./db/gossip.csv").each_with_index do |row, index|
    if (id == index+1)          # cherche le potin
      gossips << Gossip.new(row[0], row[1])    
        end
      end
      return gossips
  end

  def self.update(id,author,content)
    gossips = []

    # met à jour array
		CSV.read("./db/gossip.csv").each_with_index do |row, index|
			if id.to_i == (index + 1)   
				gossips << [author, content]
			else
				gossips << [row[0], row[1]]
			end
		end

		CSV.open("./db/gossip.csv", "w") do |csv| 
			gossips.each do |row|
				csv << row
    end
  end

end
  
end
