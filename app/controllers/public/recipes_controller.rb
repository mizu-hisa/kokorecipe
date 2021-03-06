class Public::RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.customer = current_customer
    @recipe.save
    redirect_to customer_path(@recipe.id)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_comment = RecipeComment.new
    @customer = @recipe.customer
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to root_path
  end


  # 投稿データのストロングパラメータ
  private

  def recipe_params
    params.require(:recipe).permit(:title, :detail, :image)
  end
end

