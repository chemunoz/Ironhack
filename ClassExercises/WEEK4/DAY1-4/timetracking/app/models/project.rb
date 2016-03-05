class Project < ActiveRecord::Base
  has_many :entries
  has_many :people, through: :participations
  has_many :participations

  validates :name, presence: true #Validacion para asegurarnos que un Project siempre va a tener nombre
  validates :name, uniqueness: true
  validates :name, length: {maximum: 30}
  #validates :name, format: {with: /\w\s[^_]/} #Ver rubular.com
  validates :name, format: {with: /\A[a-zA-ZÑñ0-9]+\Z/} #Ver rubular.com

  def self.ironfind(index)
    Project.where(id: index).first
    #Le ponemos first para que no nos devuelva un obj ActiveRecord, sino el registro en sí
  end

  def self.clean_old
    # fech = Date.current-1.week
    # p = Project.where('created_at < ?', fech)
    # p.destroy
    #Project.where('created_at < ?', Date.current-1.week).destroy_all
    Project.where('created_at < ?', Time.now).destroy_all
  end

  def self.last_created_projects(num)
    order(created_at: :desc).limit(num)
    #Al ser la misma clase  nos podemos ahorrar "Proyect" --> Project.order(created_at: :desc).limit(num)
  end

  def total_hours_in_month(month, year)#No lo hacemos de instancia porque son entradas de un projecto ya instanciado
    from=Date.new(year, month, 1)
    to=from.end_of_month

    entries=self.entries.where(date:from..to) #El self es opcional
    entries.to_a.sum(&:hours) #Convertimos a Array y Sumamos
  end
end
