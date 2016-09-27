arm_size = 13.1;
arm_length = 102;
arm_distance = 60;
arm_mount_hole_diam = 1.71;
arm_hole_from_edge = 8;
arm_hole_distance = 10;
wall_width = 4;
coupler_length = 60;
$fs=0.5;





translate([-5,5,48]) cam_mockup(45);

// FPV POD 

difference() {
    //color ("red", a=0.4) 
    fpv_pod();
    
    rotate([0,0,45]) translate([0,0,21]) cube([88,88,2.5],true);

    difference() {
        translate([0,0,0]) scale([0.95,0.95,0.95]) fpv_pod();
        rotate([0,0,45]) cube ([90,90,50],true); 
    }
    translate([0,0,5]) cylinder(r=25,h=41,center=true);
    translate([0,0,-5]) arm_mount_holes(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);

    hull () {
    translate([-15,15,63]) rotate([90+45,0,45]) cylinder(r=8,h=20,center=true);
    translate([-18,18,50]) rotate([90+20,0,45]) cylinder(r=8,h=20,center=true);
    }

    translate([0,0,10.5]) arm_mount_nuts(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);

}
module fpv_pod() {
 color ("orange") {
     hull() {
         translate([0,0,65]) sphere(r=20, center=true);
     
         rotate([0,0,45]) translate([0,0,3]) {
            // base plate
			minkowski() {
				sphere(r=3, $fn=50);
				difference() {
					translate([0,0,21]) cube([82,82,.5],true);
					// clip the corners
                    for(r=[0:90:359]){
                        rotate ([0,0,r+45]) {
                            translate([64,0,20]) cube([30,30,20],true);
                        }
                    }
				}
			}
        }
    }
    }
}



// Center Section
*color ("red") difference() {
    rotate([0,0,45]) {

        // Top plate
        difference() {
            translate([0,0,21]) cube([82,82,2.5],true);

            // fancy top cutout
            for(r=[0:15:359]) {
                rotate ([0,0,r]) translate([0,0,19]) cube([40,40,15],true);
            }

            // clip the corners
            for(r=[0:90:359]){
                rotate ([0,0,r+45]) {
                    translate([64,0,20]) cube([30,30,20],true);
                }
            }
        }

        // Bottom plate
        difference() {
            translate([0,0,-1.6]) cube([86,86,2.5],true);

            // clip the corners
            for(r=[0:90:359]){
                rotate ([0,0,r+45]) {
                    translate([62,0,0]) cube([20,20,20],true);
                }
            }
        }
    }

    // Remove the quad_arms and the arm_mount_holes from the plate...shouldn't have to emove the arms but will make any positioning errors more obvious.
    quad_arms(arm_size,arm_length,arm_distance,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);
    arm_mount_holes(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);

}


// Arms
*difference() {
    quad_arms(arm_size,arm_length,arm_distance,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);
    arm_mount_holes(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);
}

// Motor Mounts
*motor_mounts(arm_size,arm_length,arm_distance,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);


// Angle block
*difference() {
union() {
difference() {
arm_couplers(arm_size,arm_length,arm_distance,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance,coupler_length,wall_width);
arm_mount_holes(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);
fc_mount_curves(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);

rotate([0,0,0]) translate([0,0,19]) color("Grey") cube([42,42,27],true);
    translate([0,0,-7.5]) cube([150,150,14],true);
    translate([0,0,35]) cube([200,200,30],true);


}

fc_mount_posts(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);
}

fc_mount_holes(arm_size,arm_length,arm_mount_hole_diam,arm_hole_from_edge,arm_hole_distance);


}

// Flight Controller

// Controller mockup
*color("Pink", 0.5) translate ([0,0,11]) rotate ([0,0,45]) cube([36,36,5],true);

// mounting holes check piece
*color("Green", 0.4) translate ([0,0,11]) rotate ([0,0,45]) cube([30.5,30.5,2],true);


module arm_mount_holes(s,arm_length,ahd,ahfe,ahfed) {
    color("Grey") for(r=[0:90:359]){
        rotate ([0,0,r]) {
            translate ([0,(-arm_length/2+(ahfe+ahfed)),s]) cylinder(s*3+.02,ahd,ahd,true);
            translate ([0,(-arm_length/2+(ahfe+ahfed)-10),s]) cylinder(s*3+.02,ahd,ahd,true);
        }
    }
}

module arm_mount_nuts(s,arm_length,ahd,ahfe,ahfed) {
    color("Grey") for(r=[0:90:359]){
        rotate ([0,0,r]) {
            translate ([0,(-arm_length/2+(ahfe+ahfed)),s]) cylinder(h=4, r=5.5 / 2 / cos(180 / 6) + 0.05, $fn=6);
            translate ([0,(-arm_length/2+(ahfe+ahfed)-10),s]) cylinder(h=4, r=5.5 / 2 / cos(180 / 6) + 0.05, $fn=6);
        }
    }
}

