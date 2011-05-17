# AS2/3 bitmap image tiler class

**BitmapTiler** is a simple utility class which generates a tiled image using a bitmap instance in the Flash Library.

**AS3 Compatible players:**

* Adobe Flash Player 9 or higher
* Adobe AIR Player 1.1 or higher

**AS2 Compatible players:**

* Adobe Flash Player 8 or higher
* Adobe FlashLite Player 3.1 or higher
* Adobe AIR Player 1.1 or higher

## Usage

**AS3:**

If the constructor is called without parameters or the linkage id cannot be found it creates an image from an auto-generated pattern:
	
	import com.robertpataki.heartcode.BitmapTiler;

	var pi_sp:BitmapTiler = new BitmapTiler();
	pi_sp.x = stage.stageWidth * 0.5 - pi_sp.width * 0.5;
	pi_sp.y = stage.stageHeight * 0.5 - pi_sp.height * 0.5;
	addChild(pi_sp);
	
	
The constructor can be also called by passing a bitmap linkage id and the dimensions of the tiled image:

	import com.robertpataki.heartcode.BitmapTiler;
	
	var pi_sp:BitmapTiler = new BitmapTiler("hcpattern_img", 280, 80);
	pi_sp.x = stage.stageWidth * 0.5 - pi_sp.width * 0.5;
	pi_sp.y = stage.stageHeight * 0.5 - pi_sp.height * 0.5;
	addChild(pi_sp);

**AS2:**
	
If the constructor is called without parameters or the linkage id cannot be found it creates an image from an auto-generated pattern and places the tiled image on the stage:
	
	import com.robertpataki.heartcode.BitmapTiler;

	new BitmapTiler();
	
	
If the constructor is called with the custom parameters, it places the generated image to the destination movieclip:
	
	import com.robertpataki.heartcode.BitmapTiler;
	
	new BitmapTiler(this, "patternImage_mc", "hcpattern_img", 280, 80);
	patternImage_mc._x = Stage.width * 0.5 - patternImage_mc._width * 0.5;
	patternImage_mc._y = Stage.height * 0.5 - patternImage_mc._height * 0.5;
	

**If you don't know where to start check out the HeartCode_QuickStartGuide_BitmapTiler.pdf file for some help.**
	

## Credits

BitmapTiler was created by Robert Pataki.

## License

**(The MIT License)**

Copyright (c) 2010-2011 Robert Pataki heartcode@robertpataki.com;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.