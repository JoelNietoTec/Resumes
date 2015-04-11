class NiceImageInput < SimpleForm::Inputs::Base
  def input
    template.content_tag(:div, class: "fileinput fileinput-new", data: { provides: "fileinput" }) do
      template.concat(template.content_tag(:div, class: "fileinput-new thumbnail", style: "width: 100px; height: 100px; margin-right: 4px; margin-left: 26px;") do
        template.image_tag(object.avatar.url(:thumb), class: "input-prepend", size:"100x100")
      end)
      template.concat(template.content_tag(:div, nil, class: "fileinput-preview fileinput-exists thumbnail", style: "width: 100px; height: 100px; margin-right: 4px; margin-left: 26px;"))
      template.concat(template.content_tag(:span, class:"btn btn-file") do
        template.concat(template.content_tag(:span, "Buscar Imagen", class: "fileinput-new btn btn-default btn-lg"))
        template.concat(template.content_tag(:span, "Cambiar Imagen", class: "fileinput-exists btn btn-default btn-lg"))
        template.concat(@builder.file_field attribute_name, input_html_options)
      end)
    end
  end
end
