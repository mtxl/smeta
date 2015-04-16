Spree::HomeController.class_eval do
  def index
    @home_controller = true
    @searcher = build_searcher(params.merge(include_images: true))
    @taxonomies = Spree::Taxonomy.includes(root: :children)
  end
end
