package view
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import model.ClockData;
	import model.Time;
	
	public class AnalogClockView extends BaseClockView
	{
		//=========================================================
		// VARIABLES
		//=========================================================
		private var _face:Sprite;
		private var _hourHand:Sprite;
		private var _minuteHand:Sprite;
		private var _secondHand:Sprite;
		
		//=========================================================
		// PUBLIC METHODS
		//=========================================================
		/**
		 * constructor 
		 * @param data
		 * 
		 */		
		public function AnalogClockView(data:ClockData)
		{
			super(data);
			
			// 文字盤と円を描く
			_face = new Sprite();
			var g:Graphics = _face.graphics;
			g.lineStyle(0, 0x000000, 1);
			g.drawCircle(0,0, 100);
			this.addChild(_face);
			
			// 針を描く
			_hourHand = new Sprite();
			createHand(_hourHand.graphics, 5);
			this.addChild(_hourHand);
			_minuteHand = new Sprite();
			createHand(_minuteHand.graphics, 2);
			this.addChild(_minuteHand);
			_secondHand = new Sprite();
			createHand(_secondHand.graphics, 0);
			this.addChild(_secondHand);
			
			// 描画
			draw();
		}
		
		/**
		 * drawメソッドオーバーライド 
		 * @param event
		 * 
		 */		
		override protected function draw(event:Event = null):void
		{
			// Timeオブジェクトのクローンを受け取る
			var time:Time = _data.time;
			
			// 時間に応じて時計の針を動かす
			_hourHand.rotation = 30 * time.hour + 30 * time.minute / 60;
			_minuteHand.rotation = 6 * time.minute + 6 * time.second / 60;
			_secondHand.rotation = 6 * time.second;
		}
		
		private function createHand(g:Graphics, lineWidth:int):void
		{
			g.lineStyle(lineWidth, 0x000000, 1);
			g.lineTo(0, -50);
		}
	}
}