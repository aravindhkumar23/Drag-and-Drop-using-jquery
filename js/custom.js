// chart creation starts
		var chart1;
	function bar_show()
	{
		console.log("in seperate bar function");		
		chart1 = new cfx.Chart();
		chart1.getData().setSeries(2);
		chart1.getAxisY().setMin(100);
		chart1.getAxisY().setMax(500);
		// var Series1 = chart1.getSeries().getItem(0);
		var Series2 = chart1.getSeries().getItem(1);
		// Series1.setGallery(cfx.Gallery.Lines);
		Series2.setGallery(cfx.Gallery.Bar);
		var data=[
			{"month": "jan", "bikes": 300, "car": 200},
			{"month": "feb", "bikes": 200, "car": 300},
			{"month": "mar", "bikes": 250,"car":400},
			{"month": "jun", "bikes": 200,"car":100},
			{"month": "jul", "bikes": 400,"car":200}
			];
		chart1.getAnimations().getLoad().setEnabled(true);
		chart1.setDataSource(data);
		var divholder = document.getElementById("drop_box");
		chart1.create(divholder);
	}
	function line_show(){
		console.log("in seperate line function");		
		chart1 = new cfx.Chart();
		chart1.getData().setSeries(1);
		chart1.getAxisY().setMin(100);
		chart1.getAxisY().setMax(500);
		var Series1 = chart1.getSeries().getItem(0);		
		Series1.setGallery(cfx.Gallery.Lines);		
		var data=[
			{"month": "jan","car": 200},
			{"month": "feb","car": 300},
			{"month": "mar","car":400},
			{"month": "jun","car":100},
			{"month": "jul","car":200}
			];
		chart1.getAnimations().getLoad().setEnabled(true);
		chart1.setDataSource(data);
		var divholder = document.getElementById("drop_box");
		chart1.create(divholder);
	}
// end of chart creation