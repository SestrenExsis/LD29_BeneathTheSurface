package
{
	import org.flixel.*;
	
	public class TheaterGroup extends FlxGroup
	{
		private var seats:Entity;
		private var valance:Entity;
		
		private var frontLeftCurtain:Curtain;
		private var frontRightCurtain:Curtain;
		
		private var midLeftCurtain:Curtain;
		private var midRightCurtain:Curtain;
		
		private var leftBackdrop:Curtain;
		private var rightBackdrop:Curtain;
		private var stageFloor:StageFloor;
		
		public var isAudienceView:Boolean = true;
		public var info:String;
		
		public function TheaterGroup()
		{
			super();
			
			Entity.currentLayer = 0;
			//background
			leftBackdrop = new Curtain("backdrop", true);
			rightBackdrop = new Curtain("backdrop", false);
			stageFloor = new StageFloor();
			add(leftBackdrop);
			add(rightBackdrop);
			add(stageFloor);
			
			Entity.currentLayer = 1;
			//curtains
			midLeftCurtain = new Curtain("far", true);
			midRightCurtain = new Curtain("far", false);
			frontLeftCurtain = new Curtain("near", true);
			frontRightCurtain = new Curtain("near", false);
			add(midLeftCurtain);
			add(midRightCurtain);
			add(frontLeftCurtain);
			add(frontRightCurtain);
			
			Entity.currentLayer = 2;
			//foreground
			valance = new Valance();
			seats = new Entity(0, 285);
			seats.loadGraphic(seats.imgSeats, true, false, 640, 100);
			add(valance);
			add(seats);
			
			sort("order");
			sort("layer");
		}
		
		public function switchView():void
		{
			isAudienceView = !isAudienceView;
			
			callAll("switchView", true);
			
			if (isAudienceView)
			{
				sort("order");
				sort("layer");
				info = "Audience's View";
			}
			else
			{
				sort("order", DESCENDING);
				sort("layer");
				info = "Director's View";
			}
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