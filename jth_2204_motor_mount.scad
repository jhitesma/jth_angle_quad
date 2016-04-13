mb_x = 16;
mb_y = 19;
ss = 3;

difference() {
    union() {
        cylinder(5,16,16,true);
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
                translate([-10,0,10.7]) sphere(10);
            }
            translate ([20,0,10]) cube([60,14,14],true);
            translate([0,0,10]) motor_posts(20);
        }
        difference() {
            translate([0,0,10]) motor_posts(15);
            translate ([20,0,10]) cube([60,14,14],true);
        }
    }
    
    translate([0,0,0]) cylinder(8,3,3,true);
    motor_screws(50);

}


module motor_posts(sl=10) {
    translate([mb_x/2,mb_y/2,0]) cylinder(sl,ss,ss,true);
    translate([-mb_x/2,-mb_y/2,0]) cylinder(sl,ss,ss,true);
    translate([-mb_x/2,mb_y/2,0]) cylinder(sl,ss,ss,true);
    translate([mb_x/2,-mb_y/2,0]) cylinder(sl,ss,ss,true);
}


module motor_screws(sl=10) {
    translate([mb_x/2,mb_y/2,0]) cylinder(sl,ss/2,ss/2,true);
    translate([-mb_x/2,-mb_y/2,0]) cylinder(sl,ss/2,ss/2,true);
    translate([-mb_x/2,mb_y/2,0]) cylinder(sl,ss/2,ss/2,true);
    translate([mb_x/2,-mb_y/2,0]) cylinder(sl,ss/2,ss/2,true);
}
