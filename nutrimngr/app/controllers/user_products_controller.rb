class UserProductsController < ApplicationController
    def user_products
        if !session[:sessionID]
            redirect_to "index/index"
        end
        if session[:message]
            @message=session[:message]
            session[:message]=nil
        end
        @userProducts = ProductInfoViewModel.new(session[:sessionID])
        @userProducts = @userProducts.getProductList(true)
        @searched = nil
        if params['searched'].present?
            @searched = @userProducts.find{|up| up.Name == params['searched']}
            if @searched.nil?
                @error = 'Wybrany produkt nie istnieje!'
            end
        end
    end
    def add
        if params['name'].blank? || params['kcal'].blank?
            render plain: 'Formularz zawiera niewypełnione pola.' and return
        end
        if params['defaultWeight'] != 'on' && params['weight'].blank?
            render plain: 'Podaj wagę produktu, której dotyczącą wprowadzone informacje.' and return
        end
        begin
            params['kcal'] = Float(params['kcal'])
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
            params['leucine'] = Float(params['leucine']) if !params['leucine'].blank?
            params['lysine'] = Float(params['lysine']) if !params['lysine'].blank?            
            params['methionine'] = Float(params['methionine']) if !params['methionine'].blank?
            params['threonine'] = Float(params['threonine']) if !params['threonine'].blank?            
            params['tryptophan'] = Float(params['tryptophan']) if !params['tryptophan'].blank?            
            params['phenylalanine'] = Float(params['phenylalanine']) if !params['phenylalanine'].blank?            
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
            params['vitH'] = Float(params['vitH']) if !params['vitH'].blank?
            params['vitK'] = Float(params['vitK']) if !params['vitK'].blank?
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
            render plain: "Wprowadzono błędną wartość" and return
        end
        if params['kcal'].to_f < 0 || params['protein'].to_f < 0 || params['carbs'].to_f < 0 || params['fat'].to_f < 0 || params['sugars'].to_f < 0 || params['fiber'].to_f < 0 || params['omega3'].to_f < 0 || params['ala'].to_f < 0 || params['sfa'].to_f < 0 || params['wnkt'].to_f < 0 || params['trans'].to_f < 0 || params['cholesterol'].to_f < 0 || params['valine'].to_f < 0 || params['isoleucine'].to_f < 0 || params['leucine'].to_f < 0 || params['lysine'].to_f < 0 || params['methionine'].to_f < 0 || params['threonine'].to_f < 0 || params['tryptophan'].to_f < 0 || params['phenylalanine'].to_f < 0 || params['vitA'].to_f < 0 || params['vitB1'].to_f < 0 || params['vitB2'].to_f < 0 || params['vitB3'].to_f < 0 || params['vitB4'].to_f < 0 || params['vitB5'].to_f < 0 || params['vitB6'].to_f < 0 || params['vitB9'].to_f < 0 || params['vitB12'].to_f < 0 || params['vitC'].to_f < 0 || params['vitD'].to_f < 0 || params['vitE'].to_f < 0 || params['vitH'].to_f < 0 || params['vitK'].to_f < 0 || params['cl'].to_f < 0 || params['zn'].to_f < 0 || params['f'].to_f < 0 || params['p'].to_f < 0 || params['i'].to_f < 0 || params['mg'].to_f < 0 || params['cu'].to_f < 0 || params['k'].to_f < 0 || params['se'].to_f < 0 || params['na'].to_f < 0 || params['ca'].to_f < 0 || params['fe'].to_f < 0
            render plain: 'Wartość pola nie może być mniejsza od 0' and return
        end
        weight = -1
        if params['defaultWeight'] == 'on'
            weight = 100
        else
            begin
                weight = Float(params['weight'])
                if weight < 0
                    render plain: "Waga nie może być ujemna" and return
                end
            rescue
                render plain: "Wprowadzono nieprawidłową wartość wagi" and return
            end
        end
        newUserProduct = ProductInfoViewModel.new(session[:sessionID])
        if(params['comeback']=='true')
            if newUserProduct.addUserProduct(params['name'], params['kcal'], params['protein'], params['carbs'], params['fat'], params['sugars'], params['fiber'], params['omega3'], params['ala'], params['sfa'], params['wnkt'], params['trans'], params['cholesterol'], params['valine'], params['isoleucine'], params['leucine'], params['lysine'], params['methionine'], params['threonine'], params['tryptophan'], params['phenylalanine'], params['vitA'], params['vitB1'], params['vitB2'], params['vitB3'], params['vitB4'], params['vitB5'], params['vitB6'], params['vitB9'], params['vitB12'], params['vitC'], params['vitD'], params['vitE'], params['vitH'], params['vitK'], params['cl'], params['zn'], params['f'], params['p'], params['i'], params['mg'], params['cu'], params['k'], params['se'], params['na'], params['ca'], params['fe'], weight) == 'success'
                render plain: 'Comeback' and return
            end
        elsif newUserProduct.addUserProduct(params['name'], params['kcal'], params['protein'], params['carbs'], params['fat'], params['sugars'], params['fiber'], params['omega3'], params['ala'], params['sfa'], params['wnkt'], params['trans'], params['cholesterol'], params['valine'], params['isoleucine'], params['leucine'], params['lysine'], params['methionine'], params['threonine'], params['tryptophan'], params['phenylalanine'], params['vitA'], params['vitB1'], params['vitB2'], params['vitB3'], params['vitB4'], params['vitB5'], params['vitB6'], params['vitB9'], params['vitB12'], params['vitC'], params['vitD'], params['vitE'], params['vitH'], params['vitK'], params['cl'], params['zn'], params['f'], params['p'], params['i'], params['mg'], params['cu'], params['k'], params['se'], params['na'], params['ca'], params['fe'], weight) == 'success'
            session[:message]='Produkt został zapisany.'
            redirect_to '/user_products/user_products'
        else
            render plain: newUserProduct.addUserProduct(params['name'], params['kcal'], params['protein'], params['carbs'], params['fat'], params['sugars'], params['fiber'], params['omega3'], params['ala'], params['sfa'], params['wnkt'], params['trans'], params['cholesterol'], params['valine'], params['isoleucine'], params['leucine'], params['lysine'], params['methionine'], params['threonine'], params['tryptophan'], params['phenylalanine'], params['vitA'], params['vitB1'], params['vitB2'], params['vitB3'], params['vitB4'], params['vitB5'], params['vitB6'], params['vitB9'], params['vitB12'], params['vitC'], params['vitD'], params['vitE'], params['vitH'], params['vitK'], params['cl'], params['zn'], params['f'], params['p'], params['i'], params['mg'], params['cu'], params['k'], params['se'], params['na'], params['ca'], params['fe'], weight)
        end
    end
    def edit
        edited = {}
        params.each do |key,value|
            if !value.blank? && key=="Name"
                edited[key]=value
            elsif !value.blank? && key!='defaultWeight' && key!='weight' && key!='authenticity_token' && key!='product' && key!='controller' && key!='action'
                begin
                    edited[key]=Float(value)   
                    if value.to_f < 0
                        render plain: "Wartość pola nie może być ujemna" and return
                    end           
                rescue
                    render plain: "Wprowadzono nieprawidłową wartość pola" and return
                end
            elsif key=='defaultWeight' && value == 'on'
                edited['weight']=100
            elsif key=='weight' && !value.blank?
                begin
                    edited[key]=Float(value)
                    if value.to_f < 0
                        render plain: "Wartość pola nie może być ujemna" and return
                    end 
                rescue  
                    render plain: "Wprowadzono nieprawidłową wartość pola waga" and return
                end                                
            elsif key=='weight' && value.blank?
                render plain: "Pole waga nie może być puste" and return
            end
        end
        editedProduct = ProductInfoViewModel.new(session[:sessionID])
        if editedProduct.editProductInfo(params['product'],edited) == 'success'
            session[:message]='Dane produktu zostały zmienione.'
            redirect_to '/user_products/user_products'
        else
            render plain: editedProduct.editProductInfo(params['product'],edited)
        end
    end
    def delete
        userProduct = ProductInfoViewModel.new(session[:sessionID])
        userProduct.deleteUserProduct(params['product'])
        redirect_to '/user_products/user_products'
    end
end