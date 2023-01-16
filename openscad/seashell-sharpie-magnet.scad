module base() {
scale(1.7)
rotate(15)
translate([0,-20,0])
import("SeaShellSolid.stl", convexity=4); }

magnet_position = [12,0,0];
magnet_diameter = 12;
magnet_height = 2.2;

sharpie_diameter = 13;
sharpie_position = [4,0,24+sharpie_diameter/2];
sharpie_height = 50;

postit_position = [12, 0, 14];
// 1.5 " x 2 " ?
postit_size = [56,40,12];

difference() {
    base();
    translate(magnet_position)
    cylinder(d=magnet_diameter, h=magnet_height*2, center=true);

    translate(sharpie_position)
    rotate([0,-30,0])
    rotate([0,90,0])
    translate([0,0,-12])
    cylinder(d=sharpie_diameter, h=sharpie_height, center=true);

    translate(postit_position)
    rotate([0,-30,0])
    cube(postit_size, center=true);
}
