class Article < ActiveRecord::Base
  validates :title, presence: {message: "cannot be blank."}
  validates :body, presence: {message: "cannot be blank."}
end
