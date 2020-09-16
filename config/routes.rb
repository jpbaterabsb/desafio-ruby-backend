Rails.application.routes.draw do
    post '/upload',  to: 'uploads#create'
    get '/list',  to: 'uploads#show', :defaults => { :format => :json }
    get '/lojas', to: 'lojas#show', :defaults => { :format => :json }
    get '/lojas/:id/registros', to: 'lojas#registros', :defaults => { :format => :json }
end
