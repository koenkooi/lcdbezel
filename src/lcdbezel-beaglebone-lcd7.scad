/* (c) 2012 - Koen Kooi */

lcd_width = 164;
lcd_length = 103;
lcd_height = 6;

edge_width = 10;

left_overlap = 3;
right_overlap = 7;
top_overlap = 4;
bottom_overlap = 10;

module lcd(w, l, h) {
	cube([w,l,h]);
	translate(v=[left_overlap, bottom_overlap, h/2]) cube([w - left_overlap - right_overlap,l - top_overlap - bottom_overlap,h]);
}

module bezel() {
	difference() {
		hull() {
			cube([lcd_width + edge_width, lcd_length + edge_width, 0.1]);
			translate(v=[edge_width/2, edge_width/2, 0]) cube([lcd_width + 0.1, lcd_length + 0.1, lcd_height]);
		}
		translate(v=[edge_width/2, edge_width/2, -0.5]) lcd(lcd_width, lcd_length, lcd_height);
	}

}



bezel();