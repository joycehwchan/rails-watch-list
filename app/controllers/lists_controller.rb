class ListsController < ApplicationController
  before_action :set_list, only: %i[show destroy]

  def index
    @list = List.new
    @lists = List.all
    # raise
  end

  def show
    @bookmark = Bookmark.new
    @movies = Movie.where.not(id: @list.movies).order(title: :asc)
  end

  def new
    @list = List.new
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      # render :new, status: :unprocessable_entity
      render 'lists/index', status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to root_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
