package view
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import model.ClockData;
	
	public class BaseClockView extends Sprite
	{
		//=========================================================
		// VARIABLES
		//=========================================================
		protected var _data:ClockData;
		
		//=========================================================
		// PUBLIC METHODS
		//=========================================================
		/**
		 * constructor 
		 * @param data
		 * 
		 */		
		public function BaseClockView(data:ClockData)
		{
			super();
			_data = data;
			_data.addEventListener(Event.CHANGE, draw);
		}
		
		/**
		 * draw 
		 * @param event
		 * 
		 */		
		protected function draw(event:Event = null):void
		{
			
		}
	}
}