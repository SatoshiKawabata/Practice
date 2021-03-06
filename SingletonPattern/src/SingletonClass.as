package
{
	/**
	 *  シングルトンパターンクラス
	 * 
	 */	
	public class SingletonClass
	{
		// privateでstaticな変数
		private static var _instance:SingletonClass;
		
		/**
		 * constructor 
		 * 
		 */		
		public function SingletonClass(enforcer:SingletonEnforcer)
		{
		}
		
		/**
		 * インスタンス取得メソッド 
		 * @return SingletonClass
		 * 
		 */		
		public static function getInstance():SingletonClass
		{
			if (SingletonClass._instance == null)
			{
				SingletonClass._instance = new SingletonClass(new SingletonEnforcer());
			}
			return SingletonClass._instance;
		}
		
		public function sayHello():void
		{
			trace('Hello World');
		}
	}
}
/**
 * コンストラクタを強制的に呼び出せなくする外部からアクセス不可能な空クラスを定義
 * 
 */
class SingletonEnforcer {}