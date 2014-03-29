class Survey< ActiveRecord::Base
   has_many :answers, :dependent => :destroy
   accepts_nested_attributes_for :answers
end
