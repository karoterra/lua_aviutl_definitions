---@meta

---@alias aspect_number number 縦横比を表す<br>[-1,1]を取り、正値は幅が高さより短く、負は高さが幅より短く、(1-絶対値)は短辺の長辺からの割合
---@alias bool_int `0`|`1`

---@alias blend_mode
---|'"none"' # 通常
---|'"add"' # 加算
---|'"sub"' # 減算
---|'"mul"' # 乗算
---|'"screen"' # スクリーン
---|'"overlay"' # オーバーレイ
---|'"light"' # 比較(明)
---|'"dark"' # 比較(暗)
---|'"brightness"' # 輝度
---|'"chroma"' # 色差
---|'"shadow"' # 陰影
---|'"light_dark"' # 明暗
---|'"diff"' # 差分
---|'"alpha_add"' # 色情報は加重平均、アルファ値は加算
---|'"alpha_max"' # 色情報は加重平均、アルファ値は最大値
---|'"alpha_sub"' # 色情報は無視、アルファ値は減算
---|'"alpha_add2"' # 色情報は重ね合わせ、アルファ値は加算
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
---@field sx number # 拡大率(X)
---@field sy number # 拡大率(Y)
---@field sz number # 拡大率(Z)
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
---@field id integer    # オブジェクトのID
---@field effect_id integer # オブジェクトの内の対象エフェクトのID
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

---複数分のobj.drawpoly()の引数をテーブルで指定することが出来ます。
---obj.drawpoly()を複数回呼び出すより描画が速くなります。
---テーブルの形式は下記が対応しています。
---
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,u0,v0,u1,v1,u2,v2,u3,v3}`
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,u0,v0,u1,v1,u2,v2,u3,v3,vx0,vy0,vz0,vx1,vy1,vz1,vx2,vy2,vz2,vx3,vy3,vz3}`
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,r0,g0,b0,a0,r1,g1,b1,a1,r2,g2,b2,a2,r3,g3,b3,a3}`
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,r0,g0,b0,a0,r1,g1,b1,a1,r2,g2,b2,a2,r3,g3,b3,a3,vx0,vy0,vz0,vx1,vy1,vz1,vx2,vy2,vz2,vx3,vy3,vz3}`
---
---※ `vx,vy,vz` は法線ベクトル
---※ `r,g,b,a` は描画色(0.0～1.0の乗算済みα) ※オブジェクトの画像は利用されません
---@param vertex number[][]
function obj.drawpoly(vertex)end

