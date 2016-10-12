class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    
  end
  
  def show
    id = params[:id]
    @movie =Movie.find(id)
  end
  def new
    @movie = Movie.new
    # default: render 'new' template
  end
  
  
   def create
    #@movie = Movie.create!(params[:movie]) #old way
    @movie = Movie.create!(movie_params)  # new way
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
    @movie= movie.create!(params[:movie])
    flash[:notice]= "#{@movie.title} was successfully created."
    redirect_to movies_path
   end
  
  
   def edit
  @movie = Movie.find params[:id]
   end
   
   
    def update
    @movie = Movie.find params[:id]
    #@movie.update_attributes!(params[:movie])  # old way
    @movie.update_attributes!(movie_params)  # new way  
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
    end


def destroy
  @movie = Movie.find(params[:id])
  @movie.destroy
  flash[:notice] = "Movie '#{@movie.title}' deleted."
  redirect_to movies_path
end
private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
  
  