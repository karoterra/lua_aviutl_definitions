---@meta

---@alias aspect_number number 縦横比を表す<br>[-1,1]を取り、正値は幅が高さより短く、負は高さが幅より短く、(1-絶対値)は短辺の長辺からの割合
---@alias bool_int `0`|`1`

---@alias blend_mode
---|`0` # 通常
---|`1` # 加算
---|`2` # 減算
---|`3` # 乗算
---|`4` # スクリーン
---|`5` # オーバーレイ
---|`6` # 比較(明)
---|`7` # 比較(暗)
---|`8` # 輝度
---|`9` # 色差
---|`10` # 陰影
---|`11` # 明暗
---|`12` # 差分
---|'"alpha_add"' # 色情報は加重平均、アルファ値は加算
---|'"alpha_max"' # 色情報は加重平均、アルファ値は最大値
---|'"alpha_sub"' # 色情報は無視、アルファ値は減算
---|'"alpha_add2"' # 色情報は重ね合わせ、アルファ値は加算

---@alias track_mode
---|`0`  # 無し
---|`1`  # 直線
---|`2`  # 曲線
---|`3`  # 瞬間
---|`4`  # 中間点
---|`5`  # 移動量
---|`6`  # ランダム
---|`7`  # 加減速
---|`8`  # 反復
---|`15` # その他(スクリプト)

---@alias option_drawtarget
---|'"dst"'
---|'"drawtarget"'

---@alias drawtarget_tmp
---|'"tempbuffer"'
---|'"tmp"'

---@alias drawtarget_frm
---|'"framebuffer"'
---|'"frm"'

---@alias camera_mode
---|`0` # 対象外
---|`1` # 不明(対象)
---|`2` # 対象(シャドー無効)
---|`3` # 対象(シャドー有効、シャドーの描画)
---|`4` # 対象(シャドー有効、本体の描画)


---@class camera_param
---@field x number  # 座標(X)
---@field y number  # 座標(Y)
---@field z number  # 座標(Z)
---@field tx number # 目標座標(X)
---@field ty number # 目標座標(Y)
---@field tz number # 目標座標(Z)
---@field rz number # 傾き
---@field ux number # 上方向単位ベクトル(X)
---@field uy number # 上方向単位ベクトル(Y)
---@field uz number # 上方向単位ベクトル(Z)
---@field d number  # カメラからスクリーンまでの距離(焦点距離)
local camera_param={}


---@class obj
---@field x number  # 基準座標(X)
---@field y number  # 基準座標(Y)
---@field z number  # 基準座標(Z)
---@field ox number # 相対座標(X)
---@field oy number # 相対座標(Y)
---@field oz number # 相対座標(Z)
---@field rx number # 回転(X軸)
---@field ry number # 回転(Y軸)
---@field rz number # 回転(Z軸)
---@field cx number # 中心座標(X)
---@field cy number # 中心座標(Y)
---@field cz number # 中心座標(Z)
---@field zoom number  # 拡大率(等倍は1)
---@field alpha number # 不透明度(最大値は1)
---@field aspect aspect_number # 縦横比
---@field w number # 幅 (フレームバッファでの見かけの大きさ)
---@field h number # 高さ (フレームバッファでの見かけの大きさ)
---@field screen_w integer # フレームバッファの幅
---@field screen_h integer # フレームバッファの高さ
---@field framerate number # フレームレート
---@field frame number # 現在フレーム
---@field time number  # 現在時間
---@field totalframe number # オブジェクトの長さ[フレーム]
---@field totaltime number  # オブジェクトの長さ[秒]
---@field layer integer # オブジェクトのあるレイヤー番号
---@field index integer # 個別オブジェクトの番号 (0-indexed)
---@field num integer   # 個別オブジェクトの個数
---@field track0 number # 1番目のトラックバーの値
---@field track1 number # 2番目のトラックバーの値
---@field track2 number # 3番目のトラックバーの値
---@field track3 number # 4番目のトラックバーの値
---@field check0 boolean # チェックボックスの値
obj={}


