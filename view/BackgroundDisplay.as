package view 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	public class BackgroundDisplay extends Sprite
	{
		public var backgroundsArray:Array = new Array();
		private var activeBackground:Sprite = new Sprite();
		
		public function BackgroundDisplay() 
		{
			
		}
		
		public function addBackground()
		{
			var sprite:Sprite = new Sprite();
			var backgroundBM:Bitmap = new Bitmap(new background());
			sprite.addChild(backgroundBM);
							
			backgroundsArray.push(sprite);
			activeBackground = sprite;
			addChild(sprite);
		}
		
		public function resize(sizeX:int, sizeY:int)
		{		
			var scale = 0;
			
			if ((sizeY / sizeX) > (activeBackground.height / activeBackground.width))
			{
				scale = activeBackground.width / activeBackground.height;
				activeBackground.height = sizeY;
				activeBackground.width = sizeY * scale;
			}
			else
			{
				scale = activeBackground.height / activeBackground.width;
				activeBackground.width = sizeX;
				activeBackground.height = sizeX * scale;
			}
			
			activeBackground.x = sizeX - activeBackground.width;
			activeBackground.y = sizeY - activeBackground.height;
		}
		
	}

}