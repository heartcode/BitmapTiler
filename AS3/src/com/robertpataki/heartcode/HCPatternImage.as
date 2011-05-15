/*
	Copyright (c) 2010 - 2011 Robert Pataki
	Email:		heartcode@robertpataki.com
	Web:		http://heartcode.robertpataki.com && http://www.robertpataki.com

	See the documentation for more details and examples.

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in
	all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
	THE SOFTWARE.
 * */
package com.robertpataki.heartcode
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	
	/**
	 * Loads a bitmap from the library and generates a 'pattern' image from it.
	 * <p>
		* <strong>Compatible players:</strong>
		* <ul>
		* 	<li>Adobe Flash Player 9 or higher</li>
		*	<li>Adobe AIR Player 1.1 or higher</li>
		* </ul>
	 * </p>
	 * 
	 * @example <strong>Example 1:</strong> If the constructor is called without parameters or the linkage id cannot be found it creates an image from an auto-generated pattern.
	 * 
	 * <listing version="3.0">
	 * 
	 * <code>
	 * import com.robertpataki.heartcode.HCPatternImage;
	 * 
	 * var pi_sp:HCPatternImage = new HCPatternImage();
	 * pi_sp.name = "pi_sp";
	 * addChild(pi_sp);
	 * pi_sp.x = stage.stageWidth/2 - pi_sp.width/2;
	 * pi_sp.y = stage.stageHeight/2 - pi_sp.height/2;
	 * 
	 * </code>
	 * 
	 * </listing>
	 * <p><img src="../../../images/hc/hcpatternimage_01.png" width="200" height="200" alt="hcpatternimage_01.png" /></p>
	 * 
	 * @example 
	 * <strong>Example 2:</strong> With this image in the library...
	 * <p><img src="../../../images/hc/hcpatternimage_02_1.png" width="39" height="45" alt="hcpatternimage_02_1.png" /></p>
	 * 
	 * <p><strong>...and this code...</strong></p>
	 * <listing version="3.0">
	 * 
	 * <code>
	 * import com.robertpataki.heartcode.HCPatternImage;
	 * 
	 * var pi_sp:HCPatternImage = new HCPatternImage("hcpattern_img", 280, 80);
	 * pi_sp.name = "pi_sp";
	 * addChild(pi_sp);
	 * pi_sp.x = stage.stageWidth/2 - pi_sp.width/2;
	 * pi_sp.y = stage.stageHeight/2 - pi_sp.height/2;
	 * </code>
	 * 
	 * </listing>
	 * 
	 * <p><strong>...you can create this image:</strong></p>
	 * <p><img src="../../../images/hc/hcpatternimage_02_2.png" width="362" height="162" alt="hcpatternimage_02_2.png" /></p>
	 * 
	 * @author Robert Pataki, heartcode@robertpataki.com
	 */
	public class HCPatternImage extends Sprite
	{
		public static const DEFAULT_LINKAGEID:String	= "noID";
		public static const DEFAULT_WIDTH:uint			= 200;
		public static const DEFAULT_HEIGHT:uint			= 200;
		
		private var ImagePattern:Class;
		private var imageWidth:uint;
		private var imageHeight:uint;
		
		/**
		 * Constructor. Generates a new image.
		 * 
		 * @param	linkageID The linkage id of the pattern image placed in the library. The default value is <code>DEFAULT_LINKAGEID</code>
		 * @param	width The width of the generated image. The default value is <code>DEFAULT_WIDTH</code>
		 * @param	height The height of the generated image. The default value is <code>DEFAULT_HEIGHT</code>
		 */
		public function HCPatternImage(linkageID:String=DEFAULT_LINKAGEID, width:uint=DEFAULT_WIDTH, height:uint=DEFAULT_HEIGHT)
		{
			imageWidth = width;
			imageHeight = height;
			try {
				ImagePattern = getDefinitionByName(linkageID) as Class;
			}
			catch (error:Error)
			{
				ImagePattern = null;
			}
			draw();
		};
		
		/**
		 * The actual image generator function.
		 */
		private function draw():void
		{
			var pattern_bmp:Bitmap;
			
			if (ImagePattern)
			{
				pattern_bmp = new Bitmap(new ImagePattern(0, 0));
			}
			else
			{
				var pattern_bd:BitmapData = new BitmapData(10, 10, false, 0x00ff0000);
				pattern_bd.fillRect(new Rectangle(4, 4, 2, 2), 0x00000000);
				
				pattern_bmp = new Bitmap(pattern_bd);
				
				trace("\n\tMessage from HCPatternImage :\n\t | Some of the parameters are missing or the linkage id is wrong!\n\t | An auto-generated pattern has been created.\n\t | See the documentation for more details and examples.\n\tEnd of line.");
			}
			
			var pw:uint = pattern_bmp.width;
			var ph:uint = pattern_bmp.height;
			var cols:uint = Math.ceil(imageWidth / pw);
			var rows:uint = Math.ceil(imageHeight / ph);
			
			var patternImage_bd:BitmapData = new BitmapData(imageWidth, imageHeight, false, 0xff000000);
			
			var i:uint = 0;
			for (; i < cols; i++ )
			{
				var j:uint = 0;
				for (; j<rows; j++ )
				{
					patternImage_bd.copyPixels(pattern_bmp.bitmapData, new Rectangle(0, 0, pw, ph), new Point(i * pw, j * ph));
				}
			}
			var patternImage_bmp:Bitmap = new Bitmap(patternImage_bd);
			addChild(patternImage_bmp);
		};
	};
	
};