difference() {
  union() {
    hull() {
      translate([0, 0, 2])
        cube([18, 10, 2], false);
      cube([18, 20, 1], false);
    }
    translate([2, 0, 0])
      cube([14, 33, 4], false);

    translate([18/2, 26, 0])
      cylinder(6, d=9.5, $fn=360);
  }

  translate([18/2, 6, -1])
    cylinder(6, d=8, $fn=360);
}
