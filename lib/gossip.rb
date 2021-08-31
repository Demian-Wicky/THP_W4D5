class Gossip 

  attr_reader :content , :author

  def initialize(author, content)
    @content = content.to_s
    @author = author.to_s
  end

  def save
    CSV.open("db/gossip.csv","a") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach("db/gossip.csv") do |row|
      gossip_provisoire = Gossip.new(row[0] , row[1])
      all_gossips << gossip_provisoire
    end
    return all_gossips
  end

  def self.delete_gossip(index)
    lines = File.readlines('db/gossip.csv')
    lines.delete_at(index-1)
    new_lines = lines

    File.open('db/gossip.csv', 'w') {|file| file.truncate(0) }

    new_lines.each do |line|
      File.open('db/gossip.csv', 'a') { |f| f.write line }
    end

  end

end