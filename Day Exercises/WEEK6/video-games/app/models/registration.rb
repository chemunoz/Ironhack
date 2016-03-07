class Registration < ActiveRecord::Base
  belong_to :tournament
  belong_to :player
end
