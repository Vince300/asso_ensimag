class BlogPostsController < ApplicationController
  include ApplicationHelper

  before_action :set_blog_post, except: [ :new, :create, :index ]
  before_action :set_user, only: [ :new, :create ]

  # GET /posts
  def index
    if user_signed_in?
      redirect_to asso_path(current_user)
    else
      redirect_to root_path
    end
  end

  # GET /posts/:id
  def show
  end

  # GET /posts/new
  def new
    @post = BlogPost.new
  end

  # POST /posts
  def create
    @post = BlogPost.new(params[:blog_post].permit(:title, :summary, :body))
    # Ensure the author has been set
    @post.author = current_user
    # Same for the published datetime
    @post.published = DateTime.now
    # Save the post
    if @post.save
      redirect_to blog_post_path(@post), flash: { notice: "L'article a été créé avec succès " }
    else
      render action: 'new'
    end
  end

  # GET /posts/:id/edit
  def edit
  end

  # PUT /posts/:id
  def update
    # Update using form parameters
    if @post.update(params[:blog_post].permit(:title, :summary, :body))
      redirect_to blog_post_path(@post), flash: { notice: "Les modifications ont été enregistrées" }
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/:id
  def destroy
    if @post.destroy
      redirect_to asso_path(@asso)
    else
      render action: 'show', flash: { error: "Impossible de supprimer cet article" }
    end
  end

  protected
    def set_user
      @asso = current_user
    end

    def set_blog_post
      # Find blog post
      @post = BlogPost.find(params[:id])
      @asso = @post.author
    end
end
