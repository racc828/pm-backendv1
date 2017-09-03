class User < ApplicationRecord
  has_secure_password
  has_many :projects
  has_many :collaborators, foreign_key: 'collaborator_id'
  has_many :participating_projects, through: :collaborators, source: :project
end
