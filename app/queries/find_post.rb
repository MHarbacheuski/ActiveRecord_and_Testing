class FindPost
  def initialize
    @posts = Post.all
    @organizations = Organization.all
  end

  def call(params)
    scoped = search_organization_id(@organizations, params[:organization_id])
    # scoped = find_posts_for_organization
    # scoped = filter_by_properties(scoped, parmas[:properties])
    # scoped = filter_by_category(scoped, params[:category_id])
    # scoped = sort(scoped, params[:sort_type], params[:sort_direction])
    # scoped = paginate(scoped, params[:page])
  end

  private def search_organization_id(scoped, organization_id = nil)
    organization_id ? scoped.find_by(id: organization_id) : scoped
  end

  # private def find_posts_for_organization
  #   @posts = @organizations.posts.build
  # end
  #
  # private def filter_by_properties(scoped, properties = nil)
  #   if properties
  #     scoped.joins(:product_properties).where(property_id: properties)
  #   else
  #     scoped
  #   end
  # end
  #
  # private def filter_by_category(scoped, category_id = nil)
  #   category_id ? scoped.where(category_id: category_id) : scoped
  # end
  #
  # private def sort(scoped, sort_type = :desc, sort_direction = :price)
  #   scoped.order(sort_type => sort_direction)
  # end
  #
  # private def paginate(scoped, page_number = 0)
  #   scoped.page(page_number)
  # end
end