class Project < ActiveRecord::Base
  has_and_belongs_to_many :layers
  has_many :fields
end
