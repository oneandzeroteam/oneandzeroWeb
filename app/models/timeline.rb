class Timeline < ApplicationRecord
  searchkick
  self.per_page = 5
end
