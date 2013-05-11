class UrlManager
  def initialize(url_or_name)
    @url_or_name = url_or_name
  end

  def url
    if is_url?
      url_or_name
    else
      find_bookmark_url
    end
  end

  private
  attr_reader :url_or_name

  def find_bookmark_url
    if bookmark = Bookmark.find_by_name(url_or_name)
      bookmark.url
    end
  end

  def is_url?
    url_or_name.start_with?("http")
  end
end
