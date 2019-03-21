module ApplicationHelper
  def stripe_url
    "https://connect.stripe.com/oauth/authorize?response_type=code&client_id=#{ENV['CLIENT_ID']}&scope=read_write"
  end
  
  def has_stripe_acct
    yield if current_user.try(:stripe_id?)
  end

  def check_avatar(user)
    if user.profile_pic.present?
      #return user avatar
      user.profile_pic_url(:thumb)
    else
      # return default image
      "fallback/default.png"
    end
  end
end
