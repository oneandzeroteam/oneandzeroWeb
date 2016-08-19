class Project < ApplicationRecord
  searchkick
  self.per_page = 10
  has_many :attachments
end
