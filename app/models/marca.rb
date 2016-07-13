class Marca < ApplicationRecord
	validates :nombre, presence: true,
                    length: { minimum: 1 }
end
