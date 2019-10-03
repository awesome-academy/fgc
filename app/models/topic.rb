class Topic < ApplicationRecord
  has_many :posts
  has_many :sub_topics, class_name: Topic.name,
                      foreign_key: :parent_id

  belongs_to :parent_topic, class_name: Topic.name, optional: true
end
