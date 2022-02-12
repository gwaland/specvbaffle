//variables for tube
input_OD = 10.7;
input_ID = 7.25;
input_H = 20;
input_fn = 60;

//variables for cube
cube_w = 12;
cube_d = 32;
cube_h = 14;


module diffuser_housing()
{
    difference(){
        union(){
            cube([cube_w, cube_d, cube_h], center = true);
            rotate([90,0,0])
            translate([0,0-cube_h/2,0])
                cylinder(h = cube_d, d = cube_w, center=true);
        };
        union(){
            cube([cube_w-2, cube_d-2, cube_h-2], center = true);
            rotate([90,0,0])
            translate([0,0-cube_h/2,0])
                cylinder(h = cube_d-2, d = cube_w-2, center=true);
        };
    }
}

module holes()
{

for ( z = [-9 : 4 : 2] ){
for ( x = [-3 : 6 : 3] ){
            rotate([90,0,0])
            translate([x,z,0])
            cylinder(h = 40, d = 3, $fn=60,center = true);
}
}
for ( x= [0-cube_d/2+3 : 4: cube_d/2-3]){
rotate([90,0,90])
translate([x,0-cube_h/2,0])
cylinder(h = 40, d = 3, $fn=60,center = true);
}
for ( z = [-3 : 6 : 3 ] ){
for ( x= [0-cube_d/2+3 : 4: cube_d/2-3]){
rotate([0,0,90])
translate([x,z,-10])
cylinder(h = 20, d = 3, $fn=60,center = true);
}
}
}
rotate([180,0,0])
difference(){
    union(){
        difference(){
            diffuser_housing();
            holes();
        }
        rotate([0,90,0])
        translate([0,0,5.5])
        cylinder( d = input_OD, h = input_H, $fn =      input_fn );
    }
    rotate([0,90,0])
    translate([0,0,4.5])
    cylinder( d = input_ID, h = input_H+5, $fn = input_fn );
    
}