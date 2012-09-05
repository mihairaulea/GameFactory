package view 
{
	import fl.motion.Color;
	import flash.display.*;
	import flash.events.MouseEvent;
	import flash.events.TouchEvent;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.*;
	import flash.utils.Dictionary;
	import flash.events.Event;
	import view.factories.*;
	
	public class ButtonDisplay extends Sprite
	{
		//General variables
		var ratio:int = 0;
		var isActive:Boolean;
		var isHightligh:Boolean;
		
		var tmplDisplay:Sprite;
		var paramDisplay:Sprite;
		var textField:TextField;

		//Factory 
		private var buttonFactory:ButtonFactory;
		
		//Event variables
		public static var BUTTON_CLICK:String = "buttonClick";
		public static var BUTTON_OVER:String = "buttonOver";
		public static var BUTTON_OUT:String = "buttonOut";
		public static var BUTTON_DOWN:String = "buttonDown";
		
		//Event variables mobile
		//public static var BUTTON_TOUCH:String = "buttonTouch";
		
		public function ButtonDisplay() 
		{
			
		}
				
		public function init(tmpl:int = 0, param:String = "menu", glow:GlowFilter = null, shadow:DropShadowFilter = null)
		{	
			//PC events
			addEventListener(MouseEvent.CLICK, clickHandler);
			
			//Mobile events
			//addEventListener(TouchEvent.TOUCH_TAP, clickHandler);
	
			buttonFactory = new ButtonFactory();
			
			addTmpl(tmpl);
			if (tmpl == 0)
			{
				addText(param, glow, shadow);
				tmplDisplay.x = -tmplDisplay.width / 2;
				tmplDisplay.y = -tmplDisplay.height / 2;
			}
			else
				addParam(param);
		}
		
		public function deinit()
		{
			removeChild(tmplDisplay);
			if(paramDisplay != null)
				removeChild(paramDisplay);
			if(textField != null)
				removeChild(textField);
			removeEventListener(MouseEvent.CLICK, clickHandler);
		}
		
		private function addTmpl(tmpl:int)
		{
			tmplDisplay = buttonFactory.createTmpl(tmpl);
			ratio = tmplDisplay.width / tmplDisplay.height;
			
			addChild(tmplDisplay);
		}
		
		private function addParam(param:String)
		{
			paramDisplay = buttonFactory.createSymb(param);
			addChild(paramDisplay);
		}
		
		private function addText(param:String, glow:GlowFilter, shadow:DropShadowFilter)
		{
			textField = buttonFactory.createText(param, glow, shadow);
			textField.x = - textField.width / 2;
			textField.y = - textField.height / 2;
			
			addChild(textField);
		}
		
		private function clickHandler(e:MouseEvent)
		{
			dispatchEvent(new Event(BUTTON_CLICK));
		}
		
		private function overHandler(e:MouseEvent)
		{
			
		}
		
		private function outHandler(e:MouseEvent)
		{
			
		}
		
		private function downHandler(e:MouseEvent)
		{
			
		}
	}

}