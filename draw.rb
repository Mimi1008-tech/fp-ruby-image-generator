# Imageクラスを読み込み
require_relative "./image.rb"

# 画像サイスを設定
WIDTH = 500
HEIGHT = 200

# インスタンスを作成
# フィールド
image = Image.new(WIDTH, HEIGHT)

# カラーマネージャー
color = ColorManager.new()

# 画像病が
image.pset(100, 80, color.getColor("#ff0000"))

# 書き出し
image.write