---テキストオブジェクト中で、テキストバッファに文字列を追加する
---@param str string
function obj.mes(str)end


---オブジェクトへ、スクリプト以降のフィルタを適用する
function obj.effect()end

---オブジェクトへフィルタを適用する
---@param name string # フィルタ効果の名前
---@param ... any # パラメータの名前,値の組を任意の数続ける
function obj.effect(name,...)end


---オブジェクトを描画する
function obj.draw()end

---オブジェクトを描画する
---@param x number     # X座標
function obj.draw(x)end

---オブジェクトを描画する
---@param x number     # X座標
---@param y number     # Y座標
function obj.draw(x,y)end

---オブジェクトを描画する
---@param x number     # X座標
---@param y number     # Y座標
---@param z number     # Z座標
function obj.draw(x,y,z)end

---オブジェクトを描画する
---@param x number     # X座標
---@param y number     # Y座標
---@param z number     # Z座標
---@param zoom number  # 拡大率
function obj.draw(x,y,z,zoom)end

---オブジェクトを描画する
---@param x number     # X座標
---@param y number     # Y座標
---@param z number     # Z座標
---@param zoom number  # 拡大率
---@param alpha number # 不透明度
function obj.draw(x,y,z,zoom,alpha)end

---オブジェクトを描画する
---@param x number     # X座標
---@param y number     # Y座標
---@param z number     # Z座標
---@param zoom number  # 拡大率
---@param alpha number # 不透明度
---@param rx number    # X軸回転
function obj.draw(x,y,z,zoom,alpha,rx)end

---オブジェクトを描画する
---@param x number     # X座標
---@param y number     # Y座標
---@param z number     # Z座標
---@param zoom number  # 拡大率
---@param alpha number # 不透明度
---@param rx number    # X軸回転
---@param ry number    # Y軸回転
function obj.draw(x,y,z,zoom,alpha,rx,ry)end

---オブジェクトを描画する
---@param x number     # X座標
---@param y number     # Y座標
---@param z number     # Z座標
---@param zoom number  # 拡大率
---@param alpha number # 不透明度
---@param rx number    # X軸回転
---@param ry number    # Y軸回転
---@param rz number    # Z軸回転
function obj.draw(x,y,z,zoom,alpha,rx,ry,rz)end


---`(x0,y0,z0),(x1,y1,z1),(x2,y2,z2),(x3,y3,z3)`の4点を結ぶ4角形を描画する
---時計回りになる面が表面
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param x3 number
---@param y3 number
---@param z3 number
function obj.drawpoly(x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3)end

---`(x0,y0,z0),(x1,y1,z1),(x2,y2,z2),(x3,y3,z3)`の4点を結ぶ4角形を描画する
---時計回りになる面が表面
---
---`(u0,v0),(u1,v1),(u2,v2),(u3,v3)`はUV座標で、左上が`(0,0)`、右下が`obj.getpixel()`
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param x3 number
---@param y3 number
---@param z3 number
---@param u0 number
---@param v0 number
---@param u1 number
---@param v1 number
---@param u2 number
---@param v2 number
---@param u3 number
function obj.drawpoly(x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,u0,v0,u1,v1,u2,v2,u3,v3)end

---`(x0,y0,z0),(x1,y1,z1),(x2,y2,z2),(x3,y3,z3)`の4点を結ぶ4角形を描画する
---時計回りになる面が表面
---
---`(u0,v0),(u1,v1),(u2,v2),(u3,v3)`はUV座標で、左上が`(0,0)`、右下が`obj.getpixel()`
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param x3 number
---@param y3 number
---@param z3 number
---@param u0 number
---@param v0 number
---@param u1 number
---@param v1 number
---@param u2 number
---@param v2 number
---@param u3 number
---@param alpha number # 不透明度
function obj.drawpoly(x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,u0,v0,u1,v1,u2,v2,u3,v3,alpha)end


