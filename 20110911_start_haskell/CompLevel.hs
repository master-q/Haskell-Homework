module CompLevel (compLevel) where

compLevel :: (Int, Int) -> Float -> Int -> Float -> Float -> Float
compLevel (w,h) frame sec audio filesize = total / (filesize * 1024 * 1024 * 8)
  where
    total = total_audio + total_video
    total_audio = audio * 1000 * secf
    total_video = wf * hf * 24 * frame * secf
    wf = fromIntegral w
    hf = fromIntegral h
    secf = fromIntegral sec

{--
動画のファイルの（近似）画像圧縮率を計算する関数`compLevel`を定義せよ。

   compLevel :: (Int, Int)  -- 幅（ピクセル）, 高さ（ピクセル）
             -> Float       -- フレームレート（フレーム／秒）
             -> Int         -- 時間（秒）
             -> Float       -- オーディオ・ビットレート（Kb／秒）
             -> Float       -- ファイルサイズ（MiB）
             -> Float       -- 画像圧縮率

この問題では、動画の画像圧縮率とは非圧縮ビデオのビットレート÷圧縮された
ビデオのビットレートとする。24ビット／ピクセルの色震度を仮定する。単位を
間違えないように注意を払う必要がある。ファイルサイズはメビバイト（MiB）
（1024×1024バイト）で数えるが、ビットレートの方はキロビット（1000ビット）／秒
で計算する。
--}
