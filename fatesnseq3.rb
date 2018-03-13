# coding: utf-8
require "ScenarioGraph"

ScenarioGraph("fatesnseq3", true) do
  scenes :s0000, <<OPTIONS, <<END, :s2001
1・十年前の回想〜朝
Rebirth
OPTIONS
桜の手伝いをしに行こう。
いつもの日課を住ませてしまおう。
END

  scenes :s2001, <<OPTIONS, <<END, :s0002
1・朝の支度
間桐桜 (I)
一日目・朝食
衛宮邸の朝
学校～放課後
日常 (I)
OPTIONS
生徒会の手伝いをしよう。
アルバイトに行こう。
END

  scenes :s0002, <<OPTIONS, <<END, :s2002
一日目・放課後
高値の花 (誤字にあらず)
・夜の帰宅
白い少女
・夕食後
おつかれさまでした
OPTIONS
桜を送っていく
藤ねえと遊ぶ。
大人しく休む。
END

  scenes :s2002, <<OPTIONS, <<END, nil, :s2003
1・夜
桜を送る、上級編
・就寝
鍛錬(魔術回路)
二日目・目覚め
些細な変動
OPTIONS
道場で朝の日課をこなそう
桜も来るし、もう一品加えよう
END

  scenes :s2003, <<OPTIONS, <<END, nil, :Sakura
2・桜と朝食の支度
兆し
・学校
日常 (II)
・放課後
選択肢
OPTIONS
遠坂が心配だ
桜が気にかかる
END

  node :Sakura, label:"桜ルート", shape:"oval"
  route :Sakura => :s2004

  scenes :s2004, <<OPTIONS, <<END, nil, :s2005
2・放課後・桜の教室
間桐桜 (II)
2・放課後〜アルバイト
遠坂凛 (I)
・夜〜間桐邸
翁
3・目覚め～朝
焼きついたもの。
・朝～登校
悪化する痣
3・放課後〜夜
運命の夜
3・夜〜帰宅
もういちど
セイバー召喚。VSランサー
プロミスト・サイン
三日目・マスター講座
遠坂凛 (II)
三日目・言峰協会
オルター・エゴ
OPTIONS
刻印を破棄する。
戦う。
END

  scenes :s2005, <<OPTIONS, <<END, nil, :s2006
三日目・言峰協会
決意
最強の敵
OPTIONS
遠坂を連れて逃げる
セイバーを助ける
END

  scenes :s2006, <<OPTIONS, <<END, :s2045, :s2034
三日目・ラスト
ディストレーション (I)
3・幕間
奈落の虫
四日目朝
凛の看病。協力しようという凛だが
・朝
凛、去る
・午前・道場
セイバーによるルール説明
・道場〜教会
聖杯戦争、その発端
・教会外
戦う意思、戦う剣
・夕方〜夕食
イントルーダー
・夜・巡回
選択肢
OPTIONS
自分の足場を固める
新都へ
END

  scenes :s2045, <<END
行動
深山町へ
END

  scenes :s2034, <<END
行動
新都へ
END

  route [:s2045, :s2034] => :s2007

  scenes :s2007, <<OPTIONS, <<END, :s2089, :s2090, :s2091
4・深夜・公園
マキリの末〜VSライダー
・深夜・教会
その答えは結末にのみ
5・朝、起床
いつもの朝？
5・朝食
セイバーさん不機嫌〜慎二の蛮行
・登校〜学校
レディ？
OPTIONS
桜の事を相談する
慎二の事を相談する
危険の匂いだ、教室にダッシュ
END

  scenes :s2089, <<END
ゴー!
桜について
END

  scenes :s2090, <<END
ゴー!
慎二
END

  route [:s2089, :s2090] => :flag9

  scenes :s2091, <<END
ノー!
ファンシーカース。大魔神とても怒る
END
  route :s2091 => :flag10
  route :flag10 => :s2092

  route :flag9 => :s2008

  scenes :s2008, <<OPTIONS, <<END, :s2009
