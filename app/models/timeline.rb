class Timeline < ApplicationRecord
  self.per_page = 5
  has_many :attachments
end
