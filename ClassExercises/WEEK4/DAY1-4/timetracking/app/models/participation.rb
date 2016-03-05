class Participation < ActiveRecord::Base
  belong_to :people
  belong_to :projects
end
