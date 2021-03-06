module ApplicationHelper
  def page_title(title)
    content_for(:page_title) { title }
  end

  def body_class(options = {})
    extra_body_classes_symbol = options[:extra_body_classes_symbol] || :extra_body_classes
    qualified_controller_name = controller.controller_path.tr("/", "-")
    basic_body_class = "#{qualified_controller_name} #{qualified_controller_name}-#{controller.action_name}"

    if content_for?(extra_body_classes_symbol)
      [basic_body_class, content_for(extra_body_classes_symbol)].join(" ")
    else
      basic_body_class
    end
  end

  def canonical(url)
    content_for(:canonical) { url }
  end

  def user_facing_flashes
    flash.to_hash.slice("alert", "notice")
  end
end
