module AssoScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_asso
  end

  protected
    def set_asso
      @asso = User.friendly.find(params[:id]) if params[:id]
    end
end