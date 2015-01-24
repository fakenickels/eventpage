class HomeController < ApplicationController
  def index
  	@speakers = Speaker.all
  	@courses = Course.all

  	render layout: 'home_layout.html.erb'
  end
end
