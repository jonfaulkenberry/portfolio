class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :archive, only: [:show, :index, :posts_by_month, :search, :tags]
  before_action :scoped_posts, only: [:index]
  before_action :authenticate_user!, except: [:index, :show, :posts_by_month, :search, :tags]

  def posts_by_month
    @posts = scoped_posts.where("MONTH(created_at) = ? and YEAR(created_at) = ?", 
      params[:month], params[:year])
    render :index
  end
  
  def tags
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    end
    render :index
  end
  
  def search
    if params[:search]
      search = scoped_posts.search do
        fulltext params[:search]
        order_by :created_at, :desc
      end
      @posts = search.results
      render :index
    else
      flash[:error] = "Invalid search query"
      redirect_to(request.referrer || root_path)
    end
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
    authorize @post, :owner?
  end

  # GET /posts/1/edit
  def edit
    authorize @post, :owner?
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    authorize @post, :owner?
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
    authorize @post, :owner?
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
    authorize @post, :owner?
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
  
  def scoped_posts
    @posts = policy_scope(Post)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(*policy(@post || Post).permitted_attributes)
  end
  
  def archive
    @posts_by_month = scoped_posts.sort.reverse.group_by do |post| 
      { 
        "month_name_and_year" => post.created_at.strftime("%B %Y"),
        "month" => post.created_at.month,
        "year" => post.created_at.year 
      }
    end
  end
end
