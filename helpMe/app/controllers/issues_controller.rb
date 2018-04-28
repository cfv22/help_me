class IssuesController < ApplicationController
    before_action :authenticate_user!

    def index
        @issues = Issue.all 
    end
    def new
        @issue = Issue.new
    end
end
