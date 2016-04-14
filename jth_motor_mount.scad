/* [Motor Bolts] */
Motor_Bolt_X_spacing = 16; // Motor Bolts X distance
Motor_Bolt_Y_spacing = 19; // Motor Bolts Y distance
Screw_Size = 3; // Screw Size

/* [Motor Plate] */
Plate_Thickness = 5;
Plate_Diameter = 32;

/* [Arm Size] */
arm_outside_diameter = 13;

/* [Hidden] */
$fs = 0.2;
Plate_Radius = Plate_Diameter/2;


difference() {
    union() {
        cylinder(Plate_Thickness,Plate_Radius,Plate_Radius,true);
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
            translate([0,0,30]) motor_posts(25);
            translate ([20,0,10]) cube([60,arm_outside_diameter,arm_outside_diameter],true);
        }
        *difference() {
            translate([0,0,05]) motor_posts(5);
            translate ([20,0,10]) cube([60,arm_outside_diameter,arm_outside_diameter],true);
        }
    }
    
    translate([0,0,0]) cylinder(8,3,3,true);
    motor_screws(50);

}


module motor_posts(sl=10) {
    rotate([0,0,45]) {
    // NE
    translate([Motor_Bolt_X_spacing/2,0,0]) cylinder(sl,Screw_Size,Screw_Size,true);
    // NW
    translate([-Motor_Bolt_X_spacing/2,0,0]) cylinder(sl,Screw_Size,Screw_Size,true);
    // SE
    translate([0,Motor_Bolt_Y_spacing/2,0]) cylinder(sl,Screw_Size,Screw_Size,true);
    // SW
    translate([0,-Motor_Bolt_Y_spacing/2,0]) cylinder(sl,Screw_Size,Screw_Size,true);
    }
}


module motor_screws(sl=10) {
    rotate([0,0,45]) {
    // NE
    translate([Motor_Bolt_X_spacing/2,0,0]) cylinder(sl,Screw_Size/2,Screw_Size/2,true);
    // NW
    translate([-Motor_Bolt_X_spacing/2,0,0]) cylinder(sl,Screw_Size/2,Screw_Size/2,true);
    // SE
    translate([0,Motor_Bolt_Y_spacing/2,0]) cylinder(sl,Screw_Size/2,Screw_Size/2,true);
    // SW
    translate([0/2,-Motor_Bolt_Y_spacing/2,0]) cylinder(sl,Screw_Size/2,Screw_Size/2,true);
    }
}
