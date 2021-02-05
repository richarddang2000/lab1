class DemoController < ApplicationController
  layout false
  
  def index
	#render ('index')
	@array = [1,2,3,4,5]
	@id = params['id']
	@page = params[:page]
  end
  
  def hello
	#render ('hello')
	#redirect_to(:controller => 'demo', :action => 'index')
  end
  
end
