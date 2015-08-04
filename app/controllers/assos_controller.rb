class AssosController < ApplicationController
  before_action :set_asso, except: [ :index ]

  # GET /assos
  def index
    @assos = User.all
  end

  # GET /asso/:id
  def show
    @posts = ((current_user == @asso) ? @asso.posts : @asso.posts.published).page(params[:page])
  end

  # GET /asso/:id/detail
  def detail
  end

  # GET /asso/:id/edit
  def edit
  end

  # PUT /asso/:id
  def update
    if @asso.update(asso_params)
      redirect_to asso_path(@asso), flash: { notice: "Les modifications ont été enregistrées" }
    else
      render action: 'edit'
    end
  end

  protected
    def set_asso
      @asso = User.friendly.find(params[:id])
    end

    def asso_params
      params[:user].permit(:description, :facebook_url, :site_url, :color)
    end
end
