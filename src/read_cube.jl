
function greet()
    println("Hello you guys")
end

"""
Goes from a flattened density read from .cube or orca's .3D to a 
3D array. 
"""
function unflatten(flat_array; shape=(40, 40, 40))
	return permutedims(reshape(flat_array, (40, 40, 40)), [3, 2, 1])
end

"""
Unrols 3D array as defined for cube files
https://h5cube-spec.readthedocs.io/en/latest/cubeformat.html
http://paulbourke.net/dataformats/cube/
"""
function flatten_like_cube(density; dens_shape=(40, 40, 40))
	flattened=zeros(0)	
	for ix in 1:dens_shape[1]
		for iy in 1:dens_shape[2]
			for iz in 1:dens_shape[3]
				val = density[ix, iy, iz]
				append!(flattened, val)
			end
		end
	end
	return flattened
end
