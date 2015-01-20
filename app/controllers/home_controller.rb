class HomeController < ApplicationController
  def index
  	@speakers = Speaker.all
  	render layout: 'home_layout.html.erb'
  end
end