5・昼休み・屋上
凛と相談〜休戦条約？
・放課後・商店街
冬の娘〜イリヤ (I)
OPTIONS
俺は嫌いじゃないぞ
俺は気にしてないぞ
END

  scenes :s2009, <<END
返答
良かったね
5・夕方前・公園
イノセント・マーダー
END

  route :s2009 => :s2092

  scenes :s2092, <<OPTIONS, <<END, :s2010, :s2011
5・帰宅・夕食前
桜に誰がきりだす？
OPTIONS
藤ねえにお願いする
自分で言う
END

  scenes :s2010, <<END
依頼
藤ねえ
END


  scenes :s2011, <<END
実行
自分
END

  route [:s2010, :s2011] => :s2012

  scenes :s2012, <<OPTIONS, <<END, :s2035, :s2036
5・夕食後
桜の様子を見に行く?
OPTIONS
様子を見に行ってみようか？
いや、藤ねえに任せよう
END

  scenes :s2035, <<END
5・脱衣場
ゴールドメディスン、Aカプセル
END

  scenes :s2036, <<END
5・居間
ゴールドメディスン、Cカプセル
END

  route :s2035 => :flag3
  route :s2036 => :flag4



  route [:flag3, :flag4] => :s2013

  scenes :s2013, <<OPTIONS, <<END, :s2014
・深夜〜巡回
柳洞寺へ
幕間
アラク・アル・マウト
・深夜・柳洞寺境内
VSキャスター
幕間
ディザスター
・就寝〜？
形のない島
6・起床〜朝
体調不良〜桜の看病
・桜の看病
素朴な疑問
OPTIONS
嘘はつかない
なんとか誤魔化す
END

  scenes :s2014, <<OPTIONS, <<END, :'x1:n', :s2099, :s2101
回答
冷たい笑顔
6・昼食後
選択肢
OPTIONS
外に買い物に行こう
おやつの時間にするべし
食後はまったりテレビである
END

  scenes :s2099, <<END
6・昼食後・居間
このセイバー容赦せん!
END

  scenes :s2101, <<END
6・昼食後・居間
のどかな食後
END

  route [:s2099, :s2101] => :s2100

  node :x1, label:' ', shape: 'diamond'

  edge :'x1:e', :s2015, '※9'
  edge :'x1:w', :s2093, '※10'


  scenes :s2093, <<END
6・公園
冬の娘〜イリヤ (I)
END

  scenes :s2015, <<END
6・公園
冬の城〜イリヤ (II)
END

  route :s2015 => :flag11

  route [:s2093, :flag11] => :s2094

  scenes :s2094, <<END
6・帰宅〜玄関
だいぴんち
END
  route :s2094 => :s2100

  scenes :s2100, <<OPTIONS, <<END, :s2016, :s2017
6・夕方
間桐慎二
OPTIONS
慎二を殴る
我慢する
END


  scenes :s2016, <<END
行動
激昂
END

  scenes :s2017, <<END
行動
自重
END

  route [:s2016, :s2017] => :s2018

  scenes :s2018, <<OPTIONS, <<END, :s2019, :s2021, :s2022
6・〜夜
倒れた桜〜夜の予定
OPTIONS
新都を巡回する
深山町を巡回する
いや、桜が心配だ
END

  scenes :s2019, <<END
6・夜・巡回
新都
6・就寝
一日の終わり
END

  scenes :s2021, <<END
6・夜・巡回
深山町
6・就寝
一日の終わり
END

  route [:s2019, :s2021] => :flag2

  scenes :s2022, <<END
6・就寝
間桐桜 (III)
END

  route :s2022 => :flag1

  route [:flag1, :flag2] => :s2020

  scenes :s2020, <<END
幕間
勇者の死
7・起床〜朝食
はぐれ雲人情相撲編
・朝食後
桜とお弁当
・登校〜昼休み
インターバル
・昼休み・屋上
遠坂凛 (II)
・五時限目前・階段
ふたり
・放課後〜中華飯店
衝撃のマーボー
幕間
再契約
END

  edge :s2020, :s2095, '※11'
  edge :s2020, :s2096, ''

  scenes :s2095, <<OPTIONS, <<END, :s2023, :s2024
