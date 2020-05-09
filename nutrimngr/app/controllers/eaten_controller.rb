class EatenController < ApplicationController
    def eaten
    end
    def addMeal
        if params['meal'].blank?
            render plain: 'Pole nazwa nie może być puste.' and return
        end
        if params['date'].blank?
            params['date'] = date.now
        end
        if params['time'].blank?
            params['time'] = time.now
        end
        newEaten = EatenViewModel.new(session[:sessionID])
        @session[:meal] = newEaten.addMeal(params['date'],params['time'],params['meal'])
            if !@session[:meal].nil? 
                render plain: "Choose how"
            else
                render plain: "error"
    end
    def addProduct
        if params['product'].blank?
            render plain: 'Nie wybrano produktu.' and return
        end
        begin
            params['weight'] = Float(params['weight']) 
        rescue
            render plain: 'Wprowadzoną błędną wagę.' and return     
        end
        if params['portion'] <= 0
            render plain: 'Wprowadzoną błędną wagę.' and return     
        end
        newEaten = EatenViewModel.new(session[:sessionID])
        if newEaten.addCompleteRecipe(session[:meal],params['product'],params['weight']) == 'success'
            session[:message]='Dodano spożyty posiłek'
            redirect_to '/meals/meals' 
        end
    end
    def addCustomProduct
        if params['name'].blank? || params['kcal'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return
        end
        begin
            params['protein'] = Float(params['protein']) if !params['protein'].blank?
            params['carbs'] = Float(params['carbs']) if !params['carbs'].blank?
            params['fat'] = Float(params['fat']) if !params['fat'].blank?
            params['sugars'] = Float(params['sugars']) if !params['sugars'].blank?
            params['fiber'] = Float(params['fiber']) if !params['fiber'].blank?
            params['omega3'] = Float(params['omega3']) if !params['omega3'].blank?
            params['ala'] = Float(params['ala']) if !params['ala'].blank?
            params['sfa'] = Float(params['sfa']) if !params['sfa'].blank?
            params['wnkt'] = Float(params['wnkt']) if !params['wnkt'].blank?
            params['trans'] = Float(params['trans']) if !params['trans'].blank?
            params['cholesterol'] = Float(params['cholesterol']) if !params['cholesterol'].blank?
            params['valine'] = Float(params['valine']) if !params['valine'].blank?
            params['isoleucine'] = Float(params['isoleucine']) if !params['isoleucine'].blank?
            params['leucine'] = Float(params['leucine']) if !params['lecuine'].blank?
            params['lysine'] = Float(params['lysine']) if !params['lysine'].blank?
            params['methionine'] = Float(params['methionine']) if !params['methionine'].blank?
            params['threonine'] = Float(params['threonine']) if !params['threonine'].blank?
            params['tryptophan'] = Float(params['tryptophan']) if !params['tryptophan'].blank?
            params['phenylalanine'] = Float(params['pheylalanine']) if !params['phenylalanine'].blank?
            params['vitA'] = Float(params['vitA']) if !params['vitA'].blank?
            params['vitB1'] = Float(params['vitB1']) if !params['vitB1'].blank?
            params['vitB2'] = Float(params['vitB2']) if !params['vitB2'].blank?
            params['vitB3'] = Float(params['vitB3']) if !params['vitB3'].blank?
            params['vitB4'] = Float(params['vitB4']) if !params['vitB4'].blank?
            params['vitB5'] = Float(params['vitB5']) if !params['vitB5'].blank?
            params['vitB6'] = Float(params['vitB6']) if !params['vitB6'].blank?
            params['vitB9'] = Float(params['vitB9']) if !params['vitB9'].blank?
            params['vitB12'] = Float(params['vitB12']) if !params['vitB12'].blank?
            params['vitC'] = Float(params['vitC']) if !params['vitC'].blank?
            params['vitD'] = Float(params['vitD']) if !params['vitD'].blank?
            params['vitE'] = Float(params['vitE']) if !params['vitE'].blank?
            params['vitH'] = Float(params['vitH']) if !params['pvitH'].blank?
            params['vitK'] = Float(params['vitK']) if !params['vitk'].blank?
            params['cl'] = Float(params['cl']) if !params['cl'].blank?
            params['zn'] = Float(params['zn']) if !params['zn'].blank?
            params['f'] = Float(params['f']) if !params['f'].blank?
            params['p'] = Float(params['p']) if !params['p'].blank?
            params['i'] = Float(params['i']) if !params['i'].blank?
            params['mg'] = Float(params['mg']) if !params['mg'].blank?
            params['cu'] = Float(params['cu']) if !params['cu'].blank?
            params['k'] = Float(params['k']) if !params['k'].blank?
            params['se'] = Float(params['se']) if !params['se'].blank?
            params['na'] = Float(params['na']) if !params['na'].blank?
            params['ca'] = Float(params['ca']) if !params['ca'].blank?
            params['fe'] = Float(params['fe']) if !params['fe'].blank?
        rescue
            render plain: "Wprowadzono błędną wartość"  and return
        end
        newEaten = EatenViewModel.new(session[:sessionID])
        if params['decompose'] == 'on'
            if newEaten.addCustomProduct(session[:meal],params['name'], params['kcal'], params['protein'], params['cabs'], params['fat'], params['sugars'], params['fiber'], params['omega3'], params['ala'], params['sfa'], params['wnkt'], params['trans'], params['cholesterol'], params['valine'], params['isoleucine'], params['leucine'], params['lysine'], params['methionine'], params['threonine'], params['tryptophan'], params['phenylalanine'], params['vitA'], params['vitB1'], params['vitB2'], params['vitB3'], params['vitB4'], params['vitB5'], params['vitB6'], params['vitB9'], params['vitB12'], params['vitC'], params['vitD'], params['vitE'], params['vitH'], params['vitK'], params['cl'], params['zn'], params['f'], params['p'], params['i'], params['mg'], params['cu'], params['k'], params['se'], params['na'], params['ca'], params['fe'], weight) == 'success'
                render plain: 'Decompose'
            end 
        elsif newEaten.addCustomProduct(session[:meal],params['name'], params['kcal'], params['protein'], params['cabs'], params['fat'], params['sugars'], params['fiber'], params['omega3'], params['ala'], params['sfa'], params['wnkt'], params['trans'], params['cholesterol'], params['valine'], params['isoleucine'], params['leucine'], params['lysine'], params['methionine'], params['threonine'], params['tryptophan'], params['phenylalanine'], params['vitA'], params['vitB1'], params['vitB2'], params['vitB3'], params['vitB4'], params['vitB5'], params['vitB6'], params['vitB9'], params['vitB12'], params['vitC'], params['vitD'], params['vitE'], params['vitH'], params['vitK'], params['cl'], params['zn'], params['f'], params['p'], params['i'], params['mg'], params['cu'], params['k'], params['se'], params['na'], params['ca'], params['fe'], weight) == 'success'
            session[:message]='Dodano spożyty produkt.'
            redirect_to '/meals/meals'
        end
    end
    def addCompleteRecipe
        if params['meal'].blank?
            render plain: 'Nie wybrano potrawy.' and return
        end
        begin
            params['portion'] = Float(params['portion']) 
        rescue
            render plain: 'Wprowadzoną błędną wartość porcji.' and return     
        end
        if params['portion'] <= 0
            render plain: 'Wprowadzoną błędną wartość porcji.' and return     
        end
        newEaten = EatenViewModel.new(session[:sessionID])
        eatenID = newEaten.addCompleteRecipe(session[:meal],params['meal'],params['portion'])
        if eatenID > 0
            newEaten.calculateMealRequisition(eatenID)
        end
    end
    def calculateMealRequisition
        newEaten = EatenViewModel.new(session[:sessionID])
        if newEaten.calculateMealRequisition(eatenID) == 'success'
            session[:message]='Dodano spożyty posiłek'
            redirect_to '/meals/meals' 
        end
    end
    def calculateDailyRequisition
    end
    def decompose
        if params['product'].blank?
            render plain: 'Nie wybrano żadnego składnika.' and return
        end
        begin
            params['weight'] = Float(params['weight']) 
        rescue
            render plain: 'Wprowadzoną błędną wartość porcji.' and return     
        end
        if params['weight'] <= 0
            render plain: 'Wprowadzoną błędną wagę.' and return     
        end
        newEaten = EatenViewModel.new(session[:sessionID])
        if newEaten.decompose(params['customProduct'],params['product'],params['weight']) == "success"
            session[:message]='Dodano zdekomponowany produkt'
            redirect_to '/meals/meals' 
        end
    end
end