---@alias load_option
---| '"movie"' # 動画ファイル(入力プラグインが解釈)
---| '"image"' # 画像ファイル(GDI+/Susieプラグインが解釈)
---| '"text"' # テキスト
---| '"figure"' # 図形
---| '"framebuffer"' # フレームバッファ
---| '"tempbuffer"' # 仮想バッファ
---| '"layer"' # レイヤー
---| '"before"' # 直前オブジェクト

---入力プラグインにファイルを読み込ませて、内容をオブジェクトの画像データへデコードする
---@param type "movie"
---@param file string # ファイルへのパス
---@param time number # 読み込む時間[秒]
---@param flag bool_int # アルファ情報を読み込むか
---@return number # 動画の長さ[秒]
---@return number # 動画の長さ[フレーム]
function obj.load(type,file,time,flag)end

---GDI+/Susieプラグインにファイルを読み込ませて、内容をオブジェクトの画像データへデコードする
---@param type "image"
---@param file string # ファイルへのパス
function obj.load(type,file)end

---テキストをオブジェクトの画像データへレンダリングする
---データは中央揃え[中]になる
---テキストには制御文字を含めることができる
---フォントなどは`obj.setfont`で指定する
---@param type "text"
---@param text string # 表示する内容
---@see obj.setfont
function obj.load(type,text)end

---テキストをオブジェクトの画像データへレンダリングする
---データは中央揃え[中]になる
---テキストには制御文字を含めることができる
---フォントなどは`obj.setfont`で指定する
---@param type "text"
---@param text string # 表示する内容
---@param speed number # 毎秒何文字表示するか
---@param time number # 何秒時点のものを表示するか
---@see obj.setfont
function obj.load(type,text,speed,time)end

---@alias figure_name
---|'"背景"'
---|'"円"'
---|'"四角形"'
---|'"三角形"'
---|'"五角形"'
---|'"六角形"'
---|'"星型"'

---@param type "figure"
---@param name figure_name
---@param color integer # 図形の色
---@param size integer # サイズ
---@param line integer # ライン幅
---@param aspect aspect_number # 縦横比
function obj.load(type,name,color,size,line,aspect)end

---フレームバッファ・仮想バッファを読み込む
---@param type "framebuffer"|"tempbuffer"
function obj.load(type)end

---`(x,y)`から`(x+w,y+h)`までの矩形範囲のフレームバッファ・仮想バッファを読み込む
---@param type "framebuffer"|"tempbuffer"
---@param x integer
---@param y integer
---@param w integer
---@param h integer
function obj.load(type,x,y,w,h)end

---指定した番号のレイヤーのオブジェクトを読み込む
---@param type "layer"
---@param no integer # レイヤー番号
---@param effect? boolean # エフェクトを適用するか
function obj.load(type,no,effect)end

---カスタムオブジェクト中でのみ有効<br>
---直前オブジェクトを読み込む
---@param type "before"
function obj.load(type)end

---@param value string 内容に応じて種類は自動判定
---@param ... any
function obj.load(value,...)end


---@alias setfont_type
---|0 # 標準
---|1 # 影付き
---|2 # 影付き(薄)
---|3 # 縁取り
---|4 # 縁取り(細)

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
function obj.setfont(name,size)end

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
---@param type setfont_type # 書式
function obj.setfont(name,size,type)end

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
---@param type setfont_type # 書式
---@param col1 integer # 文字色
function obj.setfont(name,size,type,col1)end

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
---@param type setfont_type # 書式
---@param col1 integer # 文字色
---@param col2 integer # 影/縁色
function obj.setfont(name,size,type,col1,col2)end


---同じパラメータを渡せば同じ結果が返る乱数関数
---seed = 0
---frame = obj.frame
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@return number
---@nodiscard
function obj.rand(st_num,ed_num,seed,frame)end

---同じパラメータを渡せば同じ結果が返る乱数関数
---frame = obj.frame
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@param seed integer # シード値
---@return number
---@nodiscard
function obj.rand(st_num,ed_num,seed,frame)end

---同じパラメータを渡せば同じ結果が返る乱数関数
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@param seed integer # シード値
---@param frame integer # シード値2
---@return number
---@nodiscard
function obj.rand(st_num,ed_num,seed,frame)end


