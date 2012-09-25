class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    # Merge data from Facebook with her current account
    if session["devise.facebook_data"] && current_user.facebook_uid.nil?
      current_user.facebook_uid = session["devise.facebook_data"]["uid"]
      current_user.save(:validate => false)
    end
    # Countermeasure against session fixation
    #session.keys.grep(/^devise\.facebook\./).each { |k| session.delete(k) }

    super
  end


end
