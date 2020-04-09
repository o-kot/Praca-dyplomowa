class IndexController < ApplicationController
 def index
    if session[:sessionID]
        redirect_to "/profile/profile"
    end
 end

end
