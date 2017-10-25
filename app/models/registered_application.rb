class RegisteredApplication < ActiveRecord::Base
  belongs_to :user

    validates :name, :url, presence: true
    validates :name, :url, uniqueness: true
end
