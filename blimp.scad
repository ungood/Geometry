$fn = 40;

module ground() {
    color("#405000")
    square(10000000, center = true);
}

module reuleaux_polygon(
    diameter = 40,
    sides = 3
) { 
    angle = 360 / sides;
    intersection_for(side = [0 : sides]) {
        rotate([0, 0, side * angle])      
        translate([0, diameter/2, 0])
        circle(r = diameter);
    }
}


module house() {
    epsilon = 0.1;
    //door
    color("yellow")
    translate([4, 3 - epsilon, 5])
    rotate([90, 0, 0])
    reuleaux_polygon(10, 8);
    
    //house
    translate([-5, 3, 0])
    cube(20);
    
    //roof
    translate([20, 13, 25])
    rotate([0, -90, 0])
    linear_extrude(30)
    circle(15, $fn = 3);
    
    //chiminny
    translate([0, 20, 10])
    cube([3, 3, 20]);
}
module blimp() {
    // Hull
    scale([1,3,1]) mirror([0,0,1]) sphere(r = 15);
    translate([0, -3, -18]) cube([3, 6, 3], center = true);
    
    // Prop
    translate([0, 3, - 18])
    rotate([90, 0, 0])
    linear_extrude(2, twist = 300, slices = 100) square(1);
    
    // Tail
    rotate([0, 0, 90])
    translate([40, 0, 0])
    square([20, 20], center = true);
    
    translate([0, 40, 0])
    rotate([0, 90, 0])
    square([20, 20], center = true);
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

scale([5, 5, 5])
translate([45, 4, 100])
blimp();

house();

ground();