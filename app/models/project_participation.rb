class ProjectParticipation < ActiveRecord::Base
  belongs_to :project
  belongs_to :person
end
