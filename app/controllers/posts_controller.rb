class PostsController < ApplicationController
  # Interesting that finding a post gets factored out and put up here... sort of smart actually
  before_action :find_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :opinions, :experiments, :show]
  

  # Get an index of all posts
  def index
    @posts = Post.published.order("updated_at DESC");
  end

  def drafts
    @posts = Post.drafts.order("updated_at DESC");
  end

  def work
    # .reverse so we get the most recent first
    @posts = Post.work.published.reverse
  end

  # category: 'opinion' posts
  def opinions
    @posts = Post.opinion.published.reverse
  end

  # category: 'experiment' posts
  def experiments
    @posts = Post.experiments.published.reverse
  end

  # Make a new post
  def new
    @post = current_user.posts.build
    @button_text = "Publish"
  end

  # Save a new post into the database
  def create
    @post = current_user.posts.build(post_params)
    params[:commit] == "Publish post" ?
      @post.update_attribute(:published, true) : @post.update_attribute(:published, false)
    if @post.save
      flash[:notice] = "The post was saved into the database"
      redirect_to post_path(@post)
    else
      flash[:alert] = "There was an error in creating the post"
      render :new
    end
  end

  # Retrieves a post and renders the edit page
  # Logic for retrieving a post in factored into its own function, see find_post below
  def edit
    @button_text = "Update"
  end

  # Saves the updates into the database
  # Logic for retrieving the post is below, see find_post method
  def update
    @post.published = params[:commit] =~ /(Publish|Update)/ ? true : false
    # Make sure the slug is URL-safe
    @post.slug = params[:post][:slug].parameterize
    if @post.update_attributes(post_params)
      flash[:notice] = "The post was updated successfully"
      redirect_to post_path(@post)
    else
      flash[:alert] = "The edit wasn't put through sucessfully"
      render :edit
    end
  end

  # Shows a certain post, see find_post below for retrieving the post itself
  def show
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Deleted post successfully"
      redirect_to posts_path
    else
      flash[:alert] = "Post wasn't deleted, sorry"
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :subtitle, :slug, :category, :content, :published, {pictures: []})
    end

    def find_post
      @post = Post.find(params[:slug])
    end
end
