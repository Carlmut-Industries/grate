$fn = 128;

module body() {
    // body
    cube([150, 150, 18]);
    
    // lip
    
    pos = (150 - 50) / 2;
    
    translate([pos, 150, 0])
    cube([50, 50, 18]);
}

module slit(size = [50, 10, 20]) {
    
    length = size[0];
    width = size[1];
    height = size[2];
    
    hull() {
        cylinder(d = width, h = height);
        translate([length - width, 0, 0])
        cylinder(d = width, h = height);
    }
}

module slits() {
    for (x = [0 : 20 : 100]) {
        translate([0, x]) {
            slit();
            
            translate([70, 0])
            slit();
        }
    }
}

module grate() {
    difference() {
        body();
        translate([20, 25])
        slits();
    }
}

grate();

//slits();