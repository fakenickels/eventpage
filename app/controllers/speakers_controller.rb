class SpeakersController < ApplicationController
  before_action :set_speaker, only: [:show, :edit, :update, :destroy]
  before_action :is_admin, only: [:new, :create, :edit, :update, :destroy]

  respond_to :html

  def index
    @speakers = Speaker.all
    respond_with(@speakers)
  end

  def show
    respond_with(@speaker)
  end

  def new
    @speaker = Speaker.new
    respond_with(@speaker)
  end

  def edit
  end

  def create
    @speaker = Speaker.new(speaker_params)
    @speaker.save
    respond_with(@speaker)
  end

  def update
    @speaker.update(speaker_params)
    respond_with(@speaker)
  end

  def destroy
    @speaker.destroy
    respond_with(@speaker)
  end

  private
    def set_speaker
      @speaker = Speaker.find(params[:id])
    end

    def speaker_params
      params.require(:speaker).permit(:bio, :description, :user_id)
    end

    def is_admin
      if user_signed_in?
        if !current_user.is?(:admin)
          redirect_to root_path
        end
      else
        redirect_to root_path
      end
    end
end
