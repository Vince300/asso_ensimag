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
    unless request.original_fullpath == blog_post_path(@post)
      redirect_to blog_post_path(@post)
    end
  end

  # GET /posts/new
  def new
    @post = BlogPost.new(author: current_user)

    # Authorize the post
    authorize_post
  end

  # POST /posts
  def create
    @post = BlogPost.new(blog_post_params)

    # Ensure the author has been set
    @post.author = current_user
    # Same for the published datetime
    @post.published ||= DateTime.now

    # Authorize the post
    authorize_post

    # Save the post
    if @post.save
      redirect_to blog_post_path(@post), flash: { notice: "L'article a été créé avec succès" }
    else
      render action: 'new'
    end
  end

  # GET /posts/:id/edit
  def edit
    # Authorize the post
    authorize_post
  end

  # PUT /posts/:id
  def update
    # Authorize the post
    authorize_post

    upd_params = blog_post_params

    # Enforce published datetime
    upd_params[:published] = DateTime.now if upd_params[:published].empty?

    # Update using form parameters
    if @post.update(upd_params)
      redirect_to blog_post_path(@post), flash: { notice: "Les modifications ont été enregistrées" }
    else
      render action: 'edit'
    end
  end

  # DELETE /posts/:id
  def destroy
    # Authorize the post
    authorize_post

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

    def blog_post_params
      params[:blog_post].permit(:title, :published, :summary, :body)
    end

    def authorize_post
      authorize @post
    end
end
