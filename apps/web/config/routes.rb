# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
get  '/',       to: 'home#index'
get  '/events', to: 'events#index'
post '/events', to: 'events#create'
