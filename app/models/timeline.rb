class Timeline < ApplicationRecord
  validates :title, :presence => true
  validates :contents, :presence => true,
                      :length => { :minimum => 5}
end
