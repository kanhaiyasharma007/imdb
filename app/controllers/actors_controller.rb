class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end
  def show
    @actor= Actor.find(params[:id])
    @movies = @actor.movies
    @rol= @actor.movie_actors
  end
  def new
    @actor = Actor.new
  end

  def create
    #puts params[:actor]
    @actor = Actor.new(actors_params)
    if @actor.save
      redirect_to actors_path
    else
      render action: 'new'
    end
  end

  def actors_params
    #puts params.require(:actor).permit(:name)
    params.require(:actor).permit(:name)
  end
  def edit
    @actor = Actor.find(params[:id])
    
  end
  def update
    @actor = Actor.find(params[:id])
    if @actor.update_attributes(actors_params)
       redirect_to actors_path
    else
       render action: 'edit'
    end 
  end
  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
    redirect_to actors_path
  end


end
