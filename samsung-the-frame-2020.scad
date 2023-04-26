eps = 0.01;

box_width = 210;
box_height = 93;
box_depth = 34;

backside_depth = 20;

wall_thickness = 2;

difference() {
  hull() {
    cube([
      box_width + 2*wall_thickness,
      box_height + 1*wall_thickness,
      box_depth + backside_depth + 3*wall_thickness
    ], false);

    // translate([30, box_height + 60 + wall_thickness, 0])
    //   cube([box_width - 60 + 2*wall_thickness, eps, backside_depth + box_depth/2 + 3*wall_thickness], false);
  }

  translate([wall_thickness, -eps, wall_thickness])
    cube([box_width, box_height + eps, backside_depth], false);

  hull() {
    translate([wall_thickness, box_height + wall_thickness, wall_thickness])
      cube([box_width, eps, box_depth + backside_depth], false);

    // translate([30 + wall_thickness, box_height + 60, wall_thickness])
    //   cube([box_width - 60, eps, backside_depth + box_depth/2], false);
  }

  // bottom cable slots
  union() {
    slots_num = 3;
    slots_width = 40;
    side_margin = 14;

    color([1, 0, 0])
    for (i = [0 : slots_num-1]) {
      translate([
        wall_thickness + side_margin + i * slots_width + i * ((box_width - slots_num*slots_width - 2*side_margin) / (slots_num - 1)),
        box_height - eps,
        wall_thickness
      ])
        cube([slots_width, 10, backside_depth], false);
    }
  }

  // back access slots
  union() {
    slots_num = 2;
    slots_height = 20;
    slots_width = 30;
    side_margin = 24;

    color([1, 0, 0])
    for (i = [0 : slots_num-1]) {
      translate([
        wall_thickness + side_margin + i * slots_width + i * ((box_width - slots_num*slots_width - 2*side_margin) / (slots_num - 1)),
        box_height - slots_height - 10,
        -eps
      ])
        cube([slots_width, slots_height, backside_depth], false);
    }
  }

  // top cable slot
  union() {
    slot_height = 58;
    slot_width = 10;
    translate([box_width - slot_width - wall_thickness, -eps, -eps])
      cube([slot_width, slot_height, 10], false);
  }

  // right cable slot
  union() {
    slot_depth = 15;
    slot_height = 30;
    translate([-eps, box_height - slot_height, backside_depth + wall_thickness - slot_depth])
      cube([10, slot_height, slot_depth], false);
  }

  // samsung digital box cut-out
  translate([wall_thickness, 0, backside_depth + 2*wall_thickness])
  union() {
    cube([box_width, box_height, box_depth], false);

    // cut top
    color([1, 0, 0])
    translate([0, -5+eps, 0])
      cube([box_width, 5, box_depth], false);

    // cut left
    color([1, 0, 0])
    translate([box_width-eps, 5, 5])
      cube([5, box_height - 10, box_depth - 10], false);

    // cut right
    color([1, 0, 0])
    translate([-5+eps, 5, 5])
      cube([5, box_height - 10, box_depth - 10], false);

    // cut down
    color([1, 0, 0])
    translate([5, box_height-eps, 5])
      cube([box_width - 10, 5, box_depth - 10], false);

    // cut front
    color([1, 0, 0])
    translate([5, -5, box_depth-eps])
      cube([box_width - 10, box_height, 5], false);

    // cut back
    union() {
      slots_num = 4;
      slots_width = 30;
      margin = 5;
      color([1, 0, 0])
      for (i = [0 : slots_num-1]) {
        translate([
          margin + i * slots_width + i * ((box_width - 2*margin - slots_num*slots_width) / 3),
          margin,
          -margin+eps
        ])
          cube([slots_width, box_height - 10, 5], false);
      }
    }
  }
}
