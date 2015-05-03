class NiceLogoInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: "fileinput fileinput-new", data: { provides: "fileinput" }) do
      template.concat(template.content_tag(:div, class: "fileinput-new thumbnail") do
        template.image_tag(object.logo.url(:thumb), class: "input-prepend", size:"100x100")
      end)
      template.concat(template.content_tag(:div, nil, class: "fileinput-preview fileinput-exists thumbnail", style: "height: 100px;"))
      template.concat(template.content_tag(:span, class:"btn btn-file") do
        template.concat(template.content_tag(:span, "Buscar Logo", class: "fileinput-new btn btn-default btn-lg"))
        template.concat(template.content_tag(:span, "Cambiar Logo", class: "fileinput-exists btn btn-default btn-lg"))
        template.concat(@builder.file_field attribute_name, input_html_options)
      end)
    end
  end
end
