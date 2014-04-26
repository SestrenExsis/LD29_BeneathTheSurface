package
{
	import org.flixel.*;
	
	public class TheaterGroup extends FlxGroup
	{
		private var seats:Entity;
		private var topPanel:Entity;
		private var topCurtain:Entity;
		
		private var frontLeftCurtain:Curtain;
		private var frontRightCurtain:Curtain;
		
		private var midLeftCurtain:Curtain;
		private var midRightCurtain:Curtain;
		
		private var backLeftCurtain:Curtain;
		private var backRightCurtain:Curtain;
		private var stage:Entity;
		
		public var isAudienceView:Boolean;
		
		public function TheaterGroup()
		{
			super();
			
			stage = new Entity(0, 270);
			stage.loadGraphic(stage.imgStage, true, false, 640, 90);
			stage.origin.make(0.5 * stage.frameWidth, 0);
			
			backLeftCurtain = new Curtain("backdrop", true);
			backRightCurtain = new Curtain("backdrop", false);
			
			midLeftCurtain = new Curtain("far", true);
			midRightCurtain = new Curtain("far", false);
			
			frontLeftCurtain = new Curtain("near", true);
			frontRightCurtain = new Curtain("near", false);
			
			topCurtain = new Entity(0, 0);
			topCurtain.loadGraphic(topCurtain.imgTopCurtain, true, false, 640, 50);
			
			topPanel = new Entity(0, -20);
			topPanel.loadGraphic(topPanel.imgTopPanel);
			
			seats = new Entity(0, 285);
			seats.loadGraphic(seats.imgSeats, true, false, 640, 100);
			
			add(stage);
			
			add(backLeftCurtain);
			add(backRightCurtain);
			
			add(midLeftCurtain);
			add(midRightCurtain);
			
			add(frontLeftCurtain);
			add(frontRightCurtain);
			
			add(topCurtain);
			add(topPanel);
			add(seats);
		}
		
		public function switchView():void
		{
			isAudienceView = !isAudienceView;
			
			callAll("switchView", true);
		}
		
		override public function update():void
		{	
			super.update();
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				switchView();
			}
			else if (FlxG.keys.pressed("LEFT"))
			{
				midLeftCurtain.progress -= 0.005;
				midRightCurtain.progress -= 0.005;
				frontLeftCurtain.progress -= 0.005;
				frontRightCurtain.progress -= 0.005;
			}
			else if (FlxG.keys.pressed("RIGHT"))
			{
				midLeftCurtain.progress += 0.005;
				midRightCurtain.progress += 0.005;
				frontLeftCurtain.progress += 0.005;
				frontRightCurtain.progress += 0.005;
			}
		}
	}
	
}