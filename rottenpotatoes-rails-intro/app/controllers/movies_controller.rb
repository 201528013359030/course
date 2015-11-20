class MoviesController < ApplicationController
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings={"G" => true, "PG" => true, "PG-13" => true, "R" => true}

    session[:sort]=params[:sort] if params.has_key? 'sort'
    session[:hilite]="hilite" if params.has_key? 'sort'


    session[:ratings]=params[:ratings] if params.has_key? 'ratings'

    if session[:sort]=="title"&&!params[:ratings]
      if session[:ratings]
        @movies = Movie.all.order("#{session[:sort]}").where rating: session[:ratings].keys
        @all_ratings.each { |rating, value| @all_ratings[rating]=false }
        session[:ratings].keys.each { |rating| @all_ratings[rating]=true }
      else
        @movies = Movie.all.order("#{session[:sort]}")
      end
      @title_header=session[:hilite]
    elsif session[:sort]=="release_date"&&!params[:ratings]
      if session[:ratings]
        @movies = Movie.all.order("#{session[:sort]}").where rating: session[:ratings].keys
        @all_ratings.each { |rating, value| @all_ratings[rating]=false }
        session[:ratings].keys.each { |rating| @all_ratings[rating]=true }
      else
        @movies = Movie.all.order("#{session[:sort]}")
      end
      @release_date_header=session[:hilite]
    else
      @movies = Movie.all
    end

    if session[:ratings]&&!params[:sort]
      @movies=Movie.where rating: session[:ratings].keys
      @all_ratings.each { |rating, value| @all_ratings[rating]=false }
      session[:ratings].keys.each { |rating| @all_ratings[rating]=true }
      session[:hilite]=nil
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
end