7・帰り道・交差点
強襲、ちびっ娘さん
OPTIONS
お客さまとしてうちに招く
謝罪を込めて言うコトを聞く
なんとか大目に見てもらう
END

  scenes :s2096, <<END
7・午後
帰り道
END

  route :s2096 => :s2025

  scenes :s2023, <<END
選択
ホームシック〜イリヤ (III)
END

  scenes :s2024, <<END
選択
シネマ〜イリヤ (III)
END

  route [:s2023, :s2024] => :s2025

  scenes :s2025, <<END
7・帰宅・居間
テンプテーション(夕方)
・剣の稽古〜居間
桜の手当て
・深夜・公園
ウォーバランス・ランダマイザー
END

  edge :s2025, :s2027, '※1 AND ※3'
  edge :s2025, :s2026, '※2 OR ※4'


  scenes :s2026, <<END
七日目
深海
END

  route :s2026 => :tiger25

  scenes :s2027, <<END
七日目·生還~帰宅
二人の溝
幕間
跳梁
八日目·起床~朝
桜の告戒
八日目·朝
影に挑む
八日目·学校
未来予知
八日目·屋上
凛のアドバイス
END

  edge :s2027, :s2097, '※11'
  edge :s2027, :s2098, ''

  scenes :s2097, <<OPTIONS, <<END, :s2028, :s2102
八日目·下校
夕焼けの町。
幕間
真実。
八日目·夕食
穏やかな日
八日目·夜の巡回
選択肢。
OPTIONS
柳洞寺を調べよう。
公園を調べよう
END

  scenes :s2098, <<END
8・帰宅〜衛宮邸
聖杯の戦い
END
  route :s2098 => :tiger26

  scenes :s2102, <<END
決定
お叱り
END
  route :s2102 => :s2028

  scenes :s2028, <<OPTIONS, <<END, :s2030, :s2103, :s2104
八日目·深夜·柳洞寺
アサシン襲来
幕間
最後の剣士
八日目·深夜·柳洞寺お堂
柳洞寺の戦い。
OPTIONS
セイバーを信じて待つ
臓硯に斬りかかる
令呪を使う
END


  scenes :s2030, <<END
決定
悲痛な信頼
END

  route :s2030 => :s2105

  scenes :s2105, <<OPTIONS, <<END, :s2031, :s2037
柳洞寺の戦い
真アサシンVSライダー
八日目·深夜·柳洞寺
別れと誓い
八日目·帰宅~就寝
なくしたもの
幕間
サナギ
幕間
レポート
九日目·起床~朝
桜倒れる
九日目·学校~屋上
凛への報告
OPTIONS
反撃を警戒していた、とか?
俺を殺したくなかった、とか?
爺さんの余裕だった、とか?
END

  scenes :s2031, <<END
回答
不満
END

  scenes :s2037, <<END
回答
正解
END

  route [:s2031, :s2037] => :s2032
  scenes :s2032, <<OPTIONS, <<END, :s2033, :s2038
凛の質問
これからの行動は
OPTIONS
いや、これは自分ひとりの問題だ。
俺一人じゃダメだ。遠坂の手を借りないと。
END

  scenes :s2033, <<END
9・午後〜対決
孤軍無惨
END

  route :s2033 => :tiger28

  scenes :s2038, <<OPTIONS, <<END, :s2039, :s2116
凛の問答
選択肢
OPTIONS
はい
いいえ
END

  scenes :s2116, <<END
返事
何様よアンタ
END

  scenes :s2039, <<OPTIONS, <<END, :s2040
凛の問答
信頼できる?裏切らない?
OPTIONS
はい
いいえ
END

  scenes :s2040, <<OPTIONS, <<END, :s2041, :flag12
凛の問答
絶対服従する？
OPTIONS
するか!
……仕方ない。
END

  route :flag12 => :s2113
  scenes :s2113, <<END
返事
ギアス
九日目·下校~遠坂邸
写真
END

  route :s2113 => :s2046

  scenes :s2041, <<OPTIONS, <<END, :s2046, :s2047
