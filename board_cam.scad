board_w = 32;
board_d = 32;
board_h = 1.5;

cam_w = 17;
cam_d = 17;
cam_h = 7.5;

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