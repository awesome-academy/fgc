class Topic < ApplicationRecord
  has_many :posts
  has_many :sub_topics, class_name: Topic.name,
                      foreign_key: :topic_id

  belongs_to :parent_topic, class_name: Topic.name, optional: true
  scope :root_topics, ->{where topic_id: nil}
  scope :select_id_content, ->{select :id, :content}
  scope :alphabet_content, ->{order :content}
end
