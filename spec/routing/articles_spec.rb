require 'rails_helper'

RSpec.describe '/articles routes' do

  # only thing that test checks is that the route is defined 
  # not response, code, success/failure, format. just 
  it 'routes to articles#index' do

    # aggregate_failures here will run _both_ expectations instead of kicking out after
    # first failure
    aggregate_failures do 
      # this is the same as line 14 but not as slick
      # expect(get '/articles').to route_to(controller: 'articles', action: 'index')
      expect(get '/articles').to route_to('articles#index')

      # if you want to check params
      expect(get '/articles?page[number]=3').to route_to('articles#index', page: { 'number' => '3' } )
    end
  end

  it 'routes to articles#show' do
    expect(get '/articles/1').to route_to('articles#show', id: '1')
  end
end