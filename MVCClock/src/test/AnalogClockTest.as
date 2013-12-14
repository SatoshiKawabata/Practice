package test
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import model.ClockData;
	
	import view.AnalogClockView;
	import view.BaseClockView;
	
	/**
	 * アナログ時計のテストコード
	 */	
	public class AnalogClockTest extends Sprite
	{
		private var _clockData:ClockData;
		
		public function AnalogClockTest()
		{
			super();
			_clockData = new ClockData();
			var clock:BaseClockView = new AnalogClockView(_clockData);
			clock.x = 100;
			clock.y = 100;
			this.addChild(clock);
		}
	}
}