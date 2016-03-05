class LinksController < ApplicationController
  def home
  end

  def index
    @links = Link.all
  end

  def shorter
    validated_url = validate_url(params[:link])
    @url_cut=Link.short(3)

    link=Link.new(
      url_original: validated_url,
      url_shorted: @url_cut)

      link.save
      redirect_to("/urls")
  end

  def validate_url(uri)
    result=uri
    unless uri.include? "http://"
      result="http://"+uri
    end
    result
  end

  def get_url
    @linka=Link.find_by(url_shorted: params[:shortlink])
  end

end
