defmodule Combined do

	import Convert


	def height_to_mph(meters) do
		Drop.fall_velocity(meters) |> mps_to_mph #takes meters and returns mph
	end
end