class MusicStoresController < ApplicationController
  def index
    @music_stores = MusicStore.all
  end

  def new
  end

  def create
    music_store = MusicStore.create!(music_store_params)
    redirect_to '/music_stores'
  end

  def edit
    @music_store = MusicStore.find(params[:id])
  end

  def update
    music_store = MusicStore.find(params[:id])
    music_store.update(music_store_params)
    redirect_to '/music_stores'
  end

  def destroy
    music_store = MusicStore.find(params[:id])
    music_store.destroy
    redirect_to '/music_stores'
  end

  def show
    @music_store = MusicStore.find(params[:id])
  end

private
  def music_store_params
    params.permit(:name, :rents, :lesson_cost)
  end
end