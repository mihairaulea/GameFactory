package view.util 
{
	
	import flash.display.*; 
	import flash.events.*;
	import view.screens.*;
	
	public class ContentManipulator extends Sprite
	{
		
		private var contentArray:Array = new Array();
		
		private var firstScreen:FirstScreen = new FirstScreen();
		private var levelBrowser:LevelBrowser = new LevelBrowser();
		private var game:ActualGame = new ActualGame();
		
		private var oldContentPointer:ContentRequester;
		private var contentPointer:ContentRequester;
		
		public function ContentManipulator() 
		{
			
		}
		
		public function init()
		{
			setContent();
			setEventListeners();
		}
		
		private function setContent()
		{
			contentArray[0] = firstScreen;
			contentArray[1] = levelBrowser;
			contentArray[2] = game;
			
			for (var i:int = 0; i < contentArray.length; i++)
			{
				contentArray[i].visible = false;
				addChild(contentArray[i]);
			}
			
			contentPointer = firstScreen;
			contentPointer.visible = true;
			contentPointer.init(new Object());
		}
		
		private function setEventListeners()
		{
			for (var i:int = 0; i < contentArray.length; i++)
			{
				ContentRequester(contentArray[i]).contentId = i;
				ContentRequester(contentArray[i]).addEventListener(ContentRequester.REQUEST_NEW_CONTENT, newContentRequested);
			}
		}
		
		private function newContentRequested(e:Event)
		{
			trace("new content requested!!!");
			oldContentPointer = contentPointer;
			oldContentPointer.visible = false;
			contentPointer = contentArray[ContentRequester(e.target).contentToRequestId];			
			contentPointer.visible = true;
			contentPointer.init(ContentRequester(e.target).dataObject);
		}
		
		
		
		public function resize(sizeX:Number, sizeY:Number)
		{
			contentPointer.resizeElements(sizeX, sizeY);
		}
		
	}

}