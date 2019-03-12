module DealsHelper
  def get_display_discount_type deal, type
    deal.try(:discount_type).to_s.parameterize.underscore == type ? "display: inline-flex;" : "display: none;"
  end
end
