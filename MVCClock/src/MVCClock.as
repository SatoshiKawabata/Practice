package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	import model.ClockData;
	
	import test.DigitalClockTest;
	
	import view.AnalogClockView;
	
	/**
	 * クロックのテストコード
	 * 
	 */	
	public class MVCClock extends Sprite
	{
		public function MVCClock()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var digitalClockTest:DigitalClockTest = new DigitalClockTest();
			addChild(digitalClockTest);
		}
	}
}