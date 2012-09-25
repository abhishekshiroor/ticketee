module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ") unless parts.empty?
      end
    end
  end

  def facebook?
    session["devise.facebook_data"]
  end
end
