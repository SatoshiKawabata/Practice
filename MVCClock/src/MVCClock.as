package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import model.ClockData;
	
	import view.AnalogClockView;
	
	/**
	 * クロックのテストコード 
	 * @author kawabatasatoshi
	 * 
	 */	
	public class MVCClock extends Sprite
	{
		private var _clockData:ClockData;
		
		
		public function MVCClock()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_clockData = new ClockData();
			var clock:AnalogClockView = new AnalogClockView(_clockData);
			clock.x = 100;
			clock.y = 100;
			this.addChild(clock);
		}
	}
}