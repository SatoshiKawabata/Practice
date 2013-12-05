package
{	
	import flash.display.MovieClip;	
	import flash.utils.ByteArray;
	import flash.system.System;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.events.MouseEvent;
	import flash.events.Event;
	
	dynamic public class CompressionClass extends MovieClip
	{	
		private var doDecompressOnly:Boolean = false;
		private var file:FileReference;
		
		public function CompressionClass()
		{	
			file = new FileReference();
			stage.addEventListener(MouseEvent.CLICK, wow);
			return;
		}
		
		
		private function select(e:Event) : void
		{	
			file.removeEventListener(Event.SELECT, select);
			file.load();
		}
		private function completed(e:Event) : void
		{	
			trace("asd"/*, file.data*/);
			file.removeEventListener(Event.COMPLETE, completed);
			var data:ByteArray = file.data;
			data.endian = "littleEndian";
			var version:uint = data.readUnsignedInt();
			trace (version&0xffffff, version, 0xffffff);
			trace(90|87<<8|83<<16);
			switch (version&0xffffff)
			{
				case 90|87<<8|83<<16:
					// SWZ = lzma compressed
					if (doDecompressOnly)
						System.exit(0);
					
					var udata:ByteArray = new ByteArray();
					udata.endian = "littleEndian";
					var ptr:int;
					// put lzma properties in 0-4
					for (ptr=0;ptr<5;ptr++)
					{
						udata[ptr]=data[12+ptr];
					}
					// calculate uncompressed length, subtract 8 (remove header bytes)
					var scriptlen:uint=data[4]+(data[5]<<8)+(data[6]<<16)+(data[7]<<24)-8;
					// write lzma properties bytes: 0-4
					for (ptr=0;ptr<4;ptr++)
					{
						udata[5+ptr]=data[8+ptr];
					}
					// write the uncompressed length: 5-8 
					udata[5]=scriptlen&0xFF;
					udata[6]=(scriptlen>>8) & 0xFF;
					udata[7]=(scriptlen>>16) & 0xFF;
					udata[8]=(scriptlen>>24) & 0xFF;
					// add 4 extra 0 to compressed length: 9-12
					for (ptr=0;ptr<4;ptr++)
					{	
						udata[9+ptr]=0;
					}
					data.position = 17;
					data.readBytes(udata,13,data.length-data.position);
					udata.position=0;
					udata.uncompress("lzma");
					file.save(udata);
					break;
				
				default:
					
					trace('errrrrrroooooooooooorrrrrrrrrrrrr');
					break;
			}
		}
		private function wow(e:MouseEvent) : void	
		{
			file.addEventListener(Event.SELECT, select);
			file.addEventListener(Event.COMPLETE, completed);
			file.browse();	
		}
	}	
}