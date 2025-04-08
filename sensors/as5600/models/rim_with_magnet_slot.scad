$fn = 90;

module movX(x) translate([x,0,0]) children();
module movY(y) translate([0,y,0]) children();
module movZ(z) translate([0,0,z]) children();
module rotZ(x) rotate([0,0,x]) children();

module rounded_cylinder(d, h, r, center=false) {
    minkowski() {
        translate([0,0,(center)?0:r/2]) cylinder(d=d-r, h=h-r, center=center);
        sphere(d=r);
    }
}

module 2d_shaft(d,p) {
    c = p-d/2;
    difference() {
        circle(d=d);
        translate([-d/2, c]) square([d, d]);
    }
    
    movY(-5/2) square([1,5], center=true);
}

module magnet() {
    magnet_d = 4;
    magnet_h = 2;
    
    cylinder(d1 = magnet_d * 1.2, d2 = magnet_d, h=magnet_h/2);
    movZ(magnet_h/2) cylinder(d=magnet_d, h=magnet_h/2);
}



rim_d = 28.6;
rim_h = 6.6;

rim_d_inner = 26.6;

rim_lock_piece_d = rim_d;
rim_lock_piece_h = 3.8;
rim_lock_piece_h_offset = (rim_h-rim_lock_piece_h)/2;

rim_distance_d = 7.0;
rim_distance_h = 8.6 - rim_h;


module 2d_sector(r, a, fn = 90) {
    _r = r / cos(180 / fn);
    step = -360 / fn;

    points = concat([[0, 0]],
        [for(_a = [a[0] : step : a[1] - 360]) 
            [_r * cos(_a), _r * sin(_a)]
        ],
        [[_r * cos(a[1]), _r * sin(a[1])]]
    );

    difference() {
        circle(r, $fn = fn);
        polygon(points);
    }
}

module cutoff(h, center=false) {
    th = 1.5;
    movZ(center?-h/2:0) linear_extrude(height=h) difference() {
        2d_sector(r=(rim_d_inner-2*th)/2,a=[0,360/3-15]);
        
        circle(d=rim_distance_d);
    }
}

difference() {
    union() {
        rounded_cylinder(d=rim_d_inner, h=rim_h, r=1, center=true);
        rounded_cylinder(d=rim_d, h=rim_lock_piece_h, r=1, center=true);
        
        movZ(rim_h/2) rounded_cylinder(d=rim_distance_d, h=2*rim_distance_h, r=1, center=true);
    }
    
    translate([0,0,-rim_h/2]) linear_extrude(height=2*rim_h) rotZ(-90) 2d_shaft(3.1, 2.4);
    
    for( rotation = [0,120,240] ) 
        rotZ(rotation) cutoff(rim_h, center=true);
    
    #movZ(-rim_h/2) magnet();
    
    //movZ(-50) cube([100,100,100]);
}