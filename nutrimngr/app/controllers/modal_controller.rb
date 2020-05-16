class ModalController < ActionController::Base
    def modal
        case params['body']
        when 'user_products/show'
            @product = ProductInfoViewModel.new(session[:sessionID])
            @product.getProductInfo(params['product'])
        when 'user_products/edit'
            @product = ProductInfoViewModel.new(session[:sessionID])
            @product.getProductInfo(params['product'])
        when 'recipes/add'
            @recipe = RecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.set(-1,'tmp')                    
        when 'recipes/add_products'
            @recipe = RecipeViewModel.new(session[:sessionID])
            if params['recipe'].present?
                @recipe = RecipeViewModel.new(session[:sessionID])
                @recipe = @recipe.find(params['recipe'])
            else
                @recipe = RecipeViewModel.new(session[:sessionID])
                @recipe = @recipe.findLast
            end
            if @recipe.nil?
                @recipe = @recipe.set(-1,'tmp')
            end
            @products = RecipeProductsViewModel.new(session[:sessionID])
            @products = @products.getProductList(@recipe.id)[:ingredients] rescue []
            @productList = ProductInfoViewModel.new(session[:sessionID])
            @productList = @productList.getProductList
        when 'recipes/edit'
            @recipe = RecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.find(params['recipe'])
            @productList = RecipeProductsViewModel.new(session[:sessionID])
            puts @productList.getProductList(params['recipe'])
            @productList = @productList.getProductList(params['recipe'])[:ingredients]
        when 'recipes/create'
            @recipe = RecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.find(params['recipe'])
            @productList = RecipeProductsViewModel.new(session[:sessionID])
            @productList = @productList.getProductList(@recipe.id)[:ingredients]
            @productWeightList = RecipeProductsViewModel.new(session[:sessionID])
            @productWeightList = @productWeightList.getProductList(@recipe.id)[:ingredientsWeight]
        when 'recipes/measure_recipe'
            @recipe = CompleteRecipeViewModel.new
            @recipe = @recipe.findLast
        when 'meals/add'
            @meal = MealViewModel.new(session[:sessionID])
            @meal = @meal.getMeals
            @session[:meal] = nil
        when 'meal/add_from_recipes'
            @completeRecipes = CompleteRecipeViewModel.new(session[:sessionID])
            @completeRecipes = @completeRecipes.getCompleteRecipeList
            @availableRecipes = @completeRecipes.select{|cr| cr.HasPortions == true || cr.IsWeighted == true}
        when 'meal/add_from_products'
            @products = ProductInfoViewModel.new(session[:sessionID])
            @products = @products.getProductList
        when 'meal/decompose'
            @decomposable = EatenViewModel.new(session[:sessionID])
            @decomposable = @decomposable.findLast
            @products = ProductInfoViewModel.new(session[:sessionID])
            @products = @products.getProductList
        end
        respond_to do |format|
            format.html
            format.js
        end
    end
end