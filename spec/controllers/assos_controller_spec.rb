describe AssosController do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  context "when an asso exists" do
    let(:asso) { create(:user) }

    describe "GET show" do
      context "with a valid asso id" do
        it "returns http success with a valid id" do
          get :show, id: asso.id
          expect(response).to have_http_status(:success)
        end

        it "renders the show template" do
          get :show, id: asso.id
          expect(response).to render_template :show
        end
      end

      context "with an invalid asso id" do
        it "throws an exception" do
          expect { get :show, id: 'potato' }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end

    describe "GET detail" do
      context "with a valid asso id" do
        it "returns http success with a valid id" do
          get :detail, id: asso.id
          expect(response).to have_http_status(:success)
        end

        it "renders the detail template" do
          get :detail, id: asso.id
          expect(response).to render_template :detail
        end
      end

      context "with an invalid asso id" do
        it "throws an exception" do
          expect { get :detail, id: 'potato' }.to raise_error ActiveRecord::RecordNotFound
        end
      end
    end

    context "for authorized pages" do
      before(:each) { sign_in user unless user.nil? }

      describe "GET edit" do
        context "for a visitor" do
          let(:user) { nil }

          it "forbids access to the page" do
            expect { get :edit, id: asso.id }.to raise_error Pundit::NotAuthorizedError
          end
        end

        context "for another user" do
          let(:user) { create(:user) }

          it "forbids access to the page" do
            expect { get :edit, id: asso.id }.to raise_error Pundit::NotAuthorizedError
          end
        end

        context "for the owner" do
          let(:user) { asso }

          it "returns http success" do
            get :edit, id: asso.id
            expect(response).to have_http_status(:success)
          end

          it "renders the edit template" do
            get :edit, id: asso.id
            expect(response).to render_template :edit
          end
        end
      end

      describe "PATCH update" do
        let(:edited_asso) { attributes_for(:user) }
        let(:asso_attributes) { edited_asso.slice(:description, :facebook_url, :site_url, :color) }

        context "for a visitor" do
          let(:user) { nil }

          it "forbids updating the resource" do
            expect { patch :update, id: asso.id, user: asso_attributes }.to raise_error Pundit::NotAuthorizedError
          end
        end

        context "for another user" do
          let(:user) { create(:user) }

          it "forbids updating the resource" do
            expect { patch :update, id: asso.id, user: asso_attributes }.to raise_error Pundit::NotAuthorizedError
          end
        end

        context "for the owner" do
          let(:user) { asso }

          context "with valid data" do
            it "redirects to the asso page" do
              patch :update, id: asso.id, user: asso_attributes
              expect(response).to redirect_to(detail_asso_path(asso))
            end

            it "updates the model attributes" do
              patch :update, id: asso.id, user: asso_attributes
              asso.reload
              expect(asso).to have_attributes(asso_attributes)
            end
          end

          it "renders the error template on invalid submission" do
            asso_attributes[:color] = 'potato'

            patch :update, id: asso.id, user: asso_attributes
            expect(response).to render_template :edit
          end
        end
      end
    end
  end
end
