module ApplicationHelper

  def flash_message
    display_message(:alert) || display_message(:notice)
  end

  # def flash_message
  #   if flash[:alert]
  #     content_tag :div, class: 'flash flash_bad' do
  #       content_tag :p do
  #         flash[:alert]
  #       end
  #     end
  #   elsif flash[:notice]
  #     content_tag :div, class: 'flash flash_ok' do
  #       content_tag :p do
  #         flash[:notice]
  #       end
  #     end
  #   end
  # end

  private
  def display_message(type)
    if flash[type]
      content_tag :div, class: type do
        content_tag :p do
          flash[type]
        end
      end
    end
  end
  
end
