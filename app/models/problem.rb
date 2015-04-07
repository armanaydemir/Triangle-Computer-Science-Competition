class Problem < ActiveRecord::Base
    validates :name, presence: true, length: { maximum: 50 }
    validates :description, presence: true, length: { minimum: 10 }
    validates :difficulty, presence: true, numericality: {:only_integer => true}, inclusion: { in: 0..10 }
end
