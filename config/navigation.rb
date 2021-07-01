SimpleNavigation::Configuration.run do |navigation|

  navigation.items do |primary|

    primary.item :organizations, 'name', url, options

    primary.item :key_2, 'name', url, options do |sub_nav|
      # Add an item to the sub navigation (same params again)
      sub_nav.item :key_2_1, 'name', url, options
    end

    primary.item :key_3, 'Admin', url, html: { class: 'special' }, if: -> { current_user.admin? }
    primary.item :key_4, 'Account', url, unless: -> { logged_in? }

  end
end
