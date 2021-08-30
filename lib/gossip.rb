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

end