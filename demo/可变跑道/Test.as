package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.utils.getTimer;
	
	import avmplus.getQualifiedClassName;
	
	[SWF(width="800", height="600")]
	public class Test extends Sprite
	{
		private var _lastTime:int = 0;
		
		private var _shape:Shape;
		private var _stats:Stats;
		private var _debugText:TextField;
		
		public function Test()
		{
			stage.frameRate = 1;
			
			_shape = new Shape();
			addChild(_shape);
			
			_stats = new Stats();
			addChild(_stats);
			
			_debugText = new TextField();
			_debugText.border = true;
			_debugText.wordWrap = true;
			_debugText.multiline = true;
			_debugText.y = _stats.height;
			_debugText.width = 300;
			_debugText.height = 400;
			_debugText.mouseEnabled = false;
			addChild(_debugText);
			
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, stageMouseMoveHandler);
			this.stage.addEventListener(Event.ENTER_FRAME, stageEnterframeHandler);
			this.stage.addEventListener(Event.RENDER, stageRenderHandler);
			
			_lastTime = getTimer();
		}
		
		private function stageMouseMoveHandler(event:MouseEvent):void
		{
//			event.updateAfterEvent();
			
			stage.invalidate();
			
			_shape.graphics.clear();
			_shape.graphics.beginFill(0xFF0000);
			_shape.graphics.drawCircle(event.localX, event.localY, 30);
			_shape.graphics.endFill();
		}
		
		private function stageEnterframeHandler(event:Event):void
		{
			var t:int = getTimer();
			var delta:int = t - _lastTime;
			_lastTime = t;
			
			debugLog("Frame delta time: " + delta + " ms");
		}
		
		private function stageRenderHandler(event:Event):void
		{
			debugLog("Render");
		}
		
		private function debugLog(s:String):void
		{
			_debugText.appendText(s + "\n");
			_debugText.scrollV = _debugText.textHeight;
		}
	}
}