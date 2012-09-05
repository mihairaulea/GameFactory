package view.util 
{
	
	import flash.display.*;
	import flash.events.*;
	
	public class ContentRequester extends Sprite
	{
		
		public var contentId:int = -1;
		
		public var contentToRequestId:int = -1;
		public var dataObject:Object;
		public static var REQUEST_NEW_CONTENT:String = "requestNewContent";
		
		public function ContentRequester() 
		{
			
		}
		
		public function init(initData:Object)
		{
			
		}
		
		public function requestContent(contentToRequestIdParam:int,contentData:Object)
		{
			if (contentId == -1) throw new Error("Did not specify requesting content id");
			if (contentToRequestIdParam == -1) throw new Error("Did not specify content id to request");
			if (contentData == null) throw new Error("contentData Object can't be null");
			
			this.contentToRequestId = contentToRequestIdParam;
			this.dataObject = contentData;
			dispatchEvent(new Event(ContentRequester.REQUEST_NEW_CONTENT));
		}
		
		public function resizeElements(syzeX:Number, syzeY:Number)
		{
			
		}
	}

}