$fn = 64;

// 0.2 mm

wall_thickness = 1.2;
thickness = 20;

module reuleaux_box(
    diameter = 40
) {
    difference() {
        cube([diameter + (wall_thickness * 2), diameter + (wall_thickness * 2), thickness], center = true);
        cube([diameter, diameter, thickness], center = true);
    }
}

module reuleaux_polygon(
    diameter = 40,
    sides = 3
) { 
    angle = 360 / sides;
    linear_extrude(thickness)
    intersection_for(side = [0 : sides]) {
        rotate([0, 0, side * angle])      
        translate([0, diameter/2, 0])
        circle(r = diameter);
    }
}

module reuleaux_boxygon(
    diameter = 40,
    sides = 3
) {
    color("blue", alpha = 0.2)
    reuleaux_box(diameter);
    
    color("yellow")
    reuleaux_polygon(diameter, sides);
}



reuleaux_polygon(diameter = 100, sides = 3);