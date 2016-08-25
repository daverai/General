defmodule Drop do

	import :math

	@doc """
	Calculates the velocity of an object falling to a body with the specified gravity as if it were in
	a vacuum (no air resistance). Default body is earth (gravity of 9.8). The distance is specified
	in meters and the velocity returned is in meters per second. 
	"""

	@spec fall_velocity(number(), float()) :: number()

	def fall_velocity(distance, gravity \\ 9.8) do
		sqrt(2*gravity*distance)
	end
	
end 