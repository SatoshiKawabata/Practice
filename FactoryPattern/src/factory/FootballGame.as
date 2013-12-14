package factory
{
	/**
	 *  テンプレートメソッドを継承するクラス
	 * 
	 */	
	public class FootballGame extends BaseGame
	{
		public function FootballGame()
		{
			super();
		}
		
		override public function initialize():void
		{
			var field:IField = createField();
			field.drawField();
		}
		
		/**
		 *  IFieldを実装するクラスを返す関数
		 * @return IField 
		 * 
		 */		
		override public function createField():IField
		{
			return new FootballField();
		}
	}
}