class ProfileController < ApplicationController
    def profile
        if !session[:sessionID]
            redirect_to "index/index"
        end
        if session[:message]
            @message=session[:message]
            session[:message]=nil
        end
        @data = UserDataViewModel.new(session[:sessionID])
        @data.getUserData
        @measurements = UserMeasurementsViewModel.new(session[:sessionID])
        @measurements.getLatestMeasurements
        @target = TargetViewModel.new(session[:sessionID])
        @target.getTarget
        @activity = ActivityViewModel.new(session[:sessionID])
        @activity.getActivity
        @requisition = UserRequisitionViewModel.new(session[:sessionID])
        @requisition.getUserRequisition
        allMeasurements = UserMeasurementsViewModel.new(session[:sessionID])
        allMeasurements = allMeasurements.getUserMeasurements
        @weights = []
        @waist = []
        @hips = []
        @dates_weights = []
        @dates_waist = []
        @dates_hips = []
        allMeasurements.each_with_index do |measurement, index|
            if measurement.Weight.present?
                diff = @weights[@weights.length-1] ? measurement.Weight - @weights[@weights.length-1][:y] : 0
                @weights << { y: measurement.Weight, diff: diff.round(1), id: measurement.id, date: measurement.Date }
                @dates_weights << measurement.Date
            end
            if measurement.Waist.present?
                diff = @waist[@waist.length-1] ? measurement.Waist - @waist[@waist.length-1][:y] : 0
                @waist << { y: measurement.Waist, diff: diff.round(1), id: measurement.id, date: measurement.Date }
                @dates_waist << measurement.Date
            end
            if measurement.Hips.present?
                diff = @hips[@hips.length-1] ? measurement.Hips - @hips[@hips.length-1][:y] : 0
                @hips << { y: measurement.Hips, diff: diff.round(1), id: measurement.id, date: measurement.Date }
                @dates_hips << measurement.Date
            end

            break if index == 10
        end
        @differences = UserMeasurementsViewModel.new(session[:sessionID])
        @differences = @differences.calculateDifference
    end
end