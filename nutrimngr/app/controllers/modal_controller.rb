class ModalController < ActionController::Base
    def modal
        respond_to do |format|
            format.html
            format.js
        end
    end
end