class ProductsController < ApplicationController
    def products
        if !session[:sessionID]
            redirect_to "index/index"
        end
        if session[:message]
            @message=session[:message]
            session[:message]=nil
        end
        @products = ProductInfoViewModel.new(session[:sessionID])
        @products = @products.getProductList
    end
    def searchForNutrient
        if params['searched'].blank?
            render plain: 'Nie wybramo składnika odżywczego.' and return
        end
        if params['sort'] !='1' && params['sort'] !='2'
            render plain: 'Nie wybrano metody sortowania.' and return
        end
        @searched_text = params['searched']
        case params['searched']
        when "Kalorie"
            params['searched'] = "Calories"
        when "Białko"
            params['searched'] = "Protein"
        when "Węglowodany"
            params['searched'] = "Carbs"
        when "Tłuszcz"
            params['searched'] = "Fat"
        when "Błonnik"
            params['searched'] = "Fiber"
        when "Kwasy tł. Omega3"
            params['searched'] = "Omega3"
        when "Kwas tł. ALA"
            params['searched'] = "ALA"
        when "Tłuszcze nasycone"
            params['searched'] = "SFA"
        when "Tłuszcze wielonienasycone"
            params['searched'] = "WNKT"
        when "Tłuszcze trans"
            params['searched'] = "Trans"
        when "Cholesterol"
            params['searched'] = "Cholesterol"
        when "Walina"
            params['searched'] = "Valine"
        when "Izoleucyna"
            params['searched'] = "Isoleucine"
        when "Leucyna"
            params['searched'] = "Leucine"
        when "Lizyna"
            params['searched'] = "Lysine"
        when "Metionina"
            params['searched'] = "Methionine"
        when "Treonina"
            params['searched'] = "Threonine"
        when "Tryptofan"
            params['searched'] = "Tryptophan"
        when "Fenyalanina"
            params['searched'] = "Phenlalanine"
        when "Witamina A"
            params['searched'] = "VitA"
        when "Witamina B1"
            params['searched'] = "VitB1"
        when "Witamina B2"
            params['searched'] = "VitB2"
        when "Witamina B3"
            params['searched'] = "VitB3"
        when "Witamina B4"
            params['searched'] = "VitB4"
        when "Witamina B5"
            params['searched'] = "VitB5"
        when "Witamina B6"
            params['searched'] = "VitB6"
        when "Witamina B9"
            params['searched'] = "VitB9"
        when "Witamina B12"
            params['searched'] = "VitB12"
        when "Witamina C"
            params['searched'] = "VitC"
        when "Witamina D"
            params['searched'] = "VitD"
        when "Witamina E"
            params['searched'] = "VitE"
        when "Witamina H"
            params['searched'] = "VitH"
        when "Witamina K"
            params['searched'] = "VitK"
        when "Chlor"
            params['searched'] = "Cl"
        when "Cynk"
            params['searched'] = "Zn"
        when "Fluor"
            params['searched'] = "F"
        when "Fosfor"
            params['searched'] = "P"
        when "Jod"
            params['searched'] = "I"
        when "Magnez"
            params['searched'] = "Mg"
        when "Miedź"
            params['searched'] = "Cu"
        when "Potas"
            params['searched'] = "K"
        when "Selen"
            params['searched'] = "Se"
        when "Sód"
            params['searched'] = "Na"
        when "Wapń"
            params['searched'] = "Ca"
        when "Żelazo"
            params['searched'] = "Fe"
        end
        searching = ProductInfoViewModel.new(session[:sessionID])
        @products = searching.searchForNutrient(params['searched'],params['sort'])
        render 'products/products'
    end
end