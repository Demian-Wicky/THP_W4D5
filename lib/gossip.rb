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

end