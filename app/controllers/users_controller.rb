class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show]
    before_action :is_current_user?, only: [:show]

    def show
        @user = User.find(params[:id])
    end

    private

    def is_current_user?
        @user = User.find(params[:id])
        unless  current_user == @user
          redirect_to user_path(current_user), info: "Vous n'etes pas l'utilisateur de ce compte"
        end
    end
end
