/*
Based on motor_mount_12mm.stl from:
http://www.thingiverse.com/thing:1025343
<div xmlns:cc="http://creativecommons.org/ns#" xmlns:dct="http://purl.org/dc/terms/" about="http://www.thingiverse.com/thing:1025343"><span property="dct:title">Minimalistic single screw motor mounts</span> (<a rel="cc:attributionURL" property="cc:attributionName" href="http://www.thingiverse.com/alessiomorale">alessiomorale</a>) / <a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/">CC BY-SA 3.0</a></div>


*/


difference() {
    union() {

        translate([0,-5,0]) difference() {
            import("imported_stls/motor_mount_12mm.stl");
            translate([-10,0,-15]) cube([50,30,30]);
        }

        translate([-2,-6,6]) cube([29,7,5]);
        translate([-2,-6,-9]) cube([29,7,5]);

        difference() {
            import("imported_stls/motor_mount_12mm.stl");
            translate([-10,-30,-15]) cube([50,30,30]);
        }

    }

    translate([9,-3,0]) cube([30,14,14],true);

}