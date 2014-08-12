import flash.events.MouseEvent;

//init children
var shape:Shape = new Shape();
addChild(shape);

//ini listeners
btn1.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
btn2.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);
btn3.addEventListener(MouseEvent.ROLL_OVER, rollOverHandler);

//handlers
function rollOverHandler(event:MouseEvent):void {
	var graphics:Graphics = this.graphics;
	//var graphics:Graphics = shape.graphics;
	
	graphics.clear();
	graphics.beginFill(Math.random() * uint.MAX_VALUE);
	graphics.drawRect(20, 20, 50, 50);
	graphics.endFill();
}