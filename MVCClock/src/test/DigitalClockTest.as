package test
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import model.ClockData;
	
	import view.BaseClockView;
	import view.DigitalClockView;
	
	/**
	 * 
	 * デジタル時計のテストコード
	 * 
	 */	
	public class DigitalClockTest extends Sprite
	{
		private var _clockData:ClockData;
		
		public function DigitalClockTest()
		{
			super();
			_clockData = new ClockData();
			var clock:BaseClockView = new DigitalClockView(_clockData);
			clock.x = 100;
			clock.y = 100;
			this.addChild(clock);
		}
	}
}