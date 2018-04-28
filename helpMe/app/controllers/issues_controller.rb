class IssuesController < ApplicationController
    before_action :authenticate_user!

    def index
        @issues = Issue.all 
    end
    def new
        @issue = Issue.new
    end
    def create
        @issue = Issue.new(issue_params)
        @issue.user = current_user
        @issue.open = true
        if @issue.save
          redirect_to issues_path, notice: "El problema fue creado correctamente"
        else
          render :new
        end  
    end
      
    def show
        @issue = Issue.find(params[:id])
        @comment = @issue.comments.new
    end
      
    private
        def issue_params
          params.require(:issue).permit(:title, :description)
        end
    

end
