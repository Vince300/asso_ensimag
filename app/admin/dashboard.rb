ActiveAdmin.register_page "Dashboard" do
  def clear_cache_action(sym, id, full_name)
    page_action sym, method: :post do
      expire_fragment(id)
      redirect_to admin_dashboard_path, notice: "#{full_name} effacé"
    end
  end

  clear_cache_action(:clear_navbar_cache, :navbar_asso_list,
                     "Cache de la barre de navigation")
  clear_cache_action(:clear_navbar_partner_cache, :navbar_partner_link,
                     "Cache des partenaires dans la barre de navigation")

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Accès rapide" do
          ul do
            li link_to("Accès au site", root_path)
          end
        end
      end
      column do
        panel "Options de cache" do
          ul do
            li link_to("Effacer le cache de la barre de navigation", '/admin/dashboard/clear_navbar_cache', method: :post)
          end
        end
      end
    end
  end
end
