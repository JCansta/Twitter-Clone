class AddController < ApplicationController
    before_action :require_admin

    def new
    end

    def create
        #require 'fileutils'
        @doc = params[:create][:file]
        #file = File.join("public", params[:file].original_filename)
        #Fileutils.cp tmp.path, file
        data = Roo::Spreadsheet.open(@doc, extension: :xlsx)
        data.each do |row|
            user = User.new(username: row[0], email: row[1], password: row[2])
            if user.valid?
                user.save
            end
        end
        flash[:notice] = "Upload all User successfully"
        redirect_to users_path
        #Fileutils.rm file
    end

    private

    def require_admin
        if !(logged_in? && current_user.admin?)
            flash[:alert] = "Only admins can perform that action"
            redirect_to categories_path
        end
    end
end