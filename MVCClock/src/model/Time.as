package model
{
	public class Time
	{
		//=========================================================
		// VARIABLES
		//=========================================================
		private var _hour:uint;
		private var _minute:uint;
		private var _second:uint;

		//=========================================================
		// GETTER / SETTER
		//=========================================================
		public function get second():uint
		{
			return _second;
		}

		public function set second(value:uint):void
		{
			_second = value;
		}

		public function get minute():uint
		{
			return _minute;
		}

		public function set minute(value:uint):void
		{
			_minute = value;
		}

		public function get hour():uint
		{
			return _hour;
		}

		public function set hour(value:uint):void
		{
			_hour = value;
		}
		
		//=========================================================
		// PUBLIC METHODS
		//=========================================================
		/**
		 * constructor 
		 * @param hour
		 * @param minute
		 * @param second
		 * 
		 */		
		public function Time(hour:uint, minute:uint, second:int)
		{
			_hour = hour;
			_minute = minute;
			_second = second;
		}
		
		/**
		 * 元データへの直接参照を避けるかめの複製データ
		 * @return Time 
		 * 
		 */		
		public function clone():Time 
		{
			return new Time(_hour, _minute, _second);
		}
	}
}