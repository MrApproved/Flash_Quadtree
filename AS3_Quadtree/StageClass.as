package
{

	import flash.display.MovieClip;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import fl.motion.Color

	public class StageClass extends MovieClip
	{

		//Variables
		private var blocks:Array;
		private var blocksTL:Array;	//Top Left
		private var blocksTR:Array; //Top Right
		private var blocksBL:Array; //Bottom Left
		private var blocksBR:Array; //Bottom Right
		private var blocksTLbool:Boolean = false;
		private var blocksTRbool:Boolean = false;
		private var blocksBLbool:Boolean = false;
		private var blocksBRbool:Boolean = false;
		private var color:Color=new Color();
		private var gameTimer:Timer;
		private var cursor:MouseCursor;
		private var textRuns:Text = new Text();

		public function StageClass()
		{
			Mouse.show();
			Mouse.hide();

			gameTimer = new Timer( 30 );
			//On every 30ms we call apon moveEvent function
			gameTimer.addEventListener( TimerEvent.TIMER, tick );
			gameTimer.start();

			//Mouse
			cursor = new MouseCursor();

			//Top Left
			blocksTL = new Array;

			tempBlock = new Block(1,1,100,100);
			color.tintColor = 0xFF0000;	
			color.tintMultiplier = 0.5;
			tempBlock.transform.colorTransform = color;
			blocksTL.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(1,101,100,100);
			tempBlock.transform.colorTransform = color;
			blocksTL.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(101,101,100,100);
			tempBlock.transform.colorTransform = color;
			blocksTL.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(101,1,100,100);
			tempBlock.transform.colorTransform = color;
			blocksTL.push(tempBlock);
			addChild( tempBlock );

			//Top Right
			blocksTR = new Array;

			tempBlock = new Block(301,1,100,100);
			color.tintColor = 0x00FF00;	
			color.tintMultiplier = 0.5;
			tempBlock.transform.colorTransform = color;
			blocksTR.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(301,101,100,100);
			tempBlock.transform.colorTransform = color;
			blocksTR.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(201,101,100,100);
			tempBlock.transform.colorTransform = color;
			blocksTR.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(201,1,100,100);
			tempBlock.transform.colorTransform = color;
			blocksTR.push(tempBlock);
			addChild( tempBlock );

			//Bottom Left
			blocksBL = new Array;

			tempBlock = new Block(1,201,100,100);
			color.tintColor = 0x0000FF;	
			color.tintMultiplier = 0.5;
			tempBlock.transform.colorTransform = color;
			blocksBL.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(101,201,100,100);
			tempBlock.transform.colorTransform = color;
			blocksBL.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(1,301,100,100);
			tempBlock.transform.colorTransform = color;
			blocksBL.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(101,301,100,100);
			tempBlock.transform.colorTransform = color;
			blocksBL.push(tempBlock);
			addChild( tempBlock );


			//Bottom Right
			blocksBR = new Array;

			tempBlock = new Block(201,201,100,100);
			color.tintColor = 0xFFFFFF;	
			color.tintMultiplier = 0.5;
			tempBlock.transform.colorTransform = color;
			blocksBR.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(301,201,100,100);
			tempBlock.transform.colorTransform = color;
			blocksBR.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(201,301,100,100);
			tempBlock.transform.colorTransform = color;
			blocksBR.push(tempBlock);
			addChild( tempBlock );

			tempBlock = new Block(301,301,100,100);
			tempBlock.transform.colorTransform = color;
			blocksBR.push(tempBlock);
			addChild( tempBlock );

			//Overlay
			blocks = new Array;
			var tempBlock:Block = new Block(2,2,200,200);
			blocks.push( tempBlock );
			addChild( tempBlock );

			var tempBlock:Block = new Block(200,2,200,200);
			blocks.push( tempBlock );
			addChild( tempBlock );

			var tempBlock:Block = new Block(2,200,200,200);
			blocks.push( tempBlock );
			addChild( tempBlock );

			var tempBlock:Block = new Block(200,200,200,200);
			blocks.push( tempBlock );
			addChild( tempBlock );

			addChild( cursor );
			addChild( textRuns );
		}

		public function tick( timerEvent:TimerEvent ):void
		{

			var runs:int = 0;

			cursor.x =  parent.mouseX;
   			cursor.y = parent.mouseY;

			for(var i:int = 0; i < blocks.length; i++)
			{
				runs++;
				if( cursor.hitTestObject( blocks[i] ) )
				{
					switch(i)
					{
						case 0: blocksTLbool = true; break;
						case 1: blocksTRbool = true; break;
						case 2: blocksBLbool = true; break;
						case 3: blocksBRbool = true; break;
					}
					blocks[i].visible = false;
				}
				else
				{
					switch(i)
					{
						case 0: blocksTLbool = false; break;
						case 1: blocksTRbool = false; break;
						case 2: blocksBLbool = false; break;
						case 3: blocksBRbool = false; break;
					}
					blocks[i].visible = true;
				}
			}

			if( blocksTLbool == true )
			{
				
				for(var i:int = 0; i < blocksTL.length; i++)
				{
					runs++;
					if( cursor.hitTestObject( blocksTL[i] ) )
					{
						blocksTL[i].visible = false;
					}
					else
					{
						blocksTL[i].visible = true;
					}
				}
			}

			if( blocksTRbool == true )
			{
				
				for(var i:int = 0; i < blocksTR.length; i++)
				{
					runs++;
					if( cursor.hitTestObject( blocksTR[i] ) )
					{
						blocksTR[i].visible = false;
					}
					else
					{
						blocksTR[i].visible = true;
					}
				}
			}

			if( blocksBLbool == true )
			{
				
				for(var i:int = 0; i < blocksBL.length; i++)
				{
					runs++;
					if( cursor.hitTestObject( blocksBL[i] ) )
					{
						blocksBL[i].visible = false;
					}
					else
					{
						blocksBL[i].visible = true;
					}
				}
			}

			if( blocksBRbool == true )
			{
				
				for(var i:int = 0; i < blocksBR.length; i++)
				{
					runs++;
					if( cursor.hitTestObject( blocksBR[i] ) )
					{
						blocksBR[i].visible = false;
					}
					else
					{
						blocksBR[i].visible = true;
					}
				}
			}

			trace("Total amount of checks is:" + runs);
			textRuns.Runs_txt.text = runs.toString();

		}
 
	}
}