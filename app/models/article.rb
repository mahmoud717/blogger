class Article < ApplicationRecord
    validates :title, presence: true, length: { minimum: 6, maximum: 50 }, uniqueness: {case_sensitive: false}
    validates :body, presence: true, length: { minimum: 6, maximum: 400 }
    belongs_to :user
end
