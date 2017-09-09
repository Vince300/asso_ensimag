class PartnersController < ApplicationController
  before_action :set_partner, only: [ :edit, :update, :destroy ]

  # GET /partners
  # GET /partners.json
  def index
    @partners = Partner.all
  end

  # GET /partners/new
  def new
    @partner = Partner.new

    authorize_partner
  end

  # GET /partners/1/edit
  def edit
    authorize_partner
  end

  # POST /partners
  def create
    @partner = Partner.new(partner_params)

    # Set the partner's asso
    @partner.asso = current_user

    # Authorize the partner
    authorize_partner

    if @partner.save
      expire_fragment(:navbar_partner_link)
      redirect_to partners_url, notice: 'Le partenaire a été créé avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /partners/1
  def update
    # Authorize the partner
    authorize_partner

    if @partner.update(partner_params)
      redirect_to partners_url, notice: "Le partenaire a été mis à jour avec succès."
    else
      render :edit
    end
  end

  # DELETE /partners/1
  def destroy
    # Authorize the deletion
    authorize_partner

    @partner.destroy
    expire_fragment(:navbar_partner_link)
    redirect_to partners_url, notice: 'Le partenaire a été supprimé.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_partner
      @partner = Partner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def partner_params
      params[:partner].permit(:name, :site_url, :description, :picture)
    end

    def authorize_partner
      authorize @partner
    end
end
