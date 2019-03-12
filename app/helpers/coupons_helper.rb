module CouponsHelper
  def coupons_left deal
    return nil if deal.blank?

    "#{pluralize(deal.coupon_left, 'coupon')} #{'is'.pluralize(deal.coupon_left)} left for this deal. Hurry Up!"
  end

  def deal_expires_in_words deal
    return nil if deal.blank?

    "Quest expires in #{distance_of_time_in_words(deal.expiry_date, Date.current)}".html_safe
  end
end
