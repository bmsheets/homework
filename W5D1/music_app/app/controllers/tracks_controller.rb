class TracksController < ApplicationController
  def create
  end

  def new
    render :new
  end

  def edit
    render :edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :bonus, :lyrics)
  end
end
