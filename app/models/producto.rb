class Producto < ApplicationRecord
	 validates :nombre, presence: true,
                    length: { minimum: 3 }
     validates :precio, :numericality => {:greater_than => 0, :less_than => 100}
end
