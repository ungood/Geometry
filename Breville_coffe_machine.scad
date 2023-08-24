module rounded_square(width, length, radius){
    diameter = radius * 2;
    
    minkowski() {
        square([width - diameter, length - diameter], center=true);
        circle(radius);
    
    }
}

module rounded_cube(width, length, height, radius){
    
    hull(){
        for(x = [-width/2, width/2]) {
            for(y = [-length/2, length/2]) {
                for(z = [-height/2, height/2]) {
                    translate([x, y, z])
                    sphere(radius);
                }
            }
        }
        
    }
}


module basic_outline(){
    size = 300;
    prep_area_depth = 160;
    control_area_height = 110;
    radius = 23.8;
    
    rotate([0, 90, 0]){
        difference(){
            rounded_cube(size, size, size, radius);
            
            linear_extrude(prep_area_depth + 100)
            rounded_square(size - control_area_height, 1000, radius);
        }
    }
}

basic_outline();