Spree::Money.class_eval do
  self.default_formatting_rules = {
    # Ruby money currently has this as false, which is wrong for the vast
    # majority of locales.
    sign_before_symbol: true,
    symbol: 'руб.'
  }
end
