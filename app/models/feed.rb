class Feed < ActiveRecord::Base
  # attr_accessible :title, :body
	attr_accessible :name, :uri, :host
end
