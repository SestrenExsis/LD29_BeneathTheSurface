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
		
		private var wave0:Wave;
		private var wave1:Wave;
		private var wave2:Wave;
		
		public var information:InfoText;
		public var isAudienceView:Boolean = true;
		
		private var debugEntity:Entity;
		
		public function TheaterGroup()
		{
			super();
			
			Entity.currentLayer = 0;
			//background
			leftBackdrop = new Curtain(Curtain.BACKDROP, true);
			rightBackdrop = new Curtain(Curtain.BACKDROP, false);
			
			Entity.currentLayer = 1;
			stageFloor = new StageFloor();
			add(leftBackdrop);
			add(rightBackdrop);
			add(stageFloor);
			
			Entity.currentLayer = 2;
			//curtains
			midLeftCurtain = new Curtain(Curtain.INSIDE_CURTAIN, true);
			midRightCurtain = new Curtain(Curtain.INSIDE_CURTAIN, false);
			wave2 = new Wave(2);
			wave1 = new Wave(1);
			wave0 = new Wave(0);
			frontLeftCurtain = new Curtain(Curtain.OUTSIDE_CURTAIN, true);
			frontRightCurtain = new Curtain(Curtain.OUTSIDE_CURTAIN, false);

			add(midLeftCurtain);
			add(midRightCurtain);
			add(wave2);
			add(wave1);
			add(wave0);
			add(frontLeftCurtain);
			add(frontRightCurtain);
			
			Entity.currentLayer = 3;
			//foreground
			/*valance = new Valance();
			seats = new Entity(0, 285);
			seats.loadGraphic(seats.imgSeats, true, false, 640, 100);
			add(valance);
			add(seats);*/
			
			Entity.currentLayer = 4;
			//other
			information = new InfoText();
			add(information);
			
			sort("order");
			sort("ID");
		}
		
		public function switchView():void
		{
			isAudienceView = !isAudienceView;
			
			callAll("switchView", true);
		}
		
		override public function preUpdate():void
		{
			super.preUpdate();
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				switchView();
				
				if (isAudienceView)
					sort("order");
				else
					sort("order", DESCENDING);
			}
			sort("ID");
		}
		
		override public function update():void
		{	
			super.update();
			
			if (FlxG.keys.pressed("LEFT"))
			{
				frontLeftCurtain.progress -= 0.005;
				frontRightCurtain.progress -= 0.005;
			}
			else if (FlxG.keys.pressed("RIGHT"))
			{
				frontLeftCurtain.progress += 0.005;
				frontRightCurtain.progress += 0.005;
			}
			else if (FlxG.keys.pressed("UP"))
			{
				//debugEntity.stageY += 0.005;
			}
			else if (FlxG.keys.pressed("DOWN"))
			{
				//debugEntity.stageY -= 0.005;
			}
			else if (FlxG.keys.pressed("Z"))
			{
				wave0.stageX -= 0.005;
			}
			else if (FlxG.keys.pressed("X"))
			{
				wave0.stageX += 0.005;
			}
		}
	}
	
}