---複数分のobj.drawpoly()の引数をテーブルで指定することが出来ます。
---obj.drawpoly()を複数回呼び出すより描画が速くなります。
---テーブルの形式は下記が対応しています。 ※異なる形式を混在させる事はできません
---
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,u0,v0,u1,v1,u2,v2,u3,v3}`
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,u0,v0,u1,v1,u2,v2,u3,v3,vx0,vy0,vz0,vx1,vy1,vz1,vx2,vy2,vz2,vx3,vy3,vz3}`
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,r0,g0,b0,a0,r1,g1,b1,a1,r2,g2,b2,a2,r3,g3,b3,a3}`
---- `{x0,y0,z0,x1,y1,z1,x2,y2,z2,x3,y3,z3,r0,g0,b0,a0,r1,g1,b1,a1,r2,g2,b2,a2,r3,g3,b3,a3,vx0,vy0,vz0,vx1,vy1,vz1,vx2,vy2,vz2,vx3,vy3,vz3}`
---
---※ `vx,vy,vz` は法線ベクトル
---※ `r,g,b,a` は描画色(0.0～1.0の乗算済みα) ※色の指定時はオブジェクトの画像は利用されません
---@param vertex number[][]
---@param alpha number # 不透明度
function obj.drawpoly(vertex, alpha)end

---頂点リストのテーブルを指定して四角形、三角形を描画することが出来ます。
---テーブルの形式は下記が対応しています。※異なる形式を混在させる事はできません
---
---- `{x,y,z,u,v}`              : 頂点座標 + テクスチャ座標
---- `{x,y,z,u,v,vx,vy,vz}`     : 頂点座標 + テクスチャ座標 + 法線ベクトル
---- `{x,y,z,r,g,b,a}`          : 頂点座標 + 頂点の色
---- `{x,y,z,r,g,b,a,vx,vy,vz}` : 頂点座標 + 頂点の色 + 法線ベクトル
---
---※テーブルは面の頂点数で割り切れる数になります  
---※u,vはオブジェクトの正規化座標(0.0～1.0)  
---※vx,vy,vzは法線ベクトル  
---※r,g,b,aは描画色(0.0～1.0の乗算済みα) ※色の指定時はオブジェクトの画像は利用されません  
---@param vertex number[][]
---@param vertex_num 4|3 # 面の頂点数( 4<デフォルト>=四角形 / 3=三角形 )
---@param alpha number # 不透明度
function obj.drawpoly(vertex, vertex_num, alpha)end


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
---@return number # 動画の長さ[秒]
function obj.load(type,file,time)end

---入力プラグインにファイルを読み込ませて、内容をオブジェクトの画像データへデコードする
---@param type "movie"
---@param file string # ファイルへのパス
---@return number # 動画の長さ[秒]
function obj.load(type,file)end

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
---|'"ハート"'
---|string # SVGファイル名

---@param type "figure"
---@param name figure_name
---@param color integer # 図形の色
---@param size integer # サイズ
---@param line integer # ライン幅
---@param round boolean # 角を丸くする
function obj.load(type,name,color,size,line,round)end

---フレームバッファを読み込む
---@param type "framebuffer"
function obj.load(type)end

---`(x,y)`から`(x+w,y+h)`までの矩形範囲のフレームバッファを読み込む
---@param type "framebuffer"
---@param x integer
---@param y integer
---@param w integer
---@param h integer
---@param alpha? boolean アルファチャンネルを維持 (`true` = する / `false` <デフォルト> = しない)
function obj.load(type,x,y,w,h,alpha)end

---仮想バッファを読み込む
---@param type "tempbuffer"
function obj.load(type)end

---`(x,y)`から`(x+w,y+h)`までの矩形範囲の仮想バッファを読み込む
---@param type "tempbuffer"
---@param x integer
---@param y integer
---@param w integer
---@param h integer
function obj.load(type,x,y,w,h)end

---指定した番号のレイヤーのオブジェクトを読み込む
---@param type "layer"
---@param no integer # レイヤー番号(1～)
---@param effect? boolean # エフェクトを適用するか(`true` = する / `false` <デフォルト> = しない )
function obj.load(type,no,effect)end

---カスタムオブジェクト中でのみ有効<br>
---直前オブジェクトを読み込む
---@param type "before"
function obj.load(type)end


---@alias setfont_type
---|0 # 標準文字
---|1 # 影付き文字
---|2 # 影付き文字(薄)
---|3 # 縁取り文字
---|4 # 縁取り文字(細)
---|5 # 縁取り文字(太)
---|6 # 縁取り文字(角)

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
function obj.rand(st_num,ed_num)end

---同じパラメータを渡せば同じ結果が返る乱数関数
---frame = obj.frame
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@param seed integer # シード値
---@return number
---@nodiscard
function obj.rand(st_num,ed_num,seed)end

---同じパラメータを渡せば同じ結果が返る乱数関数
---@param st_num integer # 範囲の最小値(閉区間)
---@param ed_num integer # 範囲の最大値(閉区間)
---@param seed integer # シード値
---@param frame integer # シード値2
---@return number
---@nodiscard
function obj.rand(st_num,ed_num,seed,frame)end

---0.0以上1.0未満の乱数を発生させます。通常の乱数と異なり同一時間のフレームで常に同じ値が出るように乱数を発生させます。
---
---シードは省略するとオブジェクト毎に異なる乱数になります。
---プラスの値を指定するとシードが同じでもオブジェクト毎に異なる乱数になり、マイナスの値ではシードが同じならば全てのオブジェクトで同じ乱数になります。
---
---フレーム番号は省略すると現在のフレームになります。
---@return number
---@nodiscard
function obj.rand1()end

---0.0以上1.0未満の乱数を発生させます。通常の乱数と異なり同一時間のフレームで常に同じ値が出るように乱数を発生させます。
---
---シードは省略するとオブジェクト毎に異なる乱数になります。
---プラスの値を指定するとシードが同じでもオブジェクト毎に異なる乱数になり、マイナスの値ではシードが同じならば全てのオブジェクトで同じ乱数になります。
---
---フレーム番号は省略すると現在のフレームになります。
---@param seed integer # 乱数のシード
---@return number
---@nodiscard
function obj.rand1(seed)end

---0.0以上1.0未満の乱数を発生させます。通常の乱数と異なり同一時間のフレームで常に同じ値が出るように乱数を発生させます。
---
---シードは省略するとオブジェクト毎に異なる乱数になります。
---プラスの値を指定するとシードが同じでもオブジェクト毎に異なる乱数になり、マイナスの値ではシードが同じならば全てのオブジェクトで同じ乱数になります。
---
---フレーム番号は省略すると現在のフレームになります。
---@param seed integer # 乱数のシード
---@param frame integer # フレーム番号
---@return number
---@nodiscard
function obj.rand1(seed,frame)end


---裏面を表示しない
---@param name "culling"
---@param value bool_int # 0: 表示, 1: 非表示
function obj.setoption(name,value)end

---カメラの方向を向く
---@param name "billboard"
---@param value `0`|`1`|`2`|`3` # 0: 向かない, 1: 横方向のみ 2: 縦方向のみ 3: 向く
function obj.setoption(name,value)end

---合成モード
---@param name "blend"
---@param value blend_mode
---@param option? "force"
function obj.setoption(name,value,option)end

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

---@alias setoption_sampler_value
---|'"clip"' # 領域外は透明色
---|'"clamp"' # 領域外は一番外側の色
---|'"loop"' # 領域外はループ
---|'"mirror"' # 領域外は領域を反転しながらループ
---|'"dot"' # 拡大縮小補間をしない(領域外は透明色)

---サンプラーモード
---
---`obj.draw()`, `obj.drawpoly()` 描画時のサンプラーをデフォルト設定に戻します
---@param name "sampler"
function obj.setoption(name)end

---サンプラーモード
---
---`obj.draw()`, `obj.drawpoly()` 描画時のサンプラーを変更します
---@param name "sampler"
---@param value setoption_sampler_value
function obj.setoption(name,value)end

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
---@param value integer | string トラックバーの番号または変数名
---@return `0` | string
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
---@return boolean
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
---|'"cx"' # 基準中心座標(X)
---|'"cy"' # 基準中心座標(Y)
---|'"cz"' # 基準中心座標(Z)
---|'"sx"' # 基準拡大率(X)
---|'"sy"' # 基準拡大率(Y)
---|'"sz"' # 基準拡大率(Z)
---|'"zoom"'   # 拡大率(等倍は*100*)
---|'"alpha"'  # 不透明度
---|'"aspect"' # 縦横比
---|'"time"'   # オブジェクト基準の時間
---|'"frame_s"' # 全体基準のオブジェクトの開始フレーム(0からの整数)
---|'"frame_e"' # 全体基準のオブジェクトの終了フレーム(0からの整数)
---|'"scenechange"' # シーンチェンジの進行度 (`[0,1]`)
---|string # `"track.xxx"` = 変数名xxxのトラックバーの値

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

---指定したレイヤーにあるオブジェクトの設定を取得する
---time = obj.time
---section = 0
---@param target string # `"layer{番号}.{種類}"`、`"layer{番号}"`
---@return number|nil|boolean # 種類を指定しない場合はオブジェクトの有無がbooleanで返る。種類を指定した場合、指定したレイヤーにオブジェクトが無い場合は `nil` 、オブジェクトがあれば値が返る。
---@nodiscard
function obj.getvalue(target)end

---指定したレイヤーにあるオブジェクトの設定を取得する
---section = 0
---@param target string # `"layer{番号}.{種類}"`、`"layer{番号}"`
---@param time number # 基準時間
---@return number|nil|boolean # 種類を指定しない場合はオブジェクトの有無がbooleanで返る。種類を指定した場合、指定したレイヤーにオブジェクトが無い場合は `nil` 、オブジェクトがあれば値が返る。
---@nodiscard
function obj.getvalue(target,time)end

---指定したレイヤーにあるオブジェクトの設定を取得する
---@param target string # `"layer{番号}.{種類}"`、`"layer{番号}"`
---@param time number # 基準時間
---@param section integer # 基準区間
---@return number|nil|boolean # 種類を指定しない場合はオブジェクトの有無がbooleanで返る。種類を指定した場合、指定したレイヤーにオブジェクトが無い場合は `nil` 、オブジェクトがあれば値が返る。
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


---@alias getaudio_types
---|'"pcm"'         # PCMサンプリングデータ(16bitモノラルのスケール基準)
---|'"spectrum"'    # 周波数毎の音量データ
---|'"fourier"'     # 音声を離散フーリエ変換したデータ(sizeの指定は不要)
---|'"pcm.l"'       # PCMサンプリングデータ(左チャンネル)
---|'"pcm.r"'       # PCMサンプリングデータ(右チャンネル)
---|'"spectrum.l"'  # 周波数毎の音量データ(左チャンネル)
---|'"spectrum.r"'  # 周波数毎の音量データ(右チャンネル)
---|'"fourier.l"'   # 音声を離散フーリエ変換したデータ(左チャンネル)
---|'"fourier.r"'   # 音声を離散フーリエ変換したデータ(右チャンネル)

---音声データを取得する
---@param buf table # 音声データ
---@param file string|"audiobuffer"
---@param type getaudio_types
---@param size integer
---@return integer # 要素数
---@return integer # サンプリングレート
---@nodiscard
function obj.getaudio(buf,file,type,size)end

---音声データを取得する
---@param buf nil
---@param file string|"audiobuffer"
---@param type getaudio_types
---@param size integer
---@return integer # 要素数
---@return integer # サンプリングレート
---@return table buf # 音声データ
---@nodiscard
function obj.getaudio(buf,file,type,size)end


---@alias buffer_cache_name string
---@alias buffer_image_name string

---画像バッファをコピーします。
---@param dst "object"|"tempbuffer"|buffer_cache_name
---@param src "object"|"tempbuffer"|"framebuffer"|buffer_cache_name|buffer_image_name
---@return boolean # 成功したか
---@nodiscard
function obj.copybuffer(dst,src)end


---画像バッファをクリアします。
---@param target "object"|"tempbuffer"|"framebuffer"|buffer_cache_name # クリアするバッファ名
function obj.clearbuffer(target)end

---画像バッファをクリアします。
---@param target "object"|"tempbuffer"|"framebuffer"|buffer_cache_name # クリアするバッファ名
---@param color integer # 色(0x000000～0xffffff) ※未指定の場合は透明色
function obj.clearbuffer(target,color)end

---画像バッファのサイズを変更してクリアします。
---@param target "object"|"tempbuffer"|buffer_cache_name # クリアするバッファ名(フレームバッファはサイズを変更出来ません)
---@param w integer # 横のピクセル数
---@param h integer # 縦のピクセル数
function obj.clearbuffer(target,w,h)end

---画像バッファのサイズを変更してクリアします。
---@param target "object"|"tempbuffer"|buffer_cache_name # クリアするバッファ名(フレームバッファはサイズを変更出来ません)
---@param w integer # 横のピクセル数
---@param h integer # 縦のピクセル数
---@param color integer # 色(0x000000～0xffffff) ※未指定の場合は透明色
function obj.clearbuffer(target,w,h,color)end


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
---@param value "object"|"framebuffer"|"obj"|"frm"
function obj.pixeloption(name,value)end

---ピクセル情報の書き込み先を設定する
---@param name "put"
---@param value "object"|"framebuffer"|"obj"|"frm"
function obj.pixeloption(name,value)end

---書き込むときの合成モードを指定する
---@param name "blend"
---@param value blend_mode
function obj.pixeloption(name,value)end


---@alias buffer_pixeldata_name
---|'"object"' # オブジェクト
---|'"tempbuffer"' # 仮想バッファ
---|'"framebuffer"' # フレームバッファ
---|buffer_cache_name # キャッシュバッファ

---画像バッファからRGBA(32bit)形式でデータを読み出します。
---
---この関数はDLLを利用して画像処理をする為のものです。  
---※VRAMからデータを取得するので処理は速くないです。
---@param target buffer_pixeldata_name # 読み込む画像バッファ
---@return lightuserdata # 画像データのポインタ (フォーマットはRGBA32bit)
---@return integer # 画像の幅
---@return integer # 画像の高さ
---@nodiscard
function obj.getpixeldata(target)end

---画像バッファからRGBA(32bit)形式でデータを読み出します。
---
---この関数はDLLを利用して画像処理をする為のものです。  
---※VRAMからデータを取得するので処理は速くないです。
---@param target buffer_pixeldata_name # 読み込む画像バッファ
---@param format "rgba"|"bgra" # 画像データのフォーマット (`"rgba"` = RGBA32bit / `"bgra"` = BGRA32bit)
---@return lightuserdata # 画像データのポインタ
---@return integer # 画像の幅
---@return integer # 画像の高さ
---@nodiscard
function obj.getpixeldata(target,format)end


---RGBA(32bit)形式のデータを画像バッファへ書き込みます。
---
---この関数はDLLを利用して画像処理をする為のものです。  
---※VRAMへデータを書き込むので処理は速くないです。
---@param target buffer_pixeldata_name # 書き込む画像バッファ
---@param data lightuserdata # 画像データのポインタ (フォーマットはRGBA32bit)
---@param w integer # 画像の幅
---@param h integer # 画像の高さ
function obj.putpixeldata(target,data,w,h)end

---RGBA(32bit)形式のデータを画像バッファへ書き込みます。
---
---この関数はDLLを利用して画像処理をする為のものです。  
---※VRAMへデータを書き込むので処理は速くないです。
---@param target buffer_pixeldata_name # 書き込む画像バッファ
---@param data lightuserdata # 画像データのポインタ
---@param w integer # 画像の幅
---@param h integer # 画像の高さ
---@param format "rgba"|"bgra" # 画像データのフォーマット (`"rgba"` = RGBA32bit / `"bgra"` = BGRA32bit)
function obj.putpixeldata(target,data,w,h,format)end


---@alias buffer_shader_name
---|'"object"'      # オブジェクト
---|'"tempbuffer"'  # 仮想バッファ
---|'"framebuffer"' # フレームバッファ
---|buffer_cache_name

---@alias shader_resource_name
---|'"object"'      # オブジェクト
---|'"tempbuffer"'  # 仮想バッファ
---|'"framebuffer"' # フレームバッファ
---|'"random"'      # 乱数バッファ(0.0～1.0の乱数値の256x256の領域、DXGI_FORMAT_R32_FLOAT、r値のみ)
---|buffer_cache_name

---@alias pixelshader_blend
---|'"copy"' # 出力をそのままコピーします
---|'"mask"' # α値のみを乗算します ※RGB値は利用されません
---|'"draw"' # 出力をアルファブレンドします
---|'"add"' # 出力を加算合成します

---@alias pixelshader_sampler
---|'"clip"'    # 領域外(0.0～1.0の範囲外)は透明色
---|'"clamp"'   # 領域外は境界の色
---|'"loop"'    # 領域外は領域をループ
---|'"mirror"'  # 領域外は領域を反転しながらループ
---|'"dot"'     # 拡大縮小補間をしない(領域外は透明色)

---ピクセルシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name # 出力先のバッファ名
---@param resource shader_resource_name[] # 参照するバッファ名の配列
function obj.pixelshader(name,target,resource)end

---ピクセルシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name # 出力先のバッファ名
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
function obj.pixelshader(name,target,resource,constant)end

---ピクセルシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name # 出力先のバッファ名
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
---@param blend pixelshader_blend # 出力先へのブレンド方法
function obj.pixelshader(name,target,resource,constant,blend)end

---ピクセルシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name # 出力先のバッファ名
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
---@param blend pixelshader_blend # 出力先へのブレンド方法
---@param sampler pixelshader_sampler # サンプラーの種別
function obj.pixelshader(name,target,resource,constant,blend,sampler)end


---コンピュートシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name[] # 読み書き先のバッファ名の配列
---@param resource shader_resource_name[] # 参照するバッファ名の配列
function obj.computeshader(name,target,resource)end

---コンピュートシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name[] # 読み書き先のバッファ名の配列
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
function obj.computeshader(name,target,resource,constant)end

---コンピュートシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name[] # 読み書き先のバッファ名の配列
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
---@param countX integer # X軸スレッドグループ数
function obj.computeshader(name,target,resource,constant,countX)end

---コンピュートシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name[] # 読み書き先のバッファ名の配列
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
---@param countX integer # X軸スレッドグループ数
---@param countY integer # Y軸スレッドグループ数
function obj.computeshader(name,target,resource,constant,countX,countY)end

---コンピュートシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name[] # 読み書き先のバッファ名の配列
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
---@param countX integer # X軸スレッドグループ数
---@param countY integer # Y軸スレッドグループ数
---@param countZ integer # Z軸スレッドグループ数
function obj.computeshader(name,target,resource,constant,countX,countY,countZ)end

---コンピュートシェーダーを実行します。
---@param name string # シェーダーの登録名
---@param target buffer_shader_name[] # 読み書き先のバッファ名の配列
---@param resource shader_resource_name[] # 参照するバッファ名の配列
---@param constant number[] # 参照する定数の配列
---@param countX integer # X軸スレッドグループ数
---@param countY integer # Y軸スレッドグループ数
---@param countZ integer # Z軸スレッドグループ数
---@param sampler pixelshader_sampler # サンプラーの種別
function obj.computeshader(name,target,resource,constant,countX,countY,countZ,sampler)end


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
---@return number ...
---@nodiscard
function obj.getpoint(target)end

---トラックバー変化方法スクリプトでのみ有効<br>関連トラックの情報を取得する
---@param target "link"
---@return integer i # 関連トラックの序数
---@return integer n # 関連トラックの総数
---@nodiscard
function obj.getpoint(target)end

---@alias getpoint_timecontrol_option
---|'"index"' # 時間制御を反映した区間での位置を取得
---|'"time"'  # 時間制御を反映した時間を取得
---|'"value"' # 時間制御の時間位置(開始点=0.0/終了点=1.0)を取得

---トラックバー変化方法スクリプトでのみ有効<br>時間制御を反映した現在の値を取得する
---@param target "timecontrol"
---@param option getpoint_timecontrol_option
---@return number
---@nodiscard
function obj.getpoint(target,option)end

---トラックバー変化方法スクリプトでのみ有効<br>時間制御を反映した現在の値を取得する
---@param target "timecontrol"
---@param option "value"
---@param option2 number # 取得する時間
---@return number
---@nodiscard
function obj.getpoint(target,option,option2)end

---トラックバー変化方法スクリプトでのみ有効<br>フレームレートを取得する
---@param target "framerate"
---@return number
---@nodiscard
function obj.getpoint(target)end


---スクリプトフォルダのパス(`{exedit.auf dir}/script/`)を取得する
---@param name "script_path"
---@return string
---@nodiscard
function obj.getinfo(name)end

---フィルタオブジェクトの処理中かを調べる
---@param name "filter"
---@return boolean
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

---グリッド(BPM)の情報を取得する
---@param name "bpm"
---@return number tempo
---@return integer beat
---@return number offset
---@nodiscard
function obj.getinfo(name)end

---アプリ起動からの経過時間(秒)を取得する
---@param name "clock"
---@return number
---@nodiscard
function obj.getinfo(name)end

---スクリプト実行開始からの経過時間(ミリ秒)を取得する
---@param name "script_time"
---@return number
---@nodiscard
function obj.getinfo(name)end

---バージョン情報を取得
---
---例： AviUtl ExEdit2 version 2.0 beta13 → 2001300
---@param name "version"
---@return integer
function obj.getinfo(name)end


---汎用データ領域を取得します。
---@param name string # 汎用データ領域の登録名
---@return lightuserdata # 汎用データ領域のポインタ
---@nodiscard
function obj.data(name)end


---スクリプトモジュール(.mod2)の関数を取得します。
---@param name string # モジュール名(スクリプトモジュールのファイル名本体)
---@return table # スクリプトモジュールの関数テーブル
function obj.module(name)end


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

---原点(0,0)を中心に指定の座標を拡大縮小回転します。
---@param x0 number # 頂点0のX座標
---@param y0 number # 頂点0のY座標
---@param x1 number # 頂点1のX座標
---@param y1 number # 頂点1のY座標
---@param x2 number # 頂点2のX座標
---@param y2 number # 頂点2のY座標
---@param x3 number # 頂点3のX座標
---@param y3 number # 頂点3のY座標
---@param zoom number # 拡大率(1.0=等倍)
---@param r number # 回転角度(360.0で一回転)
---@return number x0
---@return number y0
---@return number x1
---@return number y1
---@return number x2
---@return number y2
---@return number x3
---@return number y3
---@nodiscard
function rotation(x0,y0,x1,y1,x2,y2,x3,y3,zoom,r)end


---0.0以上1.0未満の乱数を発生させます。通常の乱数と異なり同一時間のフレームで常に同じ値が出るように乱数を発生させます。
---
---シードは省略するとオブジェクト毎に異なる乱数になります。
---プラスの値を指定するとシードが同じでもオブジェクト毎に異なる乱数になり、マイナスの値ではシードが同じならば全てのオブジェクトで同じ乱数になります。
---
---フレーム番号は省略すると現在のフレームになります。
---@return number
---@nodiscard
function rand1()end

---0.0以上1.0未満の乱数を発生させます。通常の乱数と異なり同一時間のフレームで常に同じ値が出るように乱数を発生させます。
---
---シードは省略するとオブジェクト毎に異なる乱数になります。
---プラスの値を指定するとシードが同じでもオブジェクト毎に異なる乱数になり、マイナスの値ではシードが同じならば全てのオブジェクトで同じ乱数になります。
---
---フレーム番号は省略すると現在のフレームになります。
---@param seed integer # 乱数のシード
---@return number
---@nodiscard
function rand1(seed)end

---0.0以上1.0未満の乱数を発生させます。通常の乱数と異なり同一時間のフレームで常に同じ値が出るように乱数を発生させます。
---
---シードは省略するとオブジェクト毎に異なる乱数になります。
---プラスの値を指定するとシードが同じでもオブジェクト毎に異なる乱数になり、マイナスの値ではシードが同じならば全てのオブジェクトで同じ乱数になります。
---
---フレーム番号は省略すると現在のフレームになります。
---@param seed integer # 乱数のシード
---@param frame integer # フレーム番号
---@return number
---@nodiscard
function rand1(seed,frame)end


---指定の内容をログに出力する
---@param text string
function debug_print(text)end

--[[
Copyright (C) 2024 ePi
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.
]]
