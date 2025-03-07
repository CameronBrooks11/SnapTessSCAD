use <../../iLOX.scad>;

// Should be kept true. Flag to derender rotational extrusions
ucell_derender = true;

include <base_unit_cell.scad>;

// rotx_derender = true;
rotx_render = is_undef(rotx_derender) ? true : false;

// Number of sides for the rotational symmetry (e.g., 6 for hexagonal)
degree_n = 6;

// Calculate the diameter based on the apothem of the polygon
apothem_radius = apothem(width_x / 2, degree_n);
apothem_diameter = apothem_radius * 2;

if (rotx_render)
{
    // Place cell A at the specified position
    place_rotated_cells(cells = base_ucell_cells, positions = [[ 0, 0 ]], n = degree_n, width = width_x,
                        cell_type = "A", color = "OliveDrab");

    // Place cell B instances at the specified positions
    place_rotated_cells(cells = base_ucell_cells, positions = [[apothem_diameter, 0]], n = degree_n, width = width_x,
                        cell_type = "B", color = "CadetBlue");
}