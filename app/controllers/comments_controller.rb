class CommentsController < ApplicationController
  before_action :load_commentable
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end
  
  def create
    @comment = @commentable.comments.new(permitted_params(params))
    if @comment.save
      redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end
  
  private
  def load_commentable
    resource, id = request.path.split('/')[1,2]
    resource = resource.singularize.classify.constantize
    # Posts use friendly ids
    if resource == Post
      @commentable = policy_scope(Post).friendly.find(id)
    else
      @commentable = resource.find(id)
    end
  end
  
  private
  def permitted_params(params)
    params.require(:comment).permit(:content)
  end
end
