class Survey< ActiveRecord::Base
   #has_many :answers, :dependent => :destroy
   has_many :p1answers, :class_name => "Answer", :foreign_key => "survey_id"
   has_many :p2answers, :class_name => "Answer", :foreign_key => "survey_id"
   accepts_nested_attributes_for :p1answers
   accepts_nested_attributes_for :p2answers
end
