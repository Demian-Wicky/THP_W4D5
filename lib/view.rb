class View 
  
  def create_gossip
    puts "Quel est ton nom ?".yellow
    print "> ".yellow
    author = gets.chomp

    puts "Quel est ton gossip ?".yellow
    print "> ".yellow
    content = gets.chomp
    return params = { content: content, author: author }
  end

  def index_gossips(gossips)
    gossips.each_with_index do |gossip, index|
      puts "#{index+1} ->  #{gossip.author}    #{gossip.content}".blue
    end
  end

end