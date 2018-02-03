module ApplicationHelper
  def title(title)
    provide(:title, title)
  end

  def full_title(title)
    provide(:full_title, title)
  end

  def page_title
    return "#{site_name} - #{content_for(:title)}" if content_for?(:title)
    return content_for(:full_title) if content_for?(:full_title)

    site_name
  end

  def site_name
    "C4tK 2018"
  end

  def external_link_to(*args, **options, &block)
    link_to(*args, **options.merge(target: "_blank"), &block)
  end
end
