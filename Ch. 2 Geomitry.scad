size = 5;

module tetrahedron(c) {
    color(c, 1.0)
    cylinder(r1 = size / sqrt(2), r2 = 0, h = size, center = true, $fn = 3);
}

// Octahedron
//hull() {
//    tetrahedron(c="red");
//
//    mirror([0, 0, 1])
//    mirror([1, 0, 0])
//    tetrahedron(c="blue");
//}

// Dodecahedron
intersection() {
    cylinder(r = size, h = size, center = true, $fn = 10);
    rotate([0, atan(2), 72])
    cylinder(r = size, h = size, center = true, $fn = 10);
    rotate([0, atan(2), 144])
    cylinder(r = size, h = size, center = true, $fn = 10);
    rotate([0, atan(2), 216])
    cylinder(r = size, h = size, center = true, $fn = 10);
    rotate([0, atan(2), 288])
    cylinder(r = size, h = size, center = true, $fn = 10);
    rotate([0, atan(2), 360])
    cylinder(r = size, h = size, center = true, $fn = 10);
}