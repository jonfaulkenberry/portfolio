class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :archive, only: [:show, :index, :posts_by_month, :search]
  before_action :all_posts, only: [:index]
  before_action :authenticate_user!, except: [:index, :show, :posts_by_month]

  def posts_by_month
    @posts = all_posts.where("MONTH(created_at) = ? and YEAR(created_at) = ?", 
      params[:month], params[:year])
    render :index
  end
  
  def search
    if params["search"]
      @posts = all_posts.where("title LIKE ? OR description LIKE ? OR body LIKE ?", 
        params[:search], params[:search], params[:search])
    end
    render :index
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        current_user.posts << @post
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_url, notice: 'Post was successfully deleted.'}
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = policy_scope(Post).friendly.find(params[:id])
  end
  
  def all_posts
    @posts = policy_scope(Post)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(*policy(@post || Post).permitted_attributes)
  end
  
  def archive
    @posts_by_month = all_posts.sort.reverse.group_by do |post| 
      { 
        "month_name_and_year" => post.created_at.strftime("%B %Y"),
        "month" => post.created_at.month,
        "year" => post.created_at.year 
      }
    end
  end
end
