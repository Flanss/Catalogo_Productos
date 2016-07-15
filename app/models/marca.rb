class Marca < ApplicationRecord
	has_many :productos, dependent: :destroy
	validates :nombre, presence: true,
                    length: { minimum: 1 }
end
