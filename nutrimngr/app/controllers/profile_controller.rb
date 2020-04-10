class ProfileController < ApplicationController
    def profile
        if !session[:sessionID]
            redirect_to "index/index"
        end
        @data = UserDataViewModel.new(session[:sessionID])
        @data.getUserData
        @measurements = UserMeasurementsViewModel.new(session[:sessionID])
        @measurements.getUserMeasurements
        @target = TargetViewModel.new(session[:sessionID])
        @target.getTarget
        @requisition = UserRequisitionViewModel.new(session[:sessionID])
        @requisition.getUserRequisition
    end
    
   end