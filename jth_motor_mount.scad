mb_x = 16; // Motor Bolts X distance
mb_y = 19; // Motor Bolts Y distance
ss = 3; // Screw Size
$fs = 0.2;

difference() {
    union() {
        cylinder(5,16,16,true);
*        translate([-10,0,5]) cube([1,20,5],true);
        difference() {
            union() {
                difference() {
                    translate([3,0,11]) cube([26,19,19],true);
                    difference() {
                        translate([5,0,11]) cube([32,20,20],true);
                        translate([5,0,11]) rotate([0,90,0]) cylinder(32,9.7,12,true);
                        translate([5,0,0]) cube([40,20,20],true);
                    }
                }
                translate([-10,0,10.7]) sphere(9.5);
            }
            translate([0,0,30]) motor_posts(25);
            translate ([20,0,10]) cube([60,13,13],true);
        }
        *difference() {
            translate([0,0,05]) motor_posts(5);
            translate ([20,0,10]) cube([60,13,13],true);
        }
    }
    
    translate([0,0,0]) cylinder(8,3,3,true);
    motor_screws(50);

}


module motor_posts(sl=10) {
    rotate([0,0,45]) {
    // NE
    translate([mb_x/2,0,0]) cylinder(sl,ss,ss,true);
    // NW
    translate([-mb_x/2,0,0]) cylinder(sl,ss,ss,true);
    // SE
    translate([0,mb_y/2,0]) cylinder(sl,ss,ss,true);
    // SW
    translate([0,-mb_y/2,0]) cylinder(sl,ss,ss,true);
    }
}


module motor_screws(sl=10) {
    rotate([0,0,45]) {
    // NE
    translate([mb_x/2,0,0]) cylinder(sl,ss/2,ss/2,true);
    // NW
    translate([-mb_x/2,0,0]) cylinder(sl,ss/2,ss/2,true);
    // SE
    translate([0,mb_y/2,0]) cylinder(sl,ss/2,ss/2,true);
    // SW
    translate([0/2,-mb_y/2,0]) cylinder(sl,ss/2,ss/2,true);
    }
}