module fc_mount_holes(s,arm_length,ahd,ahfe,ahfed) {
    color("Grey") for(r=[0:90:359]){
        rotate ([0,0,r]) {
            translate ([0,21.5,s]) cylinder(s*3+.02,ahd-.6,ahd-.6,true);
        }
    }
}

module fc_mount_curves(s,arm_length,ahd,ahfe,ahfed) {
    color("Grey") for(r=[0:90:359]){
        rotate ([0,0,r]) {
            translate ([0,21.5,15]) cylinder(20,6,6,true);
        }
        translate([0,-15,15.6]) cube([20,20,20],true);
        translate([11,-18,15.6]) rotate ([0,0,45]) cube([20,20,20],true);
        translate([6,6,15.6]) rotate ([0,0,45]) cube([10,80,20],true);
    }
}

module fc_mount_posts(s,arm_length,ahd,ahfe,ahfed) {
    color("Orange") for(r=[0:90:359]){
        rotate ([0,0,r]) {
            translate ([0,21.5,5]) cylinder(3,2,2,true);
        }
    }
}

module quad_arms(s,l,d,ahd,ahfe,ahfed){
    for(r=[0:90:359]){
        quad_arm(s,l,d,ahd,ahfe,ahfed,r);
    }
};

module quad_arm(s,l,d,ahd,ahfe,ahfed,r) {
    rotate([0,0,r])
    translate([0,-d/2,0]) rotate([80,0,0]) translate([0,s/2,l/2])
    difference() {
        color("BurlyWood") cube([s,s,l],true);
        *translate ([0,0,((-arm_length/2)+ahfe)]) rotate([90,0]) cylinder(s*3+.02,ahd,ahd,true);
        *translate ([0,0,(-arm_length/2+(ahfe+ahfed))]) rotate([90,0]) cylinder(s*3+.02,ahd,ahd,true);
        translate([0,0,(arm_length/2)-s]) rotate([90,0]) cylinder(s*3+.02,3.2,3.2,true);
    }
}

module arm_couplers(s,l,d,ahd,ahfe,ahfed,cl,ww){
    for(r=[0:90:359]){
        difference() {
            color ("Blue", 0.7) arm_coupler(s,l,d,ahd,ahfe,ahfed,r,cl,ww);
            quad_arm(s,l,d,ahd,ahfe,ahfed,r);
        }
    }
};

module arm_coupler(s,l,d,ahd,ahfe,ahfed,r,cl,ww) {
    rotate([0,0,r])
    translate([0,cl/2]) rotate([80,0,0]) translate([0,-s/2+ww+2.8,l/2]) cube([s+ww,s+ww+14,cl],true);
}

module motor_mounts(s,l,d,ahd,ahfe,ahfed){
    for(r=[0:90:359]){
        motor_mount(s,l,d,ahd,ahfe,ahfed,r);
    }
};


module motor_mount(s,l,d,ahd,ahfe,ahfed,r) {
    rotate([0,-10,r]) translate([l+20,0,s-2]) rotate([0,180,0]) color("blue")
    //include<"jth_motor_mount.scad">;
    import("generated_stls/jth_2204_motor_mount.stl");
}

module cam_mockup(cr) {
rotate([cr,0,225]) translate([-board_w/2,-board_d/2,0])
difference () {
    union () {
        // board
        cube ([board_w,board_d,board_h]);
        //cam_body
        translate([(board_w-cam_w)/2,(board_d-cam_d)/2,board_h]) cube([cam_w,cam_d,cam_h]);
        translate([board_w/2,board_d/2,board_h+cam_h+(5.5/2)]) cylinder (h=5.5, d=15.5,center=true);
        // lock ring
        translate([board_w/2,board_d/2,board_h+cam_h+5.5+(2.5/2)]) cylinder (h=2.5, d=15.5,center=true);
        // lens_shaft
        translate([board_w/2,board_d/2,board_h+cam_h+5.5+2.5+(3/2)]) cylinder (h=3, d=11.83,center=true);
        // lens body
        translate([board_w/2,board_d/2,board_h+cam_h+5.5+2.5+3+(3.6/2)]) cylinder (h=3.6, d=14,center=true);
        translate([(board_w-cam_w)/2-1,(board_d-cam_d),cam_h/2+board_h]) cylinder(h=cam_h, d=5, center=true);
        translate([(board_w-cam_w)/2+1+cam_w,(board_d-cam_d),cam_h/2+board_h]) cylinder(h=cam_h, d=5, center=true);
    }
    translate([3,3,2]) cylinder(d=3,h=5, center=true, $fn=50);
    translate([board_w-3,3,2]) cylinder(d=3,h=5, center=true, $fn=50);
    translate([3,board_d-3,2]) cylinder(d=3,h=5, center=true, $fn=50);
    translate([board_w-3,board_d-3,2]) cylinder(d=3,h=5, center=true, $fn=50);
}

}




board_w = 32;
board_d = 32;
board_h = 1.5;

cam_w = 17;
cam_d = 17;
cam_h = 7.5;