返事
わたしを勝たせてね
九日目·下校~遠坂邸
写真
九日目·凛の部屋~夕方
選択肢。
OPTIONS
これ以上桜をひとりにさせられない。
いや、家政婦さんもいるし、あと少しぐらいなら..
END

  scenes :s2046, <<END
決断
凛さま、怒る。
END

  scenes :s2047, <<END
決断
凛さま、やっぱり怒る。
END

  route [:s2046, :s2047] => :s2042

  scenes :s2042, <<OPTIONS, <<END, :s2043, :s2106, :s2107
九日目·帰宅~学校へ
オーバー
VSライダー
桜の真実。
OPTIONS
遠坂の手を引いて
目を瞑って、ライダーに斬りかかる
何もできない
END

  scenes :s2106, <<END
9・VSライダー
ストーン・コフィン
END

  route :s2106 => :tiger29

  scenes :s2107, <<END
魔眼解放
直撃
END

  scenes :s2043, <<END
魔眼解放
凛を助ける
END

  route [:s2107, :s2043] => :s2108

  scenes :s2108, <<OPTIONS, <<END, :s2044, :s2048
九日目·~教会
姉妹(1)
九日目·教会外~公園·夜
まもるべきもの
OPTIONS
正義の味方を、張り通す。
桜の味方になりたいんだ
END


  scenes :s2044, <<END
九日目
正義の見方
END

  route :s2044 => :tiger30


  scenes :s2048, <<END
九日目·公園~教会へ
雨に走る
幕間
掬いの手
9・教会・凛と対峙
セット·ポジション
END

  edge :s2048, :s2115, '※12'
  route :s2048 => :s2114

  scenes :s2115, <<END
9・夜・教会
ギアス
END
  route :s2115 => :tiger31

  scenes :s2114, <<OPTIONS, <<END, :s2065, :s2060, :s2049
九日目
レイン
九日目·帰宅~玄関
姉妹(Ⅱ) 
九日目·深夜,自室
体の重なり
十日目·起床~朝
初々しい朝
十日目·朝食
食卓にいるライダーについて
OPTIONS
かなり好き。
かなり苦手。
それよりライダー、ごはんは?
END

  scenes :s2065, <<END
感想
桜、ライダーにレッドカード
END

  scenes :s2049, <<END
ライダー、ごはんは
たべません
END

  scenes :s2060, <<END
感想
ライダー、むす
END

  route [:s2065, :s2049, :s2060]  => :s2050

  scenes :s2050, <<OPTIONS, <<END, :s2109, :s2051
十日目·朝食後
今後の方針と桜とライダー。
幕間
ふたりの秘め事
十日目·アインツベルンの森
凛と合流。謎の爆発。
OPTIONS
この場に残るべきだ。
急いで様子を見に行くべきだ。
END

  scenes :s2109, <<END
十日目·アインツベルンの森
呪層界胎蔵曼荼羅
END
  route :s2109 => :tiger32

  scenes :s2051, <<OPTIONS, <<END, :s2110, :s2052
アインツベルンの森
爆心地へ
アインツベルンの森
城食影
アインツベルンの森
パワー·ゲーム
アインツベルンの森
イリヤ救出~黒い剣士
アインツベルンの森
ディストラクション
OPTIONS
遠坂を連れ戻す
イリヤを守りきる
END

  scenes :s2110, <<END
アインツベルンの森
ワールドパージ·メルトダウン!
END
  route :s2110 => :tiger33

  scenes :s2052, <<OPTIONS, <<END, nil, :s2059
アインツベルンの森
ブラッド·アウト
幕間
昏い望み
十日目·教会
アーティフイシャル·ファンタズム
十日目·教会外へ
どっちがいいの?
OPTIONS
遠坂、かな?
イリヤ、かな?
END

  scenes :s2059, <<END
感想
喜ぶイリヤ
END

  route :s2059 => :s2053

  scenes :s2053, <<OPTIONS, <<END, :s2054
