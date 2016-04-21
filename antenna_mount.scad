antenna_tilt = 50;
antenna_rear_shift = -1;
antenna_vert_shift = 3;
antenna_id = 1;
antenna_length = 10;
antenna_thickness = 0.5;
plate_thickness = 1.8;
mount_thickness = 2;
mount_x = 6;
mount_y = 6;


$fs=0.2;

difference() {
    hull() {
        cube([mount_x,mount_y,plate_thickness + mount_thickness],true);
        translate([antenna_rear_shift,0,antenna_vert_shift]) rotate([0,antenna_tilt,0]) cylinder(antenna_length,antenna_id + antenna_thickness,antenna_id + antenna_thickness,true);
    }
    translate([mount_thickness,0,0]) cube([mount_x+1,mount_y+1,plate_thickness],true);
    translate([antenna_rear_shift,0,antenna_vert_shift]) rotate([0,antenna_tilt,0]) cylinder(antenna_length+1,antenna_id,antenna_id,true);

}

