class CatalogController < ApplicationController
  def index
    catalogs = Catalog::getAll
    render json: {status: 'SUCCESS', message: 'Catalogs loaded', data: catalogs}, status: :ok
  end

  def create
    catalog = Catalog.new(catalog_params)
    if catalog.save
      render json: {status: 'SUCCESS', message: 'Catalog created', data: catalog}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Catalog not created', data: catalog.errors}, status: :unprocessable_entity
    end
  end

  def show
    begin
      catalog = Catalog::findOne(params[:id])
    rescue => e
      render json: {status: 'ERROR', message: e.message}, status: :not_found
      return
    end
    render json: {status: 'SUCCESS', message: 'Catalog ' + params[:id] + ' loaded', data: catalog}, status: :ok
  end

  def update
    catalog = Catalog.find(params[:id])
    if catalog.update_attributes(catalog_params)
      render json: {status: 'SUCCESS', message: 'Catalog ' + params[:id] + ' updated', data: catalog}, status: :ok
    else
      render json: {status: 'ERROR', message: 'Catalog not updated', data: catalog}, status: :unprocessable_entity
    end
  end

  def destroy
    catalog = Catalog.find(params[:id])
    catalog.destroy
    render json: {status: 'SUCCESS', message: 'Catalog deleted', data: catalog}, status: :ok
  end

  private
  def catalog_params
    params.permit(:title)
  end
end
