# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
get  '/',       to: 'home#index'
post '/events', to: 'events#create'
