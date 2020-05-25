require 'test_helper'

class EatenViewModelTest < ActiveSupport::TestCase
    test "EatenAddMealTest" do

        testUserID =24
        meal = rand(1..6)
        date = Date.today
        time = Time.now.to_s(:time)

        newMeal = EatenViewModel.new(testUserID)
        newMeal = newMeal.addMeal(date, time, meal)

        assert newMeal.present?

        name = 'CustomProductName'
        calories = rand(10.99..99.99)
        protein = rand(0.11..199.99)
        carbs = rand(0.11..199.99)
        fat = rand(0.11..199.99)
        sugars = rand(0.11..199.99)
        fiber = rand(0.11..199.99)
        omega3 = rand(0.111..99.999)
        ala = rand(0.111..99.999)
        sfa = rand(0.111..99.999)
        wnkt = rand(0.111..99.999)
        trans = rand(0.111..99.999)
        cholesterol = rand(0.111..99.999)
        valine = rand(0.111..199.999)
        isoleucine = rand(0.111..199.999)
        leucine = rand(0.111..199.999)
        lysine = rand(0.111..199.999)
        methionine = rand(0.111..199.999)
        threonine = rand(0.111..199.999)
        tryptophan = rand(0.111..199.999)
        phenylalanine = rand(0.111..199.999)
        vitA = rand(0.111..99.999)
        vitB1 = rand(0.111..99.999)
        vitB2 = rand(0.111..99.999)
        vitB3 = rand(0.111..99.999)
        vitB4 = rand(0.111..99.999)
        vitB5 = rand(0.111..99.999)
        vitB6 = rand(0.111..99.999)
        vitB9 = rand(0.111..99.999)
        vitB12 = rand(0.111..99.999)
        vitC = rand(0.111..99.999)
        vitD = rand(0.111..99.999)
        vitE = rand(0.111..99.999)
        vitH = rand(0.111..99.999)
        vitK = rand(0.111..99.999)
        cl = rand(0.111..99.999)
        zn = rand(0.111..99.999)
        f = rand(0.111..99.999)
        p = rand(0.111..99.999)
        i = rand(0.111..99.999)
        mg = rand(0.111..99.999)
        cu = rand(0.111..99.999)
        k = rand(0.111..99.999)
        se = rand(0.111..99.999)
        na = rand(0.111..99.999)
        ca = rand(0.111..99.999)
        fe = rand(0.111..99.999)


        customProduct = EatenViewModel.new(testUserID)
        customProduct = customProduct.addCustomProduct(newMeal,name,calories,protein,carbs,fat,sugars,fiber,omega3,ala,sfa,wnkt,trans,cholesterol,valine,isoleucine,leucine,lysine,methionine,threonine,tryptophan,phenylalanine,vitA,vitB1,vitB2,vitB3,vitB4,vitB5,vitB6,vitB9,vitB12,vitC,vitD,vitE,vitH,vitK,cl,zn,f,p,i,mg,cu,k,se,na,ca,fe)

        assert customProduct == 'success'
        customProduct = EatenViewModel.new(testUserID)
        customProduct = customProduct.findLast
        assert !customProduct.nil?

        howMany = rand(1..10)

        productsIDs = []
        weights = []

        for x in 0..howMany do
            productID = rand(2500..3603)
            if !productsIDs.include?(productID)
                productsIDs << productID
            end
        end
        productsIDs.each_with_index do |product,index|
            weight = rand(1..200)
            weights[index] = weight
        end

        decProduct = EatenViewModel.new(testUserID)

        assert decProduct.decompose(customProduct.id,productsIDs,weights) == 'success'
    end
end