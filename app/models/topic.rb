class Topic < ApplicationRecord
  has_many :posts
  has_many :sub_topics, class_name: Topic.name,
                      foreign_key: :topic_id

  belongs_to :parent_topic, class_name: Topic.name, optional: true
  scope :root_topics, ->{where topic_id: nil}
  scope :all_sub_topics_by_id, ->(id){where topic_id: id}
  scope :select_id_content, ->{select :id, :content}
  scope :alphabet_content, ->{order :content}
end
