class Project < ActiveRecord::Base
  has_many :layers_projects
  has_many :layers, through: :layers_projects
  has_many :fields

  accepts_nested_attributes_for :layers_projects, allow_destroy: true
  accepts_nested_attributes_for :layers, allow_destroy: true
  accepts_nested_attributes_for :fields, allow_destroy: true
end
