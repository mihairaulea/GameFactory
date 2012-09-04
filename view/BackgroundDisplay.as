package view 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	public class BackgroundDisplay extends Sprite
	{
		public var backgroundsArray:Array = new Array();
		private var test:Sprite = new Sprite();
		
		public function BackgroundDisplay() 
		{
			
		}
		
		public function addBackground(w:int, h:int)
		{
			var backgroundBM:Bitmap = new Bitmap(new background());
			backgroundBM.x = -backgroundBM.width / 2;
			backgroundBM.y = -backgroundBM.height / 2;
			test.addChild(backgroundBM);
						
			test.x = w/2;
			test.y = h/2;
			
			backgroundsArray.push(test);
			addChild(test);
		}
		
		public function resize(w:int, h:int)
		{
			test.width = w;
			test.height = h;
			
		}
		
	}

}