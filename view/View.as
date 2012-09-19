package view 
{
	
	import flash.display.*;
	import flash.events.*;
	import view.util.ContentManipulator;
	
	public class View extends Sprite
	{
		
		var contentManipulator:ContentManipulator = new ContentManipulator();
		
		public function View() 
		{
			
		}
		
		public function initView(sizeX:Number = 800, sizeY:Number = 400)
		{
			contentManipulator.init(sizeX,sizeY);
			addChild(contentManipulator);
		}
		
		public function resizeElements(sizeX:Number, sizeY:Number)
		{
			contentManipulator.resize(sizeX, sizeY);
		}
		
	}

}