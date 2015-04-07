class Question < ActiveRecord::Base
    has_and_belongs_to_many :teams
    belongs_to :round
    validates :name, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { minimum: 10 }
    validates :difficulty, presence: true, numericality: {:only_integer => true}, inclusion: { in: 0..10 }
    validates :num_points, presence: true, numericality: {:only_integer => true}
end
