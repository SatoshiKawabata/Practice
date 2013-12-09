package view
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import model.ClockData;
	
	public class DigitalClockView extends BaseClockView
	{
		//=========================================================
		// VARIABLES
		//=========================================================
		private var _frame:Sprite;
		private var _display:TextField;
		
		
		//=========================================================
		// PUBLIC METHODS
		//=========================================================
		/**
		 * constructor 
		 * @param data
		 * 
		 */		
		public function DigitalClockView(data:ClockData)
		{
			super(data);
			
			_frame = new Sprite();
			_frame.graphics.lineStyle(0, 0x000000, 1);
			_frame.graphics.drawRect(0, 0, 200, 50);
			addChild(_frame);
			
			// テキストフィールドを追加
			_display = new TextField();
			_display.width = 200;
			_display.height = 50;
			_display.autoSize = TextFieldAutoSize.RIGHT;
			_display.x = 195;
			_display.y = 5;
			addChild(_display);
			
			// オブジェクトが生成された時
			draw();
		}
		
		override protected function draw(event:Event = null):void
		{
			
		}
	}
}