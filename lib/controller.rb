require 'view'
require 'gossip'

class Controller

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    #@gossip = Gossip.new
    gossip = Gossip.new(params[:author] ,params[:content])
    gossip.save
    puts "Gossip sauvegardé".green
  end

  def index_gossips
    gossips = Gossip.all
    @view.index_gossips(gossips)
  end

  def delete_gossip
    idx = @view.delete_gossip
    Gossip.delete_gossip(idx)
  end

end