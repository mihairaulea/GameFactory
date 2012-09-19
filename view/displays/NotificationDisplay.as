package view.displays 
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	import view.factories.NotificationFactory;
	import flash.events.MouseEvent;
	
	public class NotificationDisplay extends Sprite
	{
		//General variables
		public var posX:Number = -1;
		public var posY:Number = -1;
		
		var active:Boolean = false;
		var tmplDisplay:Sprite;
		var textField:TextField;
		
		
		//Factory
		private var notifFactory:NotificationFactory;
		
		public static var NOTIF_CLICK:String = "notifClick";
		
		public function NotificationDisplay() 
		{
			
		}
		
		public function init(text:String = "Notification", sizeX:int = 120, sizeY:int = 35, active:Boolean = false, glow:GlowFilter = null, shadow:DropShadowFilter = null, gradientArray:Array = null, textSize:int = 20, font:String = "HoboStd")
		{
			if (active == true)
				addEventListener(MouseEvent.CLICK, clickHandler);
			
			notifFactory = new NotificationFactory();
			
			if(gradientArray == null || gradientArray.length == 1)
				addTmpl(sizeX, sizeY);
			else
				addGradientTmpl(sizeX, sizeY, gradientArray);
				
			addText(text, glow, shadow, textSize, font);
		}
		
		public function deinit()
		{
			removeEventListener(MouseEvent.CLICK, clickHandler);
			removeChild(tmplDisplay);
			removeChild(textField);
		}
		
		private function addTmpl(sizeX:int, sizeY:int)
		{
			tmplDisplay = notifFactory.createTmpl(sizeX, sizeY);
			//tmplDisplay.x = -tmplDisplay.width / 2;
			//tmplDisplay.y = -tmplDisplay.height / 2;
			addChild(tmplDisplay);
		}
		
		private function addGradientTmpl(sizeX:int, sizeY:int, gradientArray:Array)
		{
			tmplDisplay = notifFactory.createTmplGradient(sizeX, sizeY, gradientArray);
			//tmplDisplay.x = -tmplDisplay.width / 2;
			//tmplDisplay.y = -tmplDisplay.height / 2;
			addChild(tmplDisplay);
		}
		
		private function addText(text:String = "Notification", glow:GlowFilter = null, shadow:DropShadowFilter = null, textSize:int = 20, font:String = "HoboStd")
		{
			textField = notifFactory.createText(text, glow, shadow, textSize, font);
			textField.x =tmplDisplay.width / 2 - textField.width / 2;
			textField.y =tmplDisplay.height / 2 - textField.height / 2;
			addChild(textField);
		}
		
		private function clickHandler(e:MouseEvent)
		{
			dispatchEvent(new Event(NOTIF_CLICK));
		}
	}

}