---裏面を表示しない
---@param name "culling"
---@param value bool_int # 0: 表示, 1: 非表示
function obj.setoption(name,value)end

---カメラの方向を向く
---@param name "billboard"
---@param value `0`|`1`|`2`|`3` # 0: 向く, 1: 横方向のみ 2: 縦方向のみ 3: 向く
function obj.setoption(name,value)end

---シャドーの対象
---@param name "shadow"
---@param value bool_int # 0: 非対象, 1: 対象
function obj.setoption(name,value)end

---アンチエイリアス
---@param name "antialias"
---@param value bool_int # 0: しない, 1: する
function obj.setoption(name,value)end

---合成モード
---@param name "blend"
---@param value blend_mode
---@param ... "force"
function obj.setoption(name,value,...)end

---描画先の変更
---@param name option_drawtarget
---@param value drawtarget_frm|drawtarget_tmp
function obj.setoption(name,value)end

---描画先の変更
---仮想バッファの0初期化も行う
---@param name option_drawtarget
---@param value drawtarget_tmp
---@param w integer
---@param h integer
function obj.setoption(name,value,w,h)end

---スクリプト内でフレームバッファに描画されたかのステータスを変更
---@param name "draw_state"
---@param flag boolean
function obj.setoption(name,flag)end

---オブジェクトのフォーカス枠モード
---@param name "focus_mode"
---@param value "fixed_size"
function obj.setoption(name,value)end

---カメラのパラメータを設定する
---@param name "camera_param"
---@param cam camera_param
function obj.setoption(name,cam)end

---@alias getoption_name
---|'"track_mode"' #トラックバーの移動モード
---|'"section_num"' #区間の数
---|'"script_name"' #スクリプト名
---|'"gui"' #オブジェクト設定GUIが表示されているかをbooleanで返す
---|'"camera_mode"' #カメラ制御の対象か(カメラマークが付いているか)
---|'"camera_param"' #カメラの設定
---|'"multi_object"' #個別オブジェクトが有効かどうかをbooleanで返す

---トラックバーの移動モード
---@param name "track_mode"
---@param value integer トラックバーの番号
---@return track_mode
---@nodiscard
function obj.getoption(name,value)end

---区間の数
---@param name "section_num"
---@return integer # 区間の数 (中間点の数 + 1)
---@nodiscard
function obj.getoption(name)end

---スクリプト名を取得する
---@param name "script_name"
---@return string # スクリプト名(対象がスクリプト以外なら空のテキスト)
---@nodiscard
function obj.getoption(name)end

---スクリプト名を取得する
---@param name "script_name"
---@param value integer # フィルタ効果の上下の相対位置 (0は自身、負は上、正は下)
---@param skip? boolean # 無効になっているフィルタ効果をスキップするか
---@return string # スクリプト名(対象がスクリプト以外なら空のテキスト)
---@nodiscard
function obj.getoption(name,value,skip)end

---オブジェクト設定GUIが表示されているか
---@param name "gui"
---@return boolean
---@nodiscard
function obj.getoption(name)end

---カメラ制御の対象か
---@param name "camera_mode"
---@return camera_mode
---@nodiscard
function obj.getoption(name)end

---カメラの設定
---@param name "camera_param"
---@return camera_param
---@nodiscard
function obj.getoption(name)end

---個別オブジェクトが有効かどうか
---@param name "multi_object"
---@return boolean
---@nodiscard
function obj.getoption(name)end


---@alias getvalue_target
---|integer # 自身のスクリプトファイルのトラックバー
---|'"x"'  # 基準座標(X)
---|'"y"'  # 基準座標(Y)
---|'"z"'  # 基準座標(Z)
---|'"rx"' # 回転(X軸)
---|'"ry"' # 回転(Y軸)
---|'"rz"' # 回転(Z軸)
---|'"zoom"'   # 拡大率(等倍は*100*)
---|'"alpha"'  # 不透明度
---|'"aspect"' # 縦横比
---|'"time"'   # オブジェクト基準の時間
---|'scenechange' # シーンチェンジの進行度 (`[0,1]`)
---|string # "layer{番号}.{種類}

