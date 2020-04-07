class UserRequisitionController < ApplicationController
    def userRequisition
    end
        newUserData = UserDataViewModel.new
        newUserData = getUserData ()
        newUserMeasurements = UserMeasurementsViewModel.new
        newUserMeasurements = getUserMeasuremets ()
        if newUserData.!exist?
           if(confirm("Twoje są niewprowadzone. Czy chcesz je uzupełnić?"))
                = link_to '', modal_path(body: 'profile/data', title: 'Moje dane'), remote: true, 'data-toggle' =>  'modal', 'data-target' => '#modal-holder', class:'fas fa-plus-square btn-add'   
           else {
            %script 
                $(".modal").modal('hide');
                });
            render plain: 'Obliczenie zapotrzebowanie niemożliwe ze względu na brak uzupełnionych danych'
            }
        elsif newUserMeasurements.!exist?
            if(confirm("Twoje wymiary są niewprowadzone. Czy chcesz je uzupełnić?"))
                = link_to '', modal_path(body: 'profile/measurements', title: 'Moje wymiary'), remote: true, 'data-toggle' =>  'modal', 'data-target' => '#modal-holder', class:'fas fa-plus-square btn-add'   
            else {
                %script
                    $(".modal").modal('hide');
                    });
                render plain: 'Obliczenie zapotrzebowanie niemożliwe ze względu na brak uzupełnienia wymiarów'
            }
        elsif newUserData.IDA.nil?
            if(confirm("Stopień aktywności fizycznej nie został wybrany. Czy chcesz go uzupełnić?"))
            else {
                %script
                    $(".modal").modal('hide');
                    });
                render plain: 'Obliczenie zapotrzebowanie niemożliwe ze względu na brak uzupełnienia stopnia aktywności fizycznej'
            }
        elsif newUserDataIDT.nil?
            if(confirm("Cel nie został. Czy chcesz go uzupełnić?"))
            else {
                %script
                    $(".modal").modal('hide');
                    });
                render plain: 'Obliczenie zapotrzebowanie niemożliwe ze względu na nieokreślenie celu'
            }
        else
            @newDate = Date.tooday
            @userAge = Date.today - @newUserData.BirthDate
            newUserRequisition = UserRequisitionViewModel.new
            render plain: newUserRequisition.calculateUserRequisition(@newUserData.IsWoman,@newUserData.Height,@newUserMeasuremets.Weight,@newUserData.IDA,@userAge,@newUserData.IDT)           
        end
        def acceptRequisition
            newUserRequisition = UserRequisitionViewModel.new
            render plain: newUserRequisition.saveUserRequisition ()
        end
        def modifyRequisition
            if params['calories'].blank?
                render plain: 'Nie wprowadzono docelowej kaloryczności.'
            elsif params['calories'].!kind_of? Integer
                render plain: 'Wprowadzono błędną wartość kaloryczności'
            else
                newTargetCalories = UserRequisitionViewModel.new
                render plain: newTargetCalories.modifyUserRequisition(params['calories'])    
        end
   end