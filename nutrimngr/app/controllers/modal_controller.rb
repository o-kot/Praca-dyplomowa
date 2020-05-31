require 'date'

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
        when 'meals/other_nutrients'
            @today = Date.today
            @eaten = EatenViewModel.new(session[:sessionID])
            @eatenMeals = @eaten.getEaten(@today)
            @eatenMeals = @eatenMeals[:mealsList] 
            @eatenMeals = @eatenMeals.map do |eaten|
                {
                    id: eaten.id,
                    VitA: eaten.VitA, 
                    VitB1: eaten.VitB1,
                    VitB2: eaten.VitB2,
                    VitB3: eaten.VitB3,
                    VitB4: eaten.VitB4,
                    VitB5: eaten.VitB5,
                    VitB6: eaten.VitB6,
                    VitB9: eaten.VitB9,
                    VitB12: eaten.VitB12,
                    VitC: eaten.VitC,
                    VitD: eaten.VitD,
                    VitE: eaten.VitE,
                    VitH: eaten.VitH,
                    VitK: eaten.VitK,
                    Cl: eaten.Cl,
                    Zn: eaten.Zn,
                    F: eaten.F,
                    P: eaten.P,
                    I: eaten.I,
                    Mg: eaten.Mg,
                    Cu: eaten.Cu,
                    K: eaten.K,
                    Se: eaten.Se,
                    Na: eaten.Na,
                    Ca: eaten.Ca,
                    Fe: eaten.Fe
                }
            end
            @gotten = @eaten.calculateDailyRequisition(@today)
            @requisition = UserRequisitionViewModel.new(session[:sessionID])
            @requisition = @requisition.getUserRequisition

            @a_sum = 0
            @eatenMeals.each {|eat| a_sum += eat[:VitA].nil? ? 0 : eat[:VitA]}
            @b1_sum = 0
            @eatenMeals.each {|eat| b1_sum += eat[:VitB1].nil? ? 0 : eat[:VitB1]}
            @b2_sum = 0
            @eatenMeals.each {|eat| b2_sum += eat[:VitB2].nil? ? 0 : eat[:VitB2]}
            @b3_sum = 0
            @eatenMeals.each {|eat| b3_sum += eat[:VitB3].nil? ? 0 : eat[:VitB3]}
            @b4_sum = 0
            @eatenMeals.each {|eat| b4_sum += eat[:VitB4].nil? ? 0 : eat[:VitB4]}
            @b5_sum = 0
            @eatenMeals.each {|eat| b5_sum += eat[:VitB5].nil? ? 0 : eat[:VitB5]}
            @b6_sum = 0
            @eatenMeals.each {|eat| b6_sum += eat[:VitB6].nil? ? 0 : eat[:VitB6]}
            @b9_sum = 0
            @eatenMeals.each {|eat| b9_sum += eat[:VitB9].nil? ? 0 : eat[:VitB9]}
            @b12_sum = 0
            @eatenMeals.each {|eat| b12_sum += eat[:VitB12].nil? ? 0 : eat[:VitB12]}
            @c_sum = 0
            @eatenMeals.each {|eat| c_sum += eat[:VitC].nil? ? 0 : eat[:VitC]}
            @d_sum = 0
            @eatenMeals.each {|eat| d_sum += eat[:VitD].nil? ? 0 : eat[:VitD]}
            @e_sum = 0
            @eatenMeals.each {|eat| e_sum += eat[:VitE].nil? ? 0 : eat[:VitE]}
            @h_sum = 0
            @eatenMeals.each {|eat| h_sum += eat[:VitH].nil? ? 0 : eat[:VitH]}
            @vitk_sum = 0
            @eatenMeals.each {|eat| vitk_sum += eat[:VitK].nil? ? 0 : eat[:VitK]}
            @cl_sum = 0
            @eatenMeals.each {|eat| cl_sum += eat[:Cl].nil? ? 0 : eat[:Cl]}
            @zn_sum = 0
            @eatenMeals.each {|eat| zn_sum += eat[:Zn].nil? ? 0 : eat[:Zn]}
            @f_sum = 0
            @eatenMeals.each {|eat| f_sum += eat[:F].nil? ? 0 : eat[:F]}
            @p_sum = 0
            @eatenMeals.each {|eat| p_sum += eat[:P].nil? ? 0 : eat[:P]}
            @i_sum = 0
            @eatenMeals.each {|eat| i_sum += eat[:I].nil? ? 0 : eat[:I]}
            @mg_sum = 0
            @eatenMeals.each {|eat| mg_sum += eat[:Mg].nil? ? 0 : eat[:Mg]}
            @cu_sum = 0
            @eatenMeals.each {|eat| cu_sum += eat[:Cu].nil? ? 0 : eat[:Cu]}
            @k_sum = 0
            @eatenMeals.each {|eat| k_sum += eat[:K].nil? ? 0 : eat[:K]}
            @se_sum = 0
            @eatenMeals.each {|eat| se_sum += eat[:Se].nil? ? 0 : eat[:Se]}
            @na_sum = 0
            @eatenMeals.each {|eat| na_sum += eat[:Na].nil? ? 0 : eat[:Na]}
            @ca_sum = 0
            @eatenMeals.each {|eat| ca_sum += eat[:Ca].nil? ? 0 : eat[:Ca]}   
            @fe_sum = 0
            @eatenMeals.each {|eat| fe_sum += eat[:Fe].nil? ? 0 : eat[:Fe]}            
        end
        respond_to do |format|
            format.html
            format.js
        end
    end
end