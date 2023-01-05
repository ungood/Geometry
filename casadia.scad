width = 100;
thickness = 10;

module skin(width = 100, thickness = 10, spots){
    color("#7f4f1f")
    cylinder(h = 1, d = width);
    
    if(spots){
        for([0 : 3]){
            color("#222222")
            translate(rands(-50, 50, 2)) cylinder(h = 1, d = 30);
        }
    }
    
    color("#7f4f1f")
    translate([0, 0, thickness]) cylinder(h = 1, d = width);
    
}



module bean(radius = 3){
    color("#222222")
    scale([1, 3, 1]) sphere(radius);
    
}


module cheese(width = 100, thickness = 10){
    color("yellow", 0.3)
    translate([0, 0, 1]) cylinder(h = thickness - 1, d = width);
    
}

module mold(width, thickness){
    difference(){
        cube(10000000000)
        union(){
            skin(width, thickness, False);
            cheese(width, thickness);
        };
    };
};

module casadia(width = 100, thickness = 10){

    for([0 : 20]){
        translate(rands(-37, 37, 2)) rotate(rands(-180, 180, 2)) bean();
    }
    
    translate([0, 0, 0 - thickness/2]){
    skin(width, thickness, spots = 1);

    cheese(width, thickness);
    }

}

casadia();