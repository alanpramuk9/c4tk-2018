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

  # https://www.youtube.com/watch?v=umnsJwdU1Og
  # https://youtu.be/umnsJwdU1Og
  def youtube_url?(url)
    uri = URI.parse(url)
    case uri.host
    when "www.youtube.com"
      uri.path == "/watch" && uri.query.include?("v=")
    when "youtu.be"
      true
    else
      false
    end
  end

  def card_youtube_iframe(card)
    uri = URI.parse(card.url)

    video_id =
      case uri.host
      when "www.youtube.com"
        Rack::Utils.parse_nested_query(uri.query).symbolize_keys[:v]
      when "youtu.be"
        uri.path
      else
        nil
      end

    return nil if video_id.blank?

    <<-HTML.html_safe
      <iframe id="ytplayer" type="text/html" width="640" height="360" src="https://www.youtube.com/embed/#{video_id}?autoplay=0&origin=#{card_url(card)}" frameborder="0"></iframe>
    HTML
  end
end
