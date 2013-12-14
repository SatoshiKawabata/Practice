package factory
{
	/**
	 *  テンプレートメソッド抽象クラス
	 * 
	 */	
	public class BaseGame
	{
		public function BaseGame()
		{
		}
		
		public function initialize():void
		{
			// 無処理
		}
		
		public function createField():IField
		{
			throw new Error('createField:Abstract Methd!');
		}
	}
}