package view.factories 
{

	import flash.display.*;
	import flash.filters.DropShadowFilter;
	import flash.filters.GlowFilter;
	import flash.text.*;
	
	public class ButtonFactory extends AbFactory
	{	
		public function ButtonFactory() 
		{
			
		}
		
		public function createTmpl(type:int):Sprite
		{
			var sprite:Sprite = new Sprite();
			switch(type)
			{
				case 0:
					var tmplBigBtn:Bitmap = new Bitmap(new TemplateBigBtn());
					sprite.addChild(tmplBigBtn);
					break;
				case 1:
					var tmplCircleBtn:Bitmap = new Bitmap(new TemplateCircleBtn());
					sprite.addChild(tmplCircleBtn);
					break;
				case 2:
					var tmplSquareBtn:Bitmap = new Bitmap(new TemplateSquareBtn());
					sprite.addChild(tmplSquareBtn);
					break;
			}
			
			return sprite;
		}
		
		public function createSymb(symb:String):Sprite
		{
			var sprite:Sprite = new Sprite();
			switch(symb)
			{
				case "about":
					var about:Bitmap = new Bitmap(new AboutBtn());
					sprite.addChild(about);
					break;
				case "help":
					var help:Bitmap = new Bitmap(new HelpBtn());
					sprite.addChild(help);
					break;
				case "menu":
					var menu:Bitmap = new Bitmap(new MenuBtn());
					sprite.addChild(menu);
					break;
				case "setup":
					var setup:Bitmap = new Bitmap(new SetupBtn());
					sprite.addChild(setup);
					break;
			}
			
			return sprite;
		}
		
		public function createText(text:String = "menu", glow:GlowFilter = null, shadow:DropShadowFilter = null):TextField
		{
			var textSize:int = 35;
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
			
			if( glow != null && shadow != null)
				textField.filters = [glow, shadow];
			else if ( glow != null)
				textField.filters = [glow];
			else if ( shadow != null)
				textField.filters = [shadow];
				
			textField.text = text;
			return textField;
		}
	}

}