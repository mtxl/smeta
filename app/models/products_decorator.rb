Spree::Product.class_eval do
  validates :unit, presence: true
end
