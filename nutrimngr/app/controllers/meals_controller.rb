require 'date'

class MealsController < ApplicationController
    def meals
        if !session[:sessionID]
            redirect_to "index/index"
        end
        if session[:message]
            @message=session[:message]
            session[:message]=nil
        end
        @tmp=''
        @productList = ProductInfoViewModel.new(session[:sessionID])
        @productList = @productList.getProductList
        @day = params['day'].present? ? Date.parse(params['day']) : Date.today
        @meals = MealViewModel.new(session[:sessionID])
        @meals = @meals.getMeals
        @eaten = EatenViewModel.new(session[:sessionID])
        @eatenMeals = @eaten.getEaten(@day)
        @eatenMeals = @eatenMeals[:mealsList]
        @eatenMeals = @eatenMeals.map do |eaten|
            {
                id: eaten.id,
                Calories: eaten.Calories,
                IDP: eaten.IDP,
                Time: eaten.Time,
                Carbs: eaten.Carbs,
                Protein: eaten.Protein,
                Fat: eaten.Fat,
                Fiber: eaten.Fiber,
                Sugars: eaten.Sugars,
                Omega3: eaten.Omega3,
                ALA: eaten.ALA,
                SFA: eaten.SFA,
                WNKT: eaten.WNKT,
                Trans: eaten.Trans,
                Cholesterol: eaten.Cholesterol,
                Valine: eaten.Valine,
                Isoleucine: eaten.Isoleucine,
                Leucine: eaten.Leucine,
                Lysine: eaten.Lysine,
                Methionine: eaten.Methionine,
                Threonine: eaten.Threonine,
                Tryptophan: eaten.Tryptophan,
                Phenylalanine: eaten.Phenylalanine
            }
        end
        @eatenNames = @eaten.getEaten(@day)[:mealsNames]
        @gotten = EatenViewModel.new(session[:sessionID])
        @gotten = @gotten.calculateDailyRequisition(@day)
        @requisition = UserRequisitionViewModel.new(session[:sessionID])
        @requisition = @requisition.getUserRequisition
        if @requisition.present? && !@gotten.Calories.nil?
            @resultkc = ''
            if @gotten.Calories <= 0.9 * @requisition.TargetCalories
                @resultkc = 'too-little'
            elsif @gotten.Calories >= 1.1 * @requisition.TargetCalories
                @resultkc = 'too-much'
            else @resultkc = 'neutral'
            end
            @resultp = ''
            if !@gotten.Protein.nil?
                if @gotten.Protein <= 0.9 * @requisition.Protein
                    @resultp = 'too-little'
                elsif @gotten.Protein >= 1.1 * @requisition.Protein
                    @resultp = 'too-much'
                else
                    @resultp = 'neutral'
                end
            end
            @resultc = ''
            if !@gotten.Carbs.nil?
                if @gotten.Carbs <= 0.9 * @requisition.Carbs
                    @resultc = 'too-little'
                else
                    @resultc = 'neutral'
                end
            end
        end
        if  @eatenMeals.present?
            carbs_sum = 0
            @eatenMeals.each {|eat| carbs_sum += eat[:Carbs].nil? ? 0 : eat[:Carbs]}
            protein_sum = 0
            @eatenMeals.each {|eat| protein_sum += eat[:Protein].nil? ? 0 : eat[:Protein]}
            fat_sum = 0
            @eatenMeals.each {|eat| fat_sum += eat[:Fat].nil? ? 0 : eat[:Fat]}

            total = carbs_sum + protein_sum + fat_sum
            @total = total

            if total > 0
                carbs_div = (carbs_sum / total) * 100.0
                protein_div = (protein_sum / total) * 100.0
                fat_div = (fat_sum / total) * 100.0
            end
            c_chart_col = ''
            p_chart_col = ''
            f_chart_col = ''
            if carbs_div < 55 || carbs_div > 75
                c_chart_col = 'red'
            end
            if protein_div < 10 || protein_div > 15
                p_chart_col = 'red'
            end
            if fat_div < 15 || fat_div > 30
                f_chart_col = 'red'
            end

            if total > 0
                fiber_sum = 0
                @eatenMeals.each {|eat| fiber_sum += eat[:Fiber].nil? ? 0 : eat[:Fiber]}
                sugars_sum = 0
                @eatenMeals.each {|eat| sugars_sum += eat[:Sugars].nil? ? 0 : eat[:Sugars]}
                sugars_percent = (sugars_sum / total ) * 100.0            

                omega3_sum = 0
                @eatenMeals.each {|eat| omega3_sum += eat[:Omega3].nil? ? 0 : eat[:Omega3]}
                ala_sum = 0
                @eatenMeals.each {|eat| ala_sum += eat[:ALA].nil? ? 0 : eat[:ALA]}
                sfa_sum = 0
                @eatenMeals.each {|eat| sfa_sum += eat[:SFA].nil? ? 0 : eat[:SFA]}
                wnkt_sum = 0
                @eatenMeals.each {|eat| wnkt_sum += eat[:WNKT].nil? ? 0 : eat[:WNKT]}
                trans_sum = 0
                @eatenMeals.each {|eat| trans_sum += eat[:Trans].nil? ? 0 : eat[:Trans]}
                jnkt_sum = fat_sum - (omega3_sum + ala_sum + sfa_sum + wnkt_sum + trans_sum)
                cholesterol_sum = 0
                @eatenMeals.each {|eat| cholesterol_sum += eat[:Cholesterol].nil? ? 0 : eat[:Cholesterol]}            
                sfa_percent = (sfa_sum / total) * 100.0
                wnkt_percent = (wnkt_sum / total) * 100.0
                ala_percent = (ala_sum / total) * 100.0
                trans_percent = (trans_sum / total) * 100.0            

                valine_sum = 0
                @eatenMeals.each {|eat| valine_sum += eat[:Valine].nil? ? 0 : eat[:Valine]}
                isoleucine_sum = 0
                @eatenMeals.each {|eat| isoleucine_sum += eat[:Isoleucine].nil? ? 0 : eat[:Isoleucine]}
                leucine_sum = 0
                @eatenMeals.each {|eat| leucine_sum += eat[:Leucine].nil? ? 0 : eat[:Leucine]}
                lysine_sum = 0
                @eatenMeals.each {|eat| lysine_sum += eat[:Lysine].nil? ? 0 : eat[:Lysine]}
                methionine_sum = 0
                @eatenMeals.each {|eat| methionine_sum += eat[:Methionine].nil? ? 0 : eat[:Methionine]}
                threonine_sum = 0
                @eatenMeals.each {|eat| threonine_sum += eat[:Threonine].nil? ? 0 : eat[:Threonine]}
                tryptophan_sum = 0
                @eatenMeals.each {|eat| tryptophan_sum += eat[:Tryptophan].nil? ? 0 : eat[:Tryptophan]}
                phenylalanine_sum = 0
                @eatenMeals.each {|eat| phenylalanine_sum += eat[:Phenylalanine].nil? ? 0 : eat[:Phenylalanine]}

                sugar_col=''
                if sugars_percent > 10
                    sugar_col = 'red'
                end
                sfa_col =''
                if sfa_percent > 10
                    sfa_col = 'red'
                end
                wnkt_col =''
                if wnkt_percent < 6 || wnkt_percent > 10
                    wnkt_col = 'red'
                end
                ala_col =''
                if ala_percent < 0.5
                    ala_col = 'red'
                end
                trans_col =''
                if trans_percent >= 1
                    trans_col = 'red'
                end

                fiber_col = ''
                if fiber_sum < 25
                    fiber_col = 'red'
                end

                cholesterol_col = ''
                if cholesterol_sum >= 300
                    cholesterol_col = 'red'
                end
            
                @chart_data = [
                    { name: 'Węglowodany', class: c_chart_col, y: carbs_div.to_f, tooltip_info: "<b>Błonnik</b>: <span style='color:#{fiber_col}'>#{fiber_sum.round(2)} g</span><br /> <b>Cukry:</b> #{sugars_sum.round(2)} g (<span style='color:#{sugar_col}'>#{sugars_percent.round(2)} %</span>)<br />" },
                    { name: 'Białko', class: p_chart_col, y: protein_div.to_f, tooltip_info: "<b>Walina</b>: #{valine_sum.round(2)} mg (z #{@requisition.Valine})<br /> <b>Izoleucyna:</b> #{isoleucine_sum.round(2)} mg (z #{@requisition.Isoleucine})<br /> <b>Leucyna:</b> #{leucine_sum.round(2)} mg (z #{@requisition.Leucine})<br /> <b>Lizyna:</b> #{lysine_sum.round(2)} mg (z #{@requisition.Lysine})<br /> <b>Metionina:</b> #{methionine_sum.round(2)} mg (z #{@requisition.Methionine})<br /> <b>Treonina:</b> #{threonine_sum.round(2)} mg (z #{@requisition.Threonine})<br /> <b>Tryptofan:</b> #{tryptophan_sum.round(2)} mg (z #{@requisition.Tryptophan})<br /> <b>Fenyalanina:</b> #{phenylalanine_sum.round(2)} mg (z #{@requisition.Phenylalanine})<br />" },
                    { name: 'Tłuszcze', class: f_chart_col, y: fat_div.to_f, tooltip_info: "<b>Tłuszcze jednonienasycone</b>: #{jnkt_sum.round(2)} g<br /> <b>Tłuszcze wielonienasycone:</b> #{wnkt_sum.round(2)} g (<span style='color:#{wnkt_col}'>#{wnkt_percent.round(2)} %</span>)<br /> <b>Tłuszcze nasycone:</b> #{sfa_sum.round(2)} g (<span style='color:#{sfa_col}'>#{sfa_percent.round(2)} %</span>)<br /> <b>Tłuszcze trans:</b> #{trans_sum.round(2)} g (<span style='color:#{trans_col}'>#{trans_percent.round(2)} %</span>)<br /> <b>Kwasy tł. Omega3:</b> #{omega3_sum.round(2)} g<br /> <b>Kwas tł. ALA:</b> #{ala_sum.round(2)} g (<span style='color:#{ala_col}'>#{ala_percent.round(2)} %</span>)<br /> <b>Cholesterol:</b> <span style='color:#{cholesterol_col}'>#{cholesterol_sum.round(2)} mg</span><br />" }
                ].to_json
            end
        end
    end
end