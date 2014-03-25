# -*- coding: utf-8 -*-
# ファイルの終端３行を表示するプログラム(改良版)
#
# 実行例) ruby tail2.rb /var/log/messages
#

# ポイント1：Fileクラスのopenメソッドをブロック付きバージョンで使用し、closeメソッドを不要にする。
# ポイント2：再利用しない一時的な変数を省略しメモリを節約。
#            file.readで得られたStringクラスのオブジェクトを、Stringクラスのsplitメソッドで改行
#            ごとに分割しArrayクラスのオブジェクトに変換。
#            Arrayクラスの[始点, 要素数]指定で終端3要素から3個(つまり終端3要素だけ)を取得
#            終端3要素(Array)をeachでループさせ、表示させる。
#

case ARGV.size
when 1
  File.open(ARGV[0]) do |file| # ポイント1
    file.read.split("\n")[-3, 3].each do |line| # ポイント2
      puts line
    end
  end
else
  puts "ERROR: オプションが正しくありません。"
end
