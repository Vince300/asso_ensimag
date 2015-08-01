class BlogPostController < ApplicationController
  include ApplicationHelper

  before_action :set_blog_post, except: [ :new, :create ]
  before_action :set_user, only: [ :new, :create ]

  # GET /asso/:asso_id/post/:id
  def show
  end

  # GET /asso/:asso_id/post/new
  def new
    @post = BlogPost.new
  end

  # POST /asso/:asso_id/post/new
  def create
    @post = BlogPost.new(params[:blog_post].permit(:title, :summary, :body))
    # Ensure the author has been set
    @post.author = current_user
    # Same for the published datetime
    @post.published = DateTime.now
    # Save the post
    if @post.save
      redirect_to full_post_path(@post), flash: { notice: "L'article a été créé avec succès " }
    else
      render action: 'new'
    end
  end

  # GET /asso/:asso_id/post/:id/edit
  def edit
  end

  # PUT /asso/:asso_id/post/:id/edit
  def update
    # Update using form parameters
    if @post.update(params[:blog_post].permit(:title, :summary, :body))
      redirect_to full_post_path(@post), flash: { notice: "Les modifications ont été enregistrées" }
    else
      render action: 'edit'
    end
  end

  # DELETE /asso/:asso_id/post/:id
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
      # Make sure the asso name is the right one
      if @post.author.to_param != params[:asso_id]
        # Redirect the user to the correct path
        redirect_to full_post_path(@post)
      else
        @asso = @post.author
      end
    end
end
