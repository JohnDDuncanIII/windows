var Halign = {
    left:0,
    center:1,
    right:2
}
var Valign = {
    top:0,
    middle:1,
    bottom:2
}
var Trim = {
    no:0,
    chars:1,
    word:2,
    elips_chars:3,
    elips_word:4,
    elips_path:5
}
var Flag = {
    noclip:0x4000,
    nowrap:0x1000
}

function StringFormat() {
	var h_align = 0, v_align = 0, trimming = 0, flags = 0;
	switch (arguments.length)
	{
	// fall-thru
	case 4:
		flags = arguments[3];
	case 3:
		trimming = arguments[2];
	case 2:
		v_align = arguments[1];
	case 1:
		h_align = arguments[0];
		break;
	default:
		return 0;
	}
	return ((h_align << 28) | (v_align << 24) | (trimming << 20) | flags);
}

function RGBA(r, g, b, a) {
	return ((a << 24) | (r << 16) | (g << 8) | (b));
}