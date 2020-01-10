class Figure < ActiveRecord::Base
  has_many :landmarks
  has_one :title
end
