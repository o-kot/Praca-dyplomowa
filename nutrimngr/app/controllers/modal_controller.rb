class ModalController < ActionController::Base
    def modal
        case params['body']
        when 'user_products/show'
            @product = ProductInfoViewModel.new(session[:sessionID])
            @product.getProductInfo(params['product'])
        when 'user_products/edit'
            @userProduct = ProductInfoViewModel.new(session[:sessionID])
            @userProduct = @userProduct.getProducInfo(params['product'])        
        when 'recipes/add_products'
            @recipe = RecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.find(params['recipe'])
            @products = ProductInfoViewModel.new(session[:sessionID])
            @products = @products.getProductList(@recipe.id)['ingredients']
            @productsInfo = @products.map{|product|{"name" => product.Name, "value" => product.id}}
        when 'recipes/edit'
            @recipe = RecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.find(params['recipe'])
            @productList = RecipeProductViewModel.new(session[:sessionID])
            @productList = @productList.getProductList(params['recipe'])['ingredients']
        when 'recipes/create'
            @recipe = RecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.find(params['recipe'])
            @productList = RecipeProductsViewModel.new(session[:sessionID])
            @productList = @productList.getProductList(@recipe.id)['ingredients']
            @productWeightList = RecipeProductsViewModel.new(session[:sessionID])
            @productWeightList = @productWeightList.getProductList(@recipe.id)['ingredientsWeight']
        when 'meals/add'
            @meal = MealViewModel.new(session[:sessionID])
            @meal = @meal.getMeals
            @session[:meal] = nil
        when 'meal/add_from_recipes'
            @completeRecipes = CompleteRecipeViewModel.new(session[:sessionID])
            @completeRecipes = @CompleteRecipes.getCompleteRecipeList
            @availableRecipes = @completeRecipes.where(HasPortions == true || IsWeighted == true)
        when 'meal/add_from_products'
            @products = ProductInfoViewModel.new(session[:sessionID])
            @products.getProductList
        when 'meal/decompose'
            @decomposable = EatenViewModel.where(IDU:session[:sessionID],!CustomProductName.nil?).last
        end
    end
        respond_to do |format|
            format.html
            format.js
        end
    end
end