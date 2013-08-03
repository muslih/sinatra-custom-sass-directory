require 'sinatra'
require 'slim'
require 'sass'
require 'sinatra/reloader' if development?


set :views, :scss => 'views/sass/', :default => 'views'

 helpers do
   def find_template(views, name, engine, &block)
     _, folder = views.detect { |k,v| engine == Tilt[k] }
     folder ||= views[:default]
     super(folder, name, engine, &block)
   end
 end

get '/css/styles.css' do
	scss :styles
end

get '/' do
	slim :main
end