class SessionsController < ApplicationController
    def destroy
        reset_session
        redirect_to articles_path
    end
    def new
        # @users = User.all
    end
    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            session[:current_user] = @user
            flash[:notice] = "You have successfully logged in."
            redirect_to articles_path
        else
            flash.now[:notice] = "There was something wrong with your login details"
            render "new"
        end
    end

end