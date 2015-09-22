class SitesController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new site_params

    if @site.save
      redirect_to @site, notice: "Site cadastrado com sucesso!"
    else
      render 'new', nocite: "Falha ao cadastrar Site!"
    end
  end

  def show
  end 

  def edit
  end

  def update
    if @site.update site_params
      redirect_to @site, notice: "Site alterado com sucesso!"
    else
      render 'edit'
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_path
  end

  private

  def site_params
    params.require(:site).permit(:name, :link, :logo, :description, :category_id, :product_link_tag, :price_tag, :image_tag, :description_tag, :category_tag, :status)
  end

  def find_post
    @site = Site.find(params[:id])
  end
end
