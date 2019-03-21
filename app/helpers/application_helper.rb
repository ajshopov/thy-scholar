module ApplicationHelper
  def stripe_url
    "https://connect.stripe.com/oauth/authorize?response_type=code&client_id=#{ENV['CLIENT_ID']}&scope=read_write"
  end
  
  def has_stripe_acct
    yield if current_user.try(:stripe_id?)
  end

  def profile_pic(user)
    if user.profile_pic.present?
      user.profile_pic_url
    else
      "fallback/default.png"
    end
  end

    def profile_pic_thumb(user)
    if user.profile_pic.present?
      user.profile_pic_url(:thumb)
    else
      "fallback/thumb_default.png"
    end
  end
end
