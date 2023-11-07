# ColorManagerをインポート
# ピクセルの色を管理するのに使用する
require_relative "./color_manager.rb"

# Imageクラス
# フィールドを管理

class Image

    # コンストラクタ
    # デフォルトの画像サイズは512x512
    def initialize(width=512, height=512)

        # 画像サイズを設定
        @width = width
        @height = height

        # フィールドを初期化
        @img = Array.new(@height) do Array.new(@width) do ColorManager.new() end end

    end

    # 指定されたピクセルの色を設定
    def pset(x, y, color)

        # 指定された座標が範囲内にあることを確認
        if 0 <= x && x < @width && 0 <= y && y < @height
            @img[y][x].set(*color)
        end

    end

    # フィールドの内容をファイルに書き出し
    def write(name="image.ppm")

        # ファイルを書き込みモードで開く
        open(name, "wb") do |f|
            
            # ヘッダーを書き込む
            f.puts("P6\n#{@width} #{@height}\n255")

            # フィールドを書き込む
            @img.each do |i|
                i.each do |pixel| 
                    f.write(pixel.get.to_a.pack("ccc"))
                end
            end

        end

    end

end