十日目·交差点~帰宅
ブレイドウイルス
十日目·帰宅~玄関
スイート&amp;スパイシー
会話中
イリヤ経験済み
十日目·夕食
姉妹 (II)
十日目·就寝
選択肢。
OPTIONS
解く
解かない
END


  scenes :s2054, <<OPTIONS, <<END, nil, nil, :s2055
選択
解く
十日目·就寝
ライダーの問い
幕間
悪夢 (I)
十一日目·起床.自室
イリヤの忠告。
十一日目·朝食
バッドニュース
十一日目·朝食後
今後の方針。
十一日目·午前·道場
遠坂先生の魔術講座(荒療治ドキドキ編)
十一日目·昼食の準備
姉妹 (Ⅳ)
十一日目·午後
選択肢。
OPTIONS
遠坂とイリヤの様子を見に行く。
そういえば、ライダーに会ってないな。
いや、桜の見舜いを優先しよう。
END

  scenes :s2055, <<OPTIONS, <<END, :s2062, :s2063
幕間
歪み
十一日目·夕食
異変、 前兆
十一日目·夜·巡回
遠坂凛 (Ⅲ)
十一日目·帰宅·自室
封印解除~崩壊序曲
十一日目·夜·自室
心の重なり
幕間
悪夢 (II)
十二日目·起床~朝
空白。
十二日目·朝食
イリヤの朝ごはん
十二日目·午前·道場
その決意
OPTIONS
首を縦に振った。
駄目だ、それだけは出来ない
END

  scenes :s2062, <<END
覚悟
尊い愚者
END

  route :s2062 => :flag5

  scenes :s2063, <<END
覚悟
不断の咎
END

  route :s2063 => :flag6

  route [:flag5, :flag6] => :s2056

  scenes :s2056, <<OPTIONS, <<END, :s2057, :s2061
十二日目·午前·道場
修行開始
十二日目·正午·道場
空白。
十二日目·商店街
ローレライ
十二日目·夕食~夜
メモリー·ロスト
十二日目·夜·巡回
街食影
幕間
チェス
十二日目·帰宅~就寝
心の渇き
幕間
悪夢→目覚め
十三日目·起床~朝
桜の不在~発見
十三日目·午前
桜の看病
十三日目·午前·居間
遠い夕暮れ(I)
幕間
ミザリー
十三日目·午前·自室
アサシン侵入。選択肢。
OPTIONS
受ける。
受けない。
END

  scenes :s2057, <<END
十三日目·~間桐邸
臓硯と対峙~影の正体
十三日目·帰宅·玄関
ギフト
十三日目·午後·桜の客間
春になったら
十三日目·夜
決断の刻。
END

  edge :s2057, :s2058, '※6'
  edge :s2057, :o2064, '※5'


  scenes :s2058, <<END
十三日目
ハッピーエンド
END
  route :s2058 => :tiger35

  scenes :s2061, <<END
13・昼〜夕食
ホラーショー
END

  route :s2061 => :tiger34

  options :o2064, <<END, :s2058, :s2066
この手に、かける
それだけは、出来ない
END

  scenes :s2066, <<OPTIONS, <<END, :s2067, :s2112
十三日目·夜
美しいアリア
幕間
間桐桜 ()
十四日目·起床~教会へ
一縷の希望
幕間
フーリッシュ
幕間
トラッシュ
十四日目·教会
聖杯に潜むモノ
十四日目·帰宅~探索~間桐邸へ
間桐邸殺人事件
幕間
ラストピース
十四日目·間桐邸·桜の部屋
選択肢。
OPTIONS
急いでうちに戻る。
臓硯を許せない
END

  scenes :s2067, <<END
行動
最善
END

  scenes :s2112, <<END
行動
最悪
END

  route [:s2067, :s2112] => :s2111

  scenes :s2111, <<OPTIONS, <<END, :s2068, :s2070
幕間
サクラリッジ~姉妹 (VI)
十四日目
フィナーレ
十五日目
フィナーレ· リプレイ
OPTIONS
桜を助ける。イリヤを連れ戻す。
俺たちの負けだ
END

  scenes :s2068, <<OPTIONS, <<END, :s2069, :s2071
