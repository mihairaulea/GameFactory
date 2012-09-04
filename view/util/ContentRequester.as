package view.util 
{
	
	import flash.display.*;
	import flash.events.*;
	
	public class ContentRequester extends Sprite
	{
		
		public var contentId:int = -1;
		public static var REQUEST_NEW_CONTENT:String = "requestNewContent";
		
		public function ContentRequester() 
		{
			
		}
		
		public function requestContent(contentData:Object)
		{
			if (contentId == -1) throw new Error("Did not specify content Id");
			if (contentData == null) throw new Error("contentData Object can't be null");
			
			dispatchEvent(new Event(ContentRequester.REQUEST_NEW_CONTENT));
		}
		
	}

}