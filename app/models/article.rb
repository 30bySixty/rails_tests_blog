class Article < ActiveRecord::Base
  validates :title, presence: {message: "cannot be blank."}
  validates :body, presence: {message: "cannot be blank."}
  
  default_scope { order(created_at: :desc)}
  
  belongs_to :user
end
