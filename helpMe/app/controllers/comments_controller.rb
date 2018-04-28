class CommentsController < ApplicationController
    before_action :authenticate_user!
  
 def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    
   if @comment.save
      redirect_to @comment.issue, notice: "El comentario fue creado correctamente"
    else
      render "issues/show"
    end    
 end
  
 private
    def comment_params
      params.require(:comment).permit(:issue_id, :body)
    end
end
