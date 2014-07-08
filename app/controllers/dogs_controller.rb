class DogsController < ApplicationController

  def show
    @dog = Dog.find(params[:id])
  end

end
