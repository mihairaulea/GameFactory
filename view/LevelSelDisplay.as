package view 
{
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.*;
	
	public class LevelSelDisplay extends Sprite
	{
		var sprite:Sprite = new Sprite();
		public var levelNr:int = -1;
				
		public function LevelSelDisplay() 
		{
			
		}
		
		public function init(number:int, pic:Sprite)
		{
			//addEventListener(MouseEvent.CLICK, clickHandler);
			levelNr = number;
			
			var background:Bitmap = new Bitmap(new levelSelectBack());
			sprite.addChild(background);
			
			pic.x = 5;
			pic.y = 11;
			sprite.addChild(pic);
			
			var levelNumber:Bitmap = new Bitmap(new levelSelectFront());
			sprite.addChild(levelNumber);
			
			addNumber(number);
			
			addChild(sprite);
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
			
			textField.text = number.toString();
			textField.x = sprite.width - textField.width - 9;
			textField.y = 2;
			sprite.addChild(textField);
		}
		
	}

}