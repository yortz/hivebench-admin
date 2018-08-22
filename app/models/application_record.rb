# Standard AR inheriting class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
