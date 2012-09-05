package view 
{
	import flash.display.*;
	import flash.events.MouseEvent;
	
	public class LevelSelDisplay extends Sprite
	{
		var sprite:Sprite = new Sprite();
		
		
		public function LevelSelDisplay() 
		{
			
		}
		
		public function init(number:int, pic:Sprite)
		{
			addEventListener(MouseEvent.CLICK, clickHandler);
			
			var background:Bitmap = new Bitmap(new levelSelectBack());
			sprite.addChild(background);
			
			sprite.addChild(pic);
			
			var levelNumber:Bitmap = new Bitmap(new levelSelectFront());
			sprite.addChild(levelNumber);
			
			addNumber(number);
		}
		
		private function addNumber(number:int)
		{
			var textSize:int = 20;
			var textFont:Font = new HoboStd(); 
			var textColor:Object = 0xFFFFFF;
			var bold:Boolean = false;
			var underlined:Boolean = false;
			var alignment:String = "center";
			
			var textField:TextField = new TextField();
			var textFormat:TextFormat = new TextFormat(textFont.fontName, textSize, textColor, bold, false, underlined, null, null, alignment);
			
			textField.defaultTextFormat = textFormat;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.embedFonts = true;
			textField.antiAliasType = AntiAliasType.ADVANCED;
			textField.multiline = false;
			textField.selectable = false;
			
			sprite.addChild(textField);
		}
		
		private function clickHandler(e:MouseEvent)
		{
			dispatchEvent(new Event(BUTTON_CLICK));
		}
	}

}