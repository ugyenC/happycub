class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :load_activities, only: [:index, :show, :new, :edit]
  after_action :send_mail, only: [:create]
                                                    

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def news
    @news = Post.all
  end
  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  def admin_list
    authorize Post
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
   # @post=Post.find(params[:id])
    @post = Post.new(post_params)
    @post.user= current_user
    authorize @post
    respond_to do |format|
      if @post.save
        
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post=Post.find(params[:id])
    authorize @post
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  
  def destroy
    @post= Post.find(params[:id])
    authorize @post if @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_mail
    @users=User.all
    @users.each do |u|
      PostMailer.post_email(u).deliver_later
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body )
    end
    
    def load_activities
      @activities = PublicActivity::Activity.order('created_at DESC').limit(20)
    end
 
end
