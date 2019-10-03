class Activity < ApplicationRecord
  belongs_to :activity, polymorphic: true
  belongs_to :owner, class_name: User.name
  belongs_to :receiver, class_name: User.name
end
