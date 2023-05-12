class ListsController < ApplicationController

  def index
    @lists = List.all
    @movies = Movie.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # raise
    @list = List.find(params[:id])
    # raise
    @list.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
