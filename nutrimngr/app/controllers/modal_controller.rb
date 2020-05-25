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
            @productList = @productList.getProductList(params['recipe'])[:ingredients]
        when 'recipes/create'
            @recipe = RecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.find(params['recipe'])
            @productList = RecipeProductsViewModel.new(session[:sessionID])
            @productList = @productList.getProductList(@recipe.id)[:ingredients]
            @productWeightList = RecipeProductsViewModel.new(session[:sessionID])
            @productWeightList = @productWeightList.getProductList(@recipe.id)[:ingredientsWeight]
        when 'recipes/measure'
            @recipe = CompleteRecipeViewModel.new(session[:sessionID])
            if !params['recipe'].present?
                @recipe = @recipe.findLastComplete
            end
        when 'meals/add'
            @meal = MealViewModel.new(session[:sessionID])
            @meal = @meal.getMeals
            session[:meal] = nil
        when 'meals/how_to_add'
            @recipe = CompleteRecipeViewModel.new(session[:sessionID])
            @recipe = @recipe.findLastComplete
        when 'meals/add_from_recipes'
            @completeRecipes = CompleteRecipeViewModel.new(session[:sessionID])
            @completeRecipes = @completeRecipes.getCompleteRecipeList
            @availableRecipes = @completeRecipes.select{|cr| cr.HasPortions == true || cr.IsWeighted == true}
            @recipes = RecipeViewModel.new(session[:sessionID])
            @recipes = @recipes.getRecipeList
        when 'meals/add_from_products'
            @productList = ProductInfoViewModel.new(session[:sessionID])
            @productList = @productList.getProductList
        when 'meals/decompose'
            @decomposable = EatenViewModel.new(session[:sessionID])
            @decomposable = @decomposable.findLast
            @decName = ''
            if !@decomposable.CustomProductName.nil?
                @decName = @decomposable.CustomProductName
            elsif !decomposable.IDPr.nil?
                @decName = ProductInfoDbModel.where(id:@decomposable.IDPr).first.Name
            elsif meal.IDDR.present?
                completeRecipeID = CompleteRecipeDbModel.where(id:@decomposable.IDDR).first.IDR
                @decName = RecipeDbModel.where(id:completeRecipeID).first.Name
            else
                return "Error"
            end
            @products = ProductInfoViewModel.new(session[:sessionID])
            @products = @products.getProductList
        end
        respond_to do |format|
            format.html
            format.js
        end
    end
end