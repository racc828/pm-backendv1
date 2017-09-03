class Collaborator < ApplicationRecord
  belongs_to :collaborator, class_name: 'User'
  belongs_to :project, class_name: 'Project'
end
