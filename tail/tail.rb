# -*- coding: utf-8 -*-
# ファイルの終端３行を表示するプログラム
#
# 実行例) ruby tail.rb /var/log/messages
#
if ARGV.size == 1
  filename = ARGV[0]
  # ファイルを開く
  file = File.open(filename)
  # いったんファイル内容をすべて読み出す
  payload = file.read
  # ファイル内容をLF(改行コード)文字で分割する(分割結果がArrayクラスのオブジェクトになる)
  splitted_payload = payload.split("\n")
  # ファイル行数＝Arrayの要素数、なので要素数を取得しておく。
  line_number = splitted_payload.count
  # ファイル内容(Array)を1行(1要素)ずつ取得
  i = 1
  splitted_payload.each do |x|
    if i > line_number - 3 # 行数 が ファイル行数-3 以降なら行を表示
      puts x
    end
    i = i + 1
  end
  # ファイルを閉じる
  file.close
end
