package
{
	import org.flixel.*;
	
	public class ResultState extends ScreenState
	{
		[Embed(source="../assets/images/Title.png")] public var imgTitle:Class;
		
		public var results:int;
		public var timer:FlxTimer;
		public var info:FlxText;
		
		public function ResultState(Results:int)
		{
			super();
			
			results = Results;
		}
		
		override public function create():void
		{
			super.create();
			
			var _title:FlxSprite = new FlxSprite(0, 0);
			_title.loadGraphic(imgTitle);
			_title.alpha = 0.5;
			add(_title);
			
			var _results:Instructions = new Instructions();
			add(_results);
			_results.timer.stop();
			_results.frame = results;
			_results.y = 150;
			_results.visible = true;
			
			timer = new FlxTimer();
			timer.start(20, 1);
			
			info = new FlxText(0, FlxG.height - 72, FlxG.width, "");
			info.setFormat(null, 16, 0xffffff, "center");
			info.text = "You can now watch your play as the audience\nsaw it by choosing \"Spectate\" from the main menu.\nMouse click or SPACEBAR to continue.";
			add(info);
		}
		
		override public function update():void
		{	
			super.update();
			
			if (timer.finished || FlxG.mouse.pressed() || FlxG.keys.justPressed("SPACE"))
				goToMenu();
		}
	}
	
}