十五日目·教会~教会外
戦闘続行。言峰の協力を、
OPTIONS
断る。
頷く。
END

  scenes :s2069, <<END
15・アインツベルン城
デス・ペナルティ
END
  route :s2069 => :tiger37


  scenes :s2070, <<END
十五日目
デッド·フィン
END
  route :s2070 => :tiger36


  scenes :s2071, <<OPTIONS, <<END, :s2072, :s2072, :s2072
十五日目·森へ
デュオ
サクスイード·フロム·ディープ
このシーンをスキップしますか?
アインツベルン城
イリヤ発見
OPTIONS
イリヤを連れ戻す。
イリヤを連れ戻す。
イリヤを連れ戻す
END

  scenes :s2072, <<END
行動
感情
END

  route :s2072 => :s2073

  scenes :s2073, <<OPTIONS, <<END, :s2074, :s2075, :s2077
逃走開始~森へ
エピローグ
森の攻防·前半
[over load]
森の攻防·後半
Nine Bullet Revolver
十五日目·アインツベルンの森
聖者の死
十五日目·帰還~衛宮邸居間
真相~反英雄アンリマユ
十五日目·桜の影
決別
十五日目·夜·土蔵
宝石剣作成~大聖杯の記録。
十五日目·決戦準備
ライダーとの対峙。
OPTIONS
土蔵の外へ逃げる
投影で抵抗する…….
いつかの答えを、ロにする。
END

  scenes :s2074, <<END
15・夜
ライダー去る
END

  scenes :s2075, <<END
15・夜
ライダー去る
END

  route [:s2074, :s2075] => :s2076
  scenes :s2076, <<END
16・VSセイバー
スパークスライナーハイ
END
  route :s2076 => :tiger38

  scenes :s2077, <<OPTIONS, <<END, :s2078, :s2078, :s2079
選択肢
ライダーの問い
OPTIONS
最後まで戦えるか
最後まで諦めないか
最後まで桜の味方か
END

  scenes :s2078, <<END
15・夜
ライダー去る
END

  route :s2078 => :s2076

  scenes :s2079, <<OPTIONS, <<END, :s2080, :s2085, :s2084
十五日目·決戦準備
タクティクス
十五日目·夜
サヨナラ、アリガトウ
幕間
臓硯の最期
最終日
地下洞穴
最終日·中空洞
最強のサーヴァント
幕間
黒き王女の国
VSセイバー
バースト
OPTIONS
セイバーと打ち合う
次の投影
まだ機会を待つ
END

  scenes :s2080, <<END
最終日·中空洞
慈悲
END

  route :s2080 => :tiger39

  scenes :s2085, <<END
VSセイバー
バースト、アウト
END
  route :s2085 => :flag7


  scenes :s2084, <<END
VSセイバー
クレイジー・トレインII
END
  route :s2084 => :flag8
  route [:flag7, :flag8] => :s2081

  scenes :s2081, <<OPTIONS, <<END, :s2082, :s2083
誓い
OPTIONS
セイバーを助ける。
この腕を振り下ろす
END

  scenes :s2082, <<END
最終日・大空洞
ファム・ファタール
END
  route :s2082 => :tiger40

  scenes :s2083, <<END
君を忘れる

幕間
宝石剣ゼルレッチ
幕間
姉妹(VII)
終局
大空洞へ
終局
解放
終局
アンリマユへ
END

  edge :s2083, :s2087, '※7'
  edge :s2083, :s2086, '※8'

  scenes :s2087, <<END
終局
終局
END

  node :normal, label:"Normal End"
  route :s2087 => :normal


  scenes :s2086, <<OPTIONS, <<END, :s2087, :s2088
終局
この世全ての悪
幕間
悲願の果て
終局
この生、全ての善
最後の投影
OPTIONS
行う
いいのか、それで
END

  scenes :s2088, <<END
終局
奇跡の果て
END

  node :true, label: "True End"
  route :s2088 => :true


  scenes :s2103, <<END
決定
共に死す
END
  route :s2103 => :tiger27

  scenes :s2104, <<END
決定
令呪、使用
END

  route :s2104 => :s2105

end
