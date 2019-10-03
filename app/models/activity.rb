class Activity < ApplicationRecord
  belongs_to :activity, polymorphic: true
end
