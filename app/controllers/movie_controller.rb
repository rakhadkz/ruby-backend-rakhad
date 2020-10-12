class MovieController < ApplicationController
  def index
    movies = Movie.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Movies loaded', data: movies}, status: :ok
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      render json: {status: 'SUCCESS', message: 'Movie created', data: movie}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Movie not created', data: movie.errors, id: params[:catalog_id]}, status: :unprocessable_entity
    end
  end

  def show
    begin
      catalog = Catalog.find(params[:id])
    rescue => e
      render json: {status: 'ERROR', message: e.message}, status: :not_found
      return
    end
    movies = catalog.movies.order('created_at DESC')
    render json: {status: 'SUCCESS', message: 'Movies loaded', data: movies}, status: :ok
  end

  def update
    movie = Movie.find(params[:id])
    if movie.update_attributes(movie_params)
      render json: {status: 'SUCCESS', message: 'Movie ' + params[:id] + ' updated', data: movie}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Movie not updated', data: movie}, status: :unprocessable_entity
    end
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    render json: {status: 'SUCCESS', message: 'Movie deleted', data: movie}, status: :ok
  end

  private
  def movie_params
    params.permit(:name, :catalog_id)
  end
end
