class Project < ApplicationRecord
  searchkick
  self.per_page = 10
end
