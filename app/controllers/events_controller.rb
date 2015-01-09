class EventsController < ApplicationController
	
	def edit
	end

	def update
		if @event_main.update(event_params)
			redirect_to	root_path, notice: 'Banner alterado com sucesso.'
		else
			render 'update'
		end
	end

private
	def event_params
		params.require(:event).permit(:event_id, :name, :banner)
	end
end
