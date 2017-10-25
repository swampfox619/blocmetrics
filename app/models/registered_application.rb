class RegisteredApplication < ActiveRecord::Base
  has_many :events

    validates :name, :url, presence: true
    validates :name, :url, uniqueness: true
end
