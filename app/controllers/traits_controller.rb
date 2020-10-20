class TraitsController < ApplicationController
  before_action :find_trait, only: [:show, :edit, :create, :destroy]

  def index
    @traits = Trait.all
  end

  def new
    @trait = Trait.new
  end

  def create
    @trait = Trait.new(trait_params)
      if @trait.save
        redirect_to trait_path(@trait)
      else
        render 'new'
    end
  end

  def show;end
  def edit;end

  def update
    @trait.update(trait_params)
    redirect_to trait_path(@trait)
  end

  def destroy
    @trait.destroy
    redirect_to traits_path
  end

  private


  def find_trait
    @trait = Trait.find(params[:id])
  end

  def trait_params
    params.require(:trait).permit(:name, :description, :price_hour)
  end
end
