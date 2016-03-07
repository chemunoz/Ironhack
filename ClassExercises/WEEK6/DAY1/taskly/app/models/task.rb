class Task < ActiveRecord::Base
  belongs_to :user

  def complete!
    self.completed = true 
    self.save
    self
  end

  def as_json(options={})
    super(only: [:name,:completed])
  end

end
