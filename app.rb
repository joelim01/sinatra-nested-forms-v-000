require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do

      erb :"pirates/new"
    end

    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
      puts params[:pirate][:ships]
      params[:pirate][:ships].each do |ship, info|
        Ship.new(info)
      end

      @ships = Ship.all

      erb :"pirates/show"
    end


  end
end
