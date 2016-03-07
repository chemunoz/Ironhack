class User < ActiveRecord::Base
  has_many :tasks

  def as_json(options={})
    super(only: [:name,:email],
      methods: [:tasks_count],
      include: [tasks:  { only: :name }])
  end

  def tasks_count
    self.tasks.count
  end
end
