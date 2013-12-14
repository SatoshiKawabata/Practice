package
{
	import factory.BaseGame;
	import factory.FootballGame;
	
	import flash.display.Sprite;
	
	public class TemplateMethodFactoryPattern extends Sprite
	{
		public function TemplateMethodFactoryPattern()
		{
			var game:BaseGame = new FootballGame();
			game.initialize();
		}
	}
}