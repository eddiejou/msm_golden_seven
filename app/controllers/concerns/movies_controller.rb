class MoviesController <ApplicationController

  def index
    @movies = Movie.all
    render("/movies/index.html.erb")
  end

  def show
    @movie = Movie.find(params[:id])
    render("/movies/show.html.erb")
  end

  def new_form
    render("/movies/new_form.html.erb")
  end

  def new_row
    movie = Movie.new
    movie.title = params[:title]
    movie.year = params[:year]
    movie.description = params[:description]
    movie.duration = params[:duration]
    movie.image_url = params[:image_url]
    movie.save
    redirect_to("/movies")
  end

  def edit_form
    @movie = Movie.find(params[:id])
    render("/movies/edit_form.html.erb")
  end

  def update_row
    movie = Movie.find(params[:id])
    movie.title = params[:title]
    movie.year = params[:year]
    movie.description = params[:description]
    movie.duration = params[:duration]
    movie.image_url = params[:image_url]
    movie.save
    redirect_to("/movies/#{movie.id}")
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    render("/movies/destroy_movie.html.erb")
  end

end
