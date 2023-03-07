class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    messages = Message.all
    messages.to_json
  end

  post '/messages' do
    messages = Message.create(
      body: params[:body],
      username: params[:username]
    )
    messages.to_json
  end

  patch '/messages/:id' do
    item = Message.find(params[:id])
    item.update(
      body: params[:body]
    )

    item.to_json
  end
  delete '/messages/:id' do
    item = Message.find(params[:id])
    item.destroy

    item.to_json
  end
  
end