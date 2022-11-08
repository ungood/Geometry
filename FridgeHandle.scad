$fn = 32;

epsilon = 0.01;

handle_diameter = 10;
bolt_diameter = 2.5;
handle_length = 90;
handle_depth = 25;


module cross_section() {
    difference() {
        circle(d = handle_diameter);
        circle(d = bolt_diameter);
    }
}

module corner() {
    rotate_extrude(angle = 90) {
        translate([handle_diameter, 0, 0]){
            cross_section();
        }
    }
}
    

module handle_half(){    
    translate([handle_length/2 - epsilon, 0, 0]){
        union(){
            rotate([90, 0, 90]){
                translate([handle_diameter, 0, 0-handle_length/2]){
                    linear_extrude(handle_length/2){
                        cross_section();
                    }
                }
            }
            corner();

            rotate([90, 0, 0]) {
                translate([handle_diameter, 0, 0]) {
                    linear_extrude(handle_depth) {
                        cross_section();
                    }
                }
            }
        }
    }
}

//handle_half();

module handle(){
    union(){
        handle_half();
        mirror([1, 0, 0]){
            handle_half();
        }
    }
}

translate([0, 0, handle_diameter * 1.5])
rotate([-90, 0, 0])
handle();