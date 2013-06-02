class Horario < ActiveRecord::Base
    validates :aula, :presence => true,
     :length => { :maximum => 80 }

  belongs_to :materia
  belongs_to :curso
  belongs_to :instructor
  attr_accessible :aula, :dia, :hora, :materia_id, :instructor_id, :curso_id

  def self.search(search)
	where('aula like ? ',  "%#{search}%")
	end
end
