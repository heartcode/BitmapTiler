/*
 * HCPatternImage.as
 * Copyright © 2010 Robert Pataki, all rights reserved.
 * Email: heartcode@robertpataki.com
 * Web: http://heartcode.robertpataki.com
 * */

import flash.display.BitmapData;
import flash.geom.Point;
import flash.geom.Rectangle;
 
/**
 * Loads a bitmap from the library and generates a 'pattern' image from it.
 * <p>
	* <b>Compatible players:</b>
	* <ul>
	* 	<li>Adobe Flash Player 8 or higher</li>
	*	<li>Adobe FlashLite Player 3.1 or higher</li>
	*	<li>Adobe AIR Player 1.1 or higher</li>
	* </ul>
 * </p>
 * 
 * <h2>Examples</h2>
 * <p><strong>Example 1: </strong> If the constructor is called without parameters or the linkage id cannot be found it creates an image from an auto-generated pattern.
 * {@code import com.robertpataki.heartcode.HCPatternImage;
 * 
 * new HCPatternImage();
 * }
 * <p><img src="../../../images/hc/hcpatternimage_01.png" width="200" height="200" alt="hcpatternimage_01.png" /></p>
 * 
 * <br/>
 * 
 * <p><strong>Example 2: </strong> With this image in the library...
 * <p><img src="../../../images/hc/hcpatternimage_02_1.png" width="39" height="45" alt="hcpatternimage_02_1.png" /></p>
 * 
 * <p>...and this code...</p>
 * {@code import com.robertpataki.heartcode.HCPatternImage;
 * 
 * new HCPatternImage(this, "patternImage_mc", "hcpattern_img", 280, 80);
 * patternImage_mc._x = Stage.width / 2 - patternImage_mc._width/2;
 * patternImage_mc._y = Stage.height / 2 - patternImage_mc._height/2;
 * }
 * <p>...you can create this image:</p>
 * <p><img src="../../../images/hc/hcpatternimage_02_2.png" width="362" height="162" alt="hcpatternimage_02_2.png" /></p>
 *
 * @author Robert Pataki, heartcode@robertpataki.com
 */
class com.robertpataki.heartcode.HCPatternImage extends MovieClip
{
	private var _parent:MovieClip;
	private var _name:String;
	private var imagePattern:String;
	private var imageWidth:Number;
	private var imageHeight:Number;
	private var imageClip:MovieClip;
	
	private static var defaultParent:MovieClip		= _root;
	private static var defaultName:String			= "patternImage_mc";
	private static var defaultLinkageID:String		= "noID";
	private static var defaultWidth:Number			= 200;
	private static var defaultHeight:Number			= 200;
	
	/**
	 * Creates a new MovieClip instance and places the generated image in it.
	 * 
	 * @param	parent The parent MovieClip where the image will be placed. The default value is <code>_root</code>
	 * @param	name The name of the image. The default value is <code>"patternImage_mc"</code>
	 * @param	linkageID The linkage id of the pattern image placed in the library. The default value is <code>noID</code>
	 * @param	width The width of the generated image. The default value is <code>200</code>
	 * @param	height The height of the generated image. The default value is <code>200</code>
	*/
	public function HCPatternImage(parent:MovieClip, name:String, linkageID:String, width:Number, height:Number)
	{
		_parent = MovieClip(parent) != undefined ? MovieClip(parent) : defaultParent;
		_name = name != undefined && name != "" ? name : defaultName;
		imagePattern = linkageID != undefined && linkageID != "" ? linkageID : defaultLinkageID;
		imageWidth = width != undefined && width > 0 ? width : defaultWidth;
		imageHeight = height != undefined && height > 0 ? height : defaultHeight;
		
		imageClip = _parent.createEmptyMovieClip(_name, _parent.getNextHighestDepth());
		
		draw();
	};
	
	/**
	 * The actual image generator function.
	 */
	private function draw():Void
	{
		var pattern_bd:BitmapData;
		
		if (imagePattern != defaultLinkageID)
		{
			pattern_bd = BitmapData.loadBitmap(imagePattern);
		}
		else
		{
			pattern_bd = new BitmapData(10, 10, false, 0x00ff0000);
			pattern_bd.fillRect(new Rectangle(4, 4, 2, 2), 0x00000000);
		}
		
		var pw:Number = pattern_bd.width;
		var ph:Number = pattern_bd.height;
		var cols:Number = Math.ceil(imageWidth / pw);
		var rows:Number = Math.ceil(imageHeight / ph);
		
		var patternImage_bd:BitmapData = new BitmapData(imageWidth, imageHeight, false, 0xff000000);
		var i:Number = 0;
		for (; i < cols; i++ )
		{
			var j:Number = 0;
			for (; j<rows; j++ )
			{
				patternImage_bd.copyPixels(pattern_bd, new Rectangle(0, 0, pw, ph), new Point(i * pw, j * ph));
			}
		}
		
		imageClip.attachBitmap(patternImage_bd, imageClip.getNextHighestDepth());
		
		if (imagePattern == defaultLinkageID)
		{
			imageClip._x = Math.round(Stage.width / 2 - imageClip._width / 2);
			imageClip._y = Math.round(Stage.height / 2 - imageClip._height / 2);
			
			trace("\n\tMessage from HCPatternImage :\n\t | Some of the parameters are missing!\n\t | An auto-generated pattern has been added to the _root object.\n\t | See the documentation for more details and examples.\n\tEnd of line.");
		}
	};
};