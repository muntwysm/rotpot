class Moviegoer < ActiveRecord::Base
  attr_protected :uid, :provider, :name #protect against mass assignment
  def self.create_with_omniauth(auth)
	  create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
	    user.name = auth["info"]["name"]
	  end
  end
end