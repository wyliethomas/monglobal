module ApplicationHelper

  def lang_display
    case params[:locale]
      when "en"
        return "English"
      when "es"
        return "Spanish"
      when "fr"
        return "French"
      when "jp"
        return "Japanese"
    end
  end

end
