class CompleteRecipeController < ApplicationController
    def completeRecipe
    end
    def weightProducts
        params['ingredientID'].each_with_index do |id,index|
            weight = params['ingredientWeight'][index]
            if !weight.blank?
                begin
                    weight = Float(weight.gsub(',','.'))
                    if weight < 0
                        render plain: "Waga nie może być ujemna"  and return
                    end
                    newWeighted = RecipeProductsViewModel.new(session[:sessionID])
                    newWeighted.weightProduct(params['recipe'],id,weight)
                rescue
                    render plain: "Wprowadzono błędną wartość"  and return
                end
            else
                next
            end
        end
        newCompleteRecipe = CompleteRecipeViewModel.new(session[:sessionID])
        newCompleteRecipeID = newCompleteRecipe.createCompleteRecipe(params['recipe'])
        if newCompleteRecipeID == 'NoWeight'
            render plain: 'Nie można stworzyć potrawy - nie podano wagi żadnego składnika' and return
        end
        newCompleteRecipe.calculateNutrition(newCompleteRecipeID)
        if params['goToPortioning'] == 'on'
            render plain: 'Go to portioning' and return
        else
            session[:message]='Stworzono potrawę z przepisu'
            redirect_to '/recipes/recipes'
        end
    end
    def measureRecipe
        if params['howToMeasure'].blank?
            render plain: "Nie wybrano sposobu pomiaru"  and return
        elsif params['measurement'].blank?
            render plain: "Nie wprowadzono wagi albo liczby porcji" and return
        end
        begin
            params['measurement'] = Integer(params['measurement'])
            if params['measurement'] < 0
                render plain: "Wartość pola nie może być ujemna"  and return
            end
        rescue
            render plain: "Wprowadzono błędną wartość pomiaru"  and return
        end
        newCompleteRecipe = CompleteRecipeViewModel.new(session[:sessionID])
        if newCompleteRecipe.measureRecipe(params['recipe'],params['howToMeasure'],params['measurement']) == 'success'
            session[:message]='Potrawa jest gotowa'
            redirect_to '/recipes/recipes'
        else
            render plain: newCompleteRecipe.measureRecipe(params['recipe'],params['howToMeasure'],params['measurement'])
        end
    end
    def markAsEaten
        newCompleteRecipe = CompleteRecipeViewModel.new(session[:sessionID])
        if newCompleteRecipe.markAsEaten(params['recipe']) == 'success'
            session[:message]='Potrawa się skończyła.'
            redirect_to '/recipes/recipes'
        end
    end
end