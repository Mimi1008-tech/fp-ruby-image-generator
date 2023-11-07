# ColorManagerクラス
# 色の管理を行う

class ColorManager
    
    # 色の構造体
    ColorStruct = Struct.new(:r, :g, :b)
    
    # コンストラクタ
    def initialize
        @Color = ColorStruct.new(255, 255, 255)
        return @Color
    end

    # @Colorを登録
    def set(*args)

        # RGBで指定された場合
        if args.size == 3 then
            @Color.r = args[0]
            @Color.g = args[1]
            @Color.b = args[2]

        # カラーコード（HEX）で指定された場合
        elsif args.size == 1 && args[0].match(/^#([\da-fA-F]{3}|[\da-fA-F]{6})$/) then
            @Color.r = args[0][1..2].hex
            @Color.g = args[0][3..4].hex
            @Color.b = args[0][5..6].hex

        # その他の場合
        else
            @Color.r = 255
            @Color.g = 255
            @Color.b = 255
        end

    end

    # @Colorを取得
    def get
        return @Color
    end

    # 配列orカラーコード（HEX）からColor Structerを取得
    def getColor(*args)
        self.set(*args)
        return self.get
    end
end