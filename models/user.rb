require 'sinatra/activerecord'

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
end
