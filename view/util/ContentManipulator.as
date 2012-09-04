package view.util 
{
	
	import flash.display.*; 
	import flash.events.*;
	import view.screens.FirstScreen;
	
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
		
		public function setContent()
		{
			contentArray[0] = firstScreen;
			contentArray[1] = levelBrowser;
			contentArray[2] = game;
			
			contentPointer = firstScreen;
			addChild(contentPointer);
			
			// fara pozitionari!
			//.x .y
		}
		
		private function setEventListeners()
		{
			for (var i:int = 0; i < contentArray.length; i++)
			{
				ContentRequester(contentArray[i]).addEventListener(ContentRequester.REQUEST_NEW_CONTENT, newContentRequested);
			}
		}
		
		private function newContentRequested(e:Event)
		{
			oldContentPointer = contentPointer;
			removeChild(oldContentPointer);
			contentPointer = contentArray[ContentRequester(e.target).contentId];			
			addChild(contentPointer);
		}
		
	}

}