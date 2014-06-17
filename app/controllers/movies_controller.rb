class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  def show
    @movie= Movie.find(params[:id])
    @actor= @movie.actors
  end
  def new
    @movie = Movie.new
    @actors = Actor.all
    @rating = Rating.new
  end

  def create
    #puts params[:actor]
    @movie = Movie.new(movies_params)
    if @movie.save
      redirect_to movies_path
    else
      render action: 'new'
    end
  end

  def movies_params
    #puts params.require(:actor).permit(:name)
    params.require(:movie).permit(:id, :name, songs_attributes: [:id, :name,:composer, :_destroy], movie_actors_attributes: [:id, :actor_id, :role, :_destroy])
  end
  def edit
    @movie = Movie.find(params[:id])
    
  end
  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(movies_params)
       redirect_to movies_path
    else
       render action: 'edit'
    end 
  end
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end


end
