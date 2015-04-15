Spree::Order.class_eval do
checkout_flow do
  go_to_state :save_version
  go_to_state :complete
end
end