---標準/拡張描画等の設定を取得する
---time = obj.time
---section = 0
---@param target getvalue_target
---@return number
---@nodiscard
function obj.getvalue(target)end

---標準/拡張描画等の設定を取得する
---section = 0
---@param target getvalue_target
---@param time number # 基準時間
---@return number
---@nodiscard
function obj.getvalue(target,time)end

---標準/拡張描画等の設定を取得する
---@param target getvalue_target
---@param time number # 基準時間
---@param section integer # 基準区間
---@return number
---@nodiscard
function obj.getvalue(target,time,section)end


---@alias setanchor_name
---|string
---|'"track"' # トラックバーを上から使う

---@alias setanchor_options
---|'"line"'
---|'"loop"'
---|'"star"'
---|'"arm"'
---|'"color"'
---|'"inout"'
---|'"xyz"'

---アンカーポイントを設定する
---@param name setanchor_name # 参照するグローバル変数の名前
---@param num integer # アンカーポイントの数
---@param ... setanchor_options # オプションを列挙する
---@return integer # アンカーポイントの数
---@nodiscard
function obj.setanchor(name,num,...)end


---音声データを取得する
---@param buf table # 音声データ
---@param file string|"audiobuffer"
---@param type "pcm"|"spectrum"|"fourier"
---@param size integer
---@return integer # 要素数
---@return integer # サンプリングレート
---@nodiscard
function obj.getaudio(buf,file,type,size)end

---音声データを取得する
---@param buf nil
---@param file string|"audiobuffer"
---@param type "pcm"|"spectrum"|"fourier"
---@param size integer
---@return integer # 要素数
---@return integer # サンプリングレート
---@return table buf # 音声データ
---@nodiscard
function obj.getaudio(buf,file,type,size)end


---フレームバッファへとフィルタを実行する
---@param name string # フィルタの名前
---@param ... any # パラメータの名前,値の組を任意の数続ける
function obj.filter(name,...)end


---@alias buffer_cache_name string
---@alias buffer_image_name string

---@param dst "obj"|"tmp"|buffer_cache_name
---@param src "obj"|"tmp"|"frm"|buffer_cache_name|buffer_image_name
---@return boolean # 成功したか
---@nodiscard
function obj.copybuffer(dst,src)end

---画像データのサイズを返す
---@return integer w
---@return integer h
---@nodiscard
function obj.getpixel()end

---画像データの要素を返す(RGB/A形式)
---@param x integer # ピクセルの座標(X)
---@param y integer # ピクセルの座標(Y)
---@param type "col"
---@return integer col
---@return number alpha
---@nodiscard
function obj.getpixel(x,y,type)end

---画像データの要素を返す(RGBA形式)
---@param x integer # ピクセルの座標(X)
---@param y integer # ピクセルの座標(Y)
---@param type "rgb"
---@return integer r
---@return integer g
---@return integer b
---@return integer a
---@nodiscard
function obj.getpixel(x,y,type)end

---画像データの要素を返す(YCbCrA形式)
---@param x integer # ピクセルの座標(X)
---@param y integer # ピクセルの座標(Y)
---@param type "yc"
---@return integer y
---@return integer cb
---@return integer cr
---@return integer a
---@nodiscard
function obj.getpixel(x,y,type)end

---画像データの要素を返す
---`type`は`obj.pixeloption`で設定したもの(デフォルトは`"col"`)になる
---@param x integer # ピクセルの座標(X)
---@param y integer # ピクセルの座標(Y)
---@return integer
---@return integer|number
---@return integer|nil
---@return integer|nil
---@see obj.pixeloption
---@nodiscard
function obj.getpixel(x,y)end


---画像データの要素を設定する
---引数に渡すデータの種類は`obj.pixeloption`で設定したものになる
---@see obj.pixeloption
---@param x integer # ピクセルの座標(X)
---@param y integer # ピクセルの座標(Y)
---@param col integer
---@param alpha number
function obj.putpixel(x,y,col,alpha)end

---画像データの要素を設定する
---引数に渡すデータの種類は`obj.pixeloption`で設定したものになる
---@see obj.pixeloption
---@param x integer # ピクセルの座標(X)
---@param y integer # ピクセルの座標(Y)
---@param e1 integer
---@param e2 integer
---@param e3 integer
---@param a integer
function obj.putpixel(x,y,e1,e2,e3,a)end


---ピクセル情報をコピーする
---@param dst_x integer コピー先の座標(X)
---@param dst_y integer コピー先の座標(Y)
---@param src_x integer コピー元の座標(X)
---@param src_y integer コピー元の座標(Y)
function obj.copypixel(dst_x,dst_y,src_x,src_y)end


---`obj.getpixel`,`obj.putpixel`で受け渡すピクセル情報の種類を設定する
---@param name "type"
---@param value "col"|"rgb"|"yc"
function obj.pixeloption(name,value)end

---ピクセル情報の読み出し元を設定する
---@param name "get"
---@param value "obj"|"frm"
function obj.pixeloption(name,value)end

---ピクセル情報の書き込み先を設定する
---@param name "put"
---@param value "obj"|"frm"
function obj.pixeloption(name,value)end

---書き込むときの合成モードを指定する
---@param name "blend"
---@param value blend_mode
function obj.pixeloption(name,value)end


---@alias getpixeldata_option
---| '"alloc"' # 新たな領域をフルユーザーデータとして確保する
---| '"work"' # 現在のオブジェクトの内容をコピー**しない**

---現在のオブジェクトの画像データをユーザーデータとして返す
---@param ... getpixeldata_option
---@return lightuserdata data # 画像データへのポインタ
---@return integer width # 幅
---@return integer height # 高さ
---@nodiscard
function obj.getpixeldata(...)end


---ユーザーデータから現在のオブジェクトの画像データを設定する
---@param data lightuserdata
function obj.putpixeldata(data)end


---トラックバー変化方法スクリプトでのみ有効<br>トラックバーの値を取得する
---@param target integer # 区間番号
---@return number
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>トラックバーの値を取得する
---@param target integer # 区間番号
---@param option integer # 関連トラックの相対位置
---@return number
---@nodiscard
function obj.getpoint(target,option)end

---トラックバー変化方法スクリプトでのみ有効<br>現在の区間を取得する
---@param target "index"
---@return number
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>始点・終点・中間点の総数を取得する
---@param target "num"
---@return integer
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>現在の時間を取得する
---@param target "time"
---@return number
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>ある区間の開始時間を取得する
---@param target "time"
---@param option integer
---@return number
---@nodiscard
function obj.getpoint(target,option)end

---トラックバー変化方法スクリプトでのみ有効<br>加速 チェックボックスの状態を取得する
---@param target "accelerate"
---@return boolean
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>減速 チェックボックスの状態を取得する
---@param target "decelerate"
---@return boolean
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>トラックバーの設定値(「移動フレーム間隔」)を取得する
---@param target "param"
---@return number
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>関連トラックの情報を取得する
---@param target "link"
---@return integer i # 関連トラックの序数
---@return integer n # 関連トラックの総数
---@nodiscard
function obj.getpoint(target)end


---スクリプトフォルダのパス(`{exedit.auf dir}/script/`)を取得する
---@param name "script_path"
---@return string
---@nodiscard
function obj.getinfo(name)end

---動画の出力中かを取得する
---@param name "saving"
---@return boolean
---@nodiscard
function obj.getinfo(name)end

---最大画像サイズを取得する
---@param name "image_max"
---@return integer w
---@return integer h
---@nodiscard
function obj.getinfo(name)end


---連続した4点`p0,p1,p2,p3`から時間`t`に応じた`p1,p2`間の座標を返す
---@param t number
---@param x0 number
---@param x1 number
---@param x2 number
---@param x3 number
---@return number x
---@nodiscard
function obj.interpolation(t,x0,x1,x2,x3)end

