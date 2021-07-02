class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  enum status: %i[active archived inactive under_review]
end
