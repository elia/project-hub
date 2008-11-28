class Project < ActiveRecord::Base
  has_many :project_participations
  has_many :people, :through => :project_participations
  has_many :todo_lists
  
  validates_presence_of   :name
  validates_uniqueness_of :name
end
