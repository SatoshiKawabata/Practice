package model
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class ClockData extends EventDispatcher
	{
		//=========================================================
		// VARIABLES
		//=========================================================
		private var _time:Time;
		
		//=========================================================
		// GETTER / SETTER
		//=========================================================
		public function get time():Time
		{
			if (_time == null)
			{
				var date:Date = new Date();
				return new Time(date.hours, date.minutes, date.seconds);
			}
			else
			{
				return _time.clone();
			}
		}
		
		public function set time(value:Time):void
		{
			_time = value;
			// Timeデータが変わったイベントをブロードキャスト
			dispatchEvent(new Event(Event.CHANGE));
		}
		
		//=========================================================
		// PUBLIC METHODS
		//=========================================================
		/**
		 * constructor 
		 * @param target
		 * 
		 */		
		public function ClockData(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}