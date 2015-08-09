class PictureInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, class: 'input-group input-picture') do
      template.concat template.content_tag(:input, nil, { type: "text", readonly: "true", class: "form-control" })
      template.concat build_input
    end
  end

  def build_input
    template.content_tag(:span, class: 'input-group-btn') do
      template.concat clear_btn
      template.concat browse_btn
    end
  end

  def clear_btn
    template.content_tag(:span, class: 'btn btn-default btn-clear') do
      "<i class='glyphicon glyphicon-remove'></i>".html_safe
    end
  end

  def browse_btn
    template.content_tag(:span, class: 'btn btn-primary btn-file') do
      template.concat "Parcourir&hellip;".html_safe
      template.concat @builder.file_field(attribute_name, input_html_options)
    end
  end
end