class IndexController < ApplicationController
 def index
    if session[:sessionID]
        redirect_to "/meals/meals"
    end
 end

end
