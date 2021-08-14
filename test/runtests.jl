using Test, electrons

greet()


file = readlines("orca_density.3D")[5:end-1]

original_flat_array = parse.(Float64, file)
density = unflatten(original_flat_array)
flattened = flatten_like_cube(density)
@test flattened == original_flat_array
