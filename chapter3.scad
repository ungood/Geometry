$fn = 40;

module blimp() {
    scale([1,3,1]) mirror([0,0,1]) sphere(r = 15);
    translate([0, -3, -18]) cube([3, 6, 3], center = true);

    translate([0, 3, - 18])
    rotate([90, 0, 0])
    linear_extrude(2, twist = 300, slices = 100) square(1);
}

module jelly_donut(inner_radius, donut_radius) {
    // jelly
    hull()
    rotate_extrude(angle = 360)
    translate([inner_radius, 0, 0])
    circle(r = donut_radius / 2);

    // donut
    rotate_extrude(angle = 360)
    translate([inner_radius, 0, 0])
    circle(r = donut_radius);
}

//hull()
//for(x = [-1, 1]) {
//    for(y = [-1, 1]) {
//        for(z = [-1, 1]) {
//            translate([x, y, z])
//            sphere(r = 1);
//        }
//    }
//}

blimp();