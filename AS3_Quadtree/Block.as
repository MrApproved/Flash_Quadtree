package
{
	import flash.display.MovieClip;

	public class Block extends MovieClip
	{

		public function Block(xPosition:Number, yPosition:Number, givenWidth:Number, givenHeight:Number)
		{
			//creation
			this.x = xPosition;
			this.y = yPosition;
			this.width = givenWidth;
			this.height = givenHeight;
		}

	}
}