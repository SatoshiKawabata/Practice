package
{
	import flash.display.Sprite;
	
	public class SingletonPattern extends Sprite
	{
		public function SingletonPattern()
		{
			
			var hoge:SingletonClass = SingletonClass.getInstance();
			hoge.sayHello();
		}
	}
}