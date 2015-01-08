class Event < ActiveRecord::Base
	has_attached_file :banner, :styles => { :medium => "1000x400>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence :banner
end
