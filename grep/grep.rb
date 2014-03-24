# -*- coding: utf-8 -*-
# ファイル中のERRORを含む行のみを表示する
#
# 実行例) ruby grep.rb /var/log/messages
#
if ARGV.size == 1
  filename = ARGV[0]
	file = File.open(filename)
	file.each_line do |x|
    # 'ERROR'が含まれる行を表示対象にする
    regexp = Regexp.new(/ERROR/)
    if regexp =~ x
      puts x
    end
  end
  file.close
end
