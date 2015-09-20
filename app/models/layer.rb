class Layer < ActiveRecord::Base
  has_many :layers_projects
  has_many :projects, through: :layers_projects
end