---連続した4点`p0,p1,p2,p3`から時間`t`に応じた`p1,p2`間の座標を返す
---@param t number
---@param x0 number
---@param y0 number
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@return number x
---@return number y
---@nodiscard
function obj.interpolation(t,x0,y0,x1,y1,x2,y2,x3,y3)end

---連続した4点`p0,p1,p2,p3`から時間`t`に応じた`p1,p2`間の座標を返す
---@param t number
---@param x0 number
---@param y0 number
---@param z0 number
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param x3 number
---@param y3 number
---@param z3 number
---@return number x
---@return number y
---@return number z
---@nodiscard
function obj.interpolation(t,x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3)end


---`(R,G,B)`を`0xRRGGBB`にする
---@param r integer
---@param g integer
---@param b integer
---@return integer col
---@nodiscard
function RGB(r,g,b)end

---`(R1,G1,B1),(R2,G2,B2)`を`obj.time`で線形補間した値を返す
---@param r1 integer
---@param g1 integer
---@param b1 integer
---@param r2 integer
---@param g2 integer
---@param b2 integer
---@return integer col
---@nodiscard
function RGB(r1,g1,b1,r2,g2,b2)end

---`0xRRGGBB`を`(R,G,B)`にする
---@param col integer
---@return integer r
---@return integer g
---@return integer b
---@nodiscard
function RGB(col)end


---`(H,S,V)`を`0xRRGGBB`にする
---@param h integer
---@param s integer
---@param v integer
---@return integer col
---@nodiscard
function HSV(h,s,v)end

---`(H1,S1,V1),(H2,S2,V2)`を`obj.time`で線形補間した値を返す
---@param h1 integer
---@param s1 integer
---@param v1 integer
---@param h2 integer
---@param s2 integer
---@param v2 integer
---@return integer col
---@nodiscard
function HSV(h1,s1,v1,h2,s2,v2)end

---`0xRRGGBB`を`(H,S,V)`にする
---@param col integer
---@return integer h
---@return integer s
---@return integer v
---@nodiscard
function HSV(col)end


---bit OR 演算を行う
---@see bit.bor
---@param a integer
---@param b integer
---@return integer
---@nodiscard
function OR(a,b)end

---bit AND 演算を行う
---@see bit.bor
---@param a integer
---@param b integer
---@return integer
---@nodiscard
function AND(a,b)end

---bit XOR 演算を行う
---@see bit.bor
---@param a integer
---@param b integer
---@return integer
---@nodiscard
function XOR(a,b)end

---算術シフトを行う
---bが正数の場合は左シフト、さもなくば絶対値で右シフト
---@see bit.lshift
---@see bit.arshift
---@param a integer
---@param b integer
---@return integer
---@nodiscard
function SHIFT(a,b)end


---@alias setfont_type
---|0 # 標準
---|1 # 影付き
---|2 # 影付き(薄)
---|3 # 縁取り
---|4 # 縁取り(細)

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
function setfont(name,size)end

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
---@param type setfont_type # 書式
function setfont(name,size,type)end

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
---@param type setfont_type # 書式
---@param col1 integer # 文字色
function setfont(name,size,type,col1)end

---`obj.load("text")`で使うフォント(書式)を変更する
---@param name string # フォント名
---@param size integer # サイズ
---@param type setfont_type # 書式
---@param col1 integer # 文字色
---@param col2 integer # 影/縁色
function setfont(name,size,type,col1,col2)end


---同じパラメータを渡せば同じ結果が返る乱数関数
---seed = 0
---frame = obj.frame
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@return number
---@nodiscard
function rand(st_num,ed_num)end

---同じパラメータを渡せば同じ結果が返る乱数関数
---frame = obj.frame
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@param seed integer # シード値
---@return number
---@nodiscard
function rand(st_num,ed_num,seed)end

---同じパラメータを渡せば同じ結果が返る乱数関数
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@param seed integer # シード値
---@param frame integer # シード値2
---@return number
---@nodiscard
function rand(st_num,ed_num,seed,frame)end


---指定の内容をOutputDebugStringする
---@param text string
function debug_print(text)end

--[[
Copyright (C) 2024 ePi
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.
]]
