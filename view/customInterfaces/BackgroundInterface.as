package view.customInterfaces
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	
	public class BackgroundInterface extends Sprite
	{
		public var backgroundsArray:Array = new Array();
		private var activeBackground:Bitmap;
		
		public function BackgroundInterface() 
		{
			
		}
		
		public function addBackground(nr:int)
		{
			var bgClass:Class = Class(getDefinitionByName("background" + nr.toString()));
			var backgroundBM:Bitmap = new Bitmap(new bgClass());
			addChild(backgroundBM);
							
			backgroundsArray.push(backgroundBM);
			activeBackground = backgroundBM;
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