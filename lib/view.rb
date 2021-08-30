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

end