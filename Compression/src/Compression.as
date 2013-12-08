package
{
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.text.TextField;
	import flash.utils.ByteArray;
	import flash.utils.CompressionAlgorithm;
	
	import mx.core.ButtonAsset;
	
	public class Compression extends Sprite
	{
		private var _file:FileReference;
		
		private var _compessBtn:Sprite;
		private var _uncompessBtn:Sprite;
		private var _compressFlag:Boolean;
		
		private var _messageArea:TextField;
		
		public function Compression()
		{
			_file = new FileReference();
			
			// 圧縮ボタン
			_compessBtn = createBtn('圧縮する', onClickBtn);
			_compessBtn.x = 30;
			_compessBtn.y = 30;
			addChild(_compessBtn);
			// 解凍ボタン
			_uncompessBtn = createBtn('解凍する', onClickBtn);
			_uncompessBtn.x = _compessBtn.x + _compessBtn.width + 10;
			_uncompessBtn.y = _compessBtn.y;
			addChild(_uncompessBtn);
			
			// メッセージエリア
			_messageArea = new TextField();
			_messageArea.wordWrap = false;
			_messageArea.width = stage.stageWidth;
			_messageArea.text = 'ボタンを押してください';
			_messageArea.x = _compessBtn.x;
			_messageArea.y = _compessBtn.y + _compessBtn.height + 10;
			addChild(_messageArea);
		}
		
		protected function onClickBtn(event:MouseEvent):void
		{
			trace(event.target.name);
			if (event.target.name == '圧縮する')
			{
				_compressFlag = true;
			}
			else if (event.target.name == '解凍する')
			{
				_compressFlag = false;
			}
			_file.addEventListener(Event.SELECT, onSelectFile);
			_file.addEventListener(Event.COMPLETE, onCompleteFileLoad);
			_file.browse();
			_messageArea.text = event.target.name;
		}
		
		protected function onSelectFile(event:Event):void
		{
			_file.removeEventListener(Event.SELECT, onSelectFile);
			_file.load();
		}
		
		protected function onCompleteFileLoad(event:Event):void
		{
			_file.removeEventListener(Event.COMPLETE, onCompleteFileLoad);
			
			var data:ByteArray = new ByteArray();
			data.writeBytes(_file.data);
			if (_compressFlag)
			{
				data.compress(CompressionAlgorithm.LZMA);
				trace('圧縮する', CompressionAlgorithm.LZMA);
			}
			else if(!_compressFlag)
			{
				data.uncompress(CompressionAlgorithm.LZMA);
				trace('解凍する', CompressionAlgorithm.LZMA);
				
			}
			// 保存
			_file.save(data, 'panel.dat');
			_messageArea.text = 'lzma形式で保存しました' + CompressionAlgorithm.LZMA;
			
		}
		
		/**
		 * ボタン生成 
		 * @param label
		 * @param handler
		 * @return 
		 * 
		 */		
		private function createBtn(label:String, handler:Function):Sprite
		{
			// テキストを設定
			var tf:TextField = new TextField();
			tf.text = label;
			tf.textColor = 0xFFFFFF;
			tf.backgroundColor = 0xaaaaaa;
			tf.name = label;
			// 色を指定
			var btnElement:Sprite = new Sprite();
			btnElement.name = label;
			var g:Graphics = btnElement.graphics;
			g.beginFill(0x000000);
			g.drawRect(0, 0, tf.textWidth + 5, tf.textHeight + 5);
			g.endFill();
			// テキスト配置
			tf.x = (btnElement.width - tf.textWidth) / 2.0;
			tf.y = (btnElement.height - tf.textHeight) / 2.0;
			btnElement.addChild(tf);
			
			// クリックイベントを作成
			btnElement.addEventListener(MouseEvent.CLICK, handler);
			
			return btnElement;
		}
	}
}