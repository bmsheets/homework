class AlbumsController < ApplicationController
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

  def album_params
    params.require(:album).permit(:band_id, :title, :year, :live)
  end
end
