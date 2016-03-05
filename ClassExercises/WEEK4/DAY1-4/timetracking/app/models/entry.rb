class Entry < ActiveRecord::Base
  belongs_to :project

  validates :hours, :minutes, numericality: {only_integer: true}
  validates :hours, :minutes, :date, presence: true
  validates :project_id, presence: true
  #validates :project, presence: true #TAMBIEN FUNCIONA

  validate :project_exists?

  def project_exists?
    #Y aqui ejecutaríamos el bloque de código
  end
end
