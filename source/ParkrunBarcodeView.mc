using Toybox.WatchUi;

class ParkrunBarcodeView extends WatchUi.View {
  // Code128 table. Generated by tablegen.py
    const barcodeTable = {
        0 => [2,1,2,2,2,2],
        1 => [2,2,2,1,2,2],
        2 => [2,2,2,2,2,1],
        3 => [1,2,1,2,2,3],
        4 => [1,2,1,3,2,2],
        5 => [1,3,1,2,2,2],
        6 => [1,2,2,2,1,3],
        7 => [1,2,2,3,1,2],
        8 => [1,3,2,2,1,2],
        9 => [2,2,1,2,1,3],
        10 => [2,2,1,3,1,2],
        11 => [2,3,1,2,1,2],
        12 => [1,1,2,2,3,2],
        13 => [1,2,2,1,3,2],
        14 => [1,2,2,2,3,1],
        15 => [1,1,3,2,2,2],
        16 => [1,2,3,1,2,2],
        17 => [1,2,3,2,2,1],
        18 => [2,2,3,2,1,1],
        19 => [2,2,1,1,3,2],
        20 => [2,2,1,2,3,1],
        21 => [2,1,3,2,1,2],
        22 => [2,2,3,1,1,2],
        23 => [3,1,2,1,3,1],
        24 => [3,1,1,2,2,2],
        25 => [3,2,1,1,2,2],
        26 => [3,2,1,2,2,1],
        27 => [3,1,2,2,1,2],
        28 => [3,2,2,1,1,2],
        29 => [3,2,2,2,1,1],
        30 => [2,1,2,1,2,3],
        31 => [2,1,2,3,2,1],
        32 => [2,3,2,1,2,1],
        33 => [1,1,1,3,2,3],
        34 => [1,3,1,1,2,3],
        35 => [1,3,1,3,2,1],
        36 => [1,1,2,3,1,3],
        37 => [1,3,2,1,1,3],
        38 => [1,3,2,3,1,1],
        39 => [2,1,1,3,1,3],
        40 => [2,3,1,1,1,3],
        41 => [2,3,1,3,1,1],
        42 => [1,1,2,1,3,3],
        43 => [1,1,2,3,3,1],
        44 => [1,3,2,1,3,1],
        45 => [1,1,3,1,2,3],
        46 => [1,1,3,3,2,1],
        47 => [1,3,3,1,2,1],
        48 => [3,1,3,1,2,1],
        49 => [2,1,1,3,3,1],
        50 => [2,3,1,1,3,1],
        51 => [2,1,3,1,1,3],
        52 => [2,1,3,3,1,1],
        53 => [2,1,3,1,3,1],
        54 => [3,1,1,1,2,3],
        55 => [3,1,1,3,2,1],
        56 => [3,3,1,1,2,1],
        57 => [3,1,2,1,1,3],
        58 => [3,1,2,3,1,1],
        59 => [3,3,2,1,1,1],
        60 => [3,1,4,1,1,1],
        61 => [2,2,1,4,1,1],
        62 => [4,3,1,1,1,1],
        63 => [1,1,1,2,2,4],
        64 => [1,1,1,4,2,2],
        65 => [1,2,1,1,2,4],
        66 => [1,2,1,4,2,1],
        67 => [1,4,1,1,2,2],
        68 => [1,4,1,2,2,1],
        69 => [1,1,2,2,1,4],
        70 => [1,1,2,4,1,2],
        71 => [1,2,2,1,1,4],
        72 => [1,2,2,4,1,1],
        73 => [1,4,2,1,1,2],
        74 => [1,4,2,2,1,1],
        75 => [2,4,1,2,1,1],
        76 => [2,2,1,1,1,4],
        77 => [4,1,3,1,1,1],
        78 => [2,4,1,1,1,2],
        79 => [1,3,4,1,1,1],
        80 => [1,1,1,2,4,2],
        81 => [1,2,1,1,4,2],
        82 => [1,2,1,2,4,1],
        83 => [1,1,4,2,1,2],
        84 => [1,2,4,1,1,2],
        85 => [1,2,4,2,1,1],
        86 => [4,1,1,2,1,2],
        87 => [4,2,1,1,1,2],
        88 => [4,2,1,2,1,1],
        89 => [2,1,2,1,4,1],
        90 => [2,1,4,1,2,1],
        91 => [4,1,2,1,2,1],
        92 => [1,1,1,1,4,3],
        93 => [1,1,1,3,4,1],
        94 => [1,3,1,1,4,1],
        95 => [1,1,4,1,1,3],
        96 => [1,1,4,3,1,1],
        97 => [4,1,1,1,1,3],
        98 => [4,1,1,3,1,1],
        99 => [1,1,3,1,4,1],
        100 => [1,1,4,1,3,1],
        101 => [3,1,1,1,4,1],
        102 => [4,1,1,1,3,1],
        103 => [2,1,1,4,1,2],
        104 => [2,1,1,2,1,4],
        105 => [2,1,1,2,3,2],
        106 => [2,3,3,1,1,1]
    };
    const characterLength = 11;
	
	function drawChar(dc, x, y, height, digit) {
		var widths = barcodeTable[digit];
		dc.fillRectangle(x, y, widths[0], height);
		x += widths[0] + widths[1];
		dc.fillRectangle(x, y, widths[2], height);
		x += widths[2] + widths[3];
		dc.fillRectangle(x, y, widths[4], height);
	}
	function drawBarcode(dc, x, y, height, number) {
		var idx = 1;
		var checksum = 0;
		
		//Start Code B
		drawChar(dc, x, y, height, 104);
		checksum += 104*idx;
		x += characterLength;
		//'A'
		drawChar(dc, x, y, height, 33);
		checksum += 33*idx;
		idx++;
		x += characterLength;
		var asArray = number.toCharArray();
		
		for(var i = 1; i < asArray.size(); i++) {
			// -48 to convert from ASCII, +16 for the matching Code128 digit
			var digit = asArray[i].toNumber() - 48 + 16;
			drawChar(dc, x, y, height, digit);
			checksum += digit*idx;
			idx++;
			x += characterLength;
		}
		//Checksum
		checksum %= 103;
		drawChar(dc, x, y, height, checksum);
		x += characterLength;
		//Stop
		drawChar(dc, x, y, height, 106);
		x += characterLength;
		//Terminating bar
		dc.fillRectangle(x, y, 2, height);
	}
	
    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
      
    }

    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
    	dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_WHITE);
		dc.clear();
		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_WHITE);
		//4206448
		drawBarcode(dc, 40, 70, 50, "A4206448");
	}

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
	function onHide() {
	}
}