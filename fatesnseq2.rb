# coding: utf-8
require "gviz"
require "ScenarioGraph"

ScenarioGraph('fatesnseq2', true) do
  scenes :s0000, <<OPTIONS, <<END, nil, :s0001
1・十年前の回想〜朝
Rebirth
OPTIONS
桜の手伝いをしに行こう。
いつもの日課を住ませてしまおう。
END

  scenes :s0001, <<OPTIONS, <<END, :s0002
一日目・朝の鍛錬
道場風景
一日目・朝食
衛宮邸の朝
学校～放課後
日常 (I)
OPTIONS
生徒会の手伝いをしよう。
アルバイトに行こう。
END

  scenes :s0002, <<OPTIONS, <<END, nil, nil, :s0003
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

  ## 3
  scenes :s0003, <<OPTIONS, <<END, :Rin
・夜
更におつかれさまでした。
・就寝
鍛錬(魔術回路)
二日目・目覚め
衛宮邸の朝
・朝
道場風景
・学校
日常 II
・放課後
パイプライン
・放課後～アルバイト
遠坂凛 I
・夕食
恋のマジカルレンジャーフォース
三日目・目覚め～朝
焼きついたもの。
・朝～登校
不自然な痣。
・放課後～夜
運命の夜
・夜～帰宅
もういちど
セイバー召喚。VSランサー
プロミスト・サイン
OPTIONS
止める
止めない
END

  node :Rin, label:"凛ルート", shape:"oval"
  route :Rin => :s1004

  ## 1
  scenes :s1004, <<OPTIONS, <<END, :s1005, :s1054, :s1006
三日目・夜
令呪、一回目
・夜〜凛〜協会
凛の説明を経て、協会へ。参戦表明をし、言峰神父と別れる
・夜・帰宅〜イリヤ
もう一つの夜〜VSバーサーカー
VSバーサーカー
選択肢
OPTIONS
この場に残る
後を追う
遠坂の言葉に従う
END

  scenes :s1005, <<OPTIONS, <<END, :s1006, :s1007
VSバーサーカー
何処に向う
OPTIONS
この場に残る
墓地に向かう
END

  scenes :s1006, <<END
VSバーサーカー
三度目の死
END

  route :s1006 => :tiger15
  tiger 15

  scenes :s1054, <<OPTIONS, <<END, :s1055, :s1056
VSバーサーカー
互角の戦い〜アーチャーの狙撃
OPTIONS
セイバーを呼び戻す
セイバーを連れ戻す
END

  scenes :s1055, <<END
VSバーサーカー
呼び戻す声
END

  route :s1055 => :flag1

  scenes :s1056, <<END
VSバーサーカー
ディストレーション (II)
END
  route :s1056 => :flag2

  scenes :s1007, <<END
VSバーサーカー
互角の戦い〜アーチャーの狙撃
END
  route :s1007 => :s1055

  flag 1
  flag 2

  route :flag1 => :movie1
  route :flag2 => :movie2

  node :movie1, label:"Movie"
  node :movie2, label:"Movie"

  route :movie1 => :s1008
  route :movie2 => :s1058

  scenes :s1008, <<END
4・目覚め〜自室
凛との決別〜セイバーと会話
会話中
昨夜、傷を負っていない
END

  route :s1008 => :s1057

  scenes :s1058, <<END
4・目覚め〜自室
凛との決別〜セイバーと会話
会話中
昨夜、傷を負っている
END

  route :s1058 => :s1057

  scenes :s1057, <<OPTIONS, <<END, :s1009
・道場〜電話
セイバーの和解〜まだ見ぬ過ち
・午後・学校
テレフォンマーダー藤〜選択肢
OPTIONS
このまま弓道場にいる。
生徒会室に移動する。
セイバーに学校案内をする。
END

  scenes :s1009, <<END
4・弓道場
立射
END

  route :s1009 => :s1010
  scenes :s1010, <<OPTIONS, <<END, :s1011
4・帰宅～夕食
藤ねえたちにセイバーを紹介～女の子同盟?
・夜〜就寝
鍛錬、瞑想
幕間
遠坂凛 (II)
5・朝
選択肢
OPTIONS
セイバーの様子を見に行こう
桜の手伝いをしに行こう
藤ねえを起こしに行こう
END

  scenes :s1011, <<END
五日目・朝
セイバーの様子を見る
END

  route :s1011 => :s1012

  scenes :s1012, <<OPTIONS, <<END, :s1013, :s1014
5・朝食～登校
日常 II
・朝、学校
遠坂凛、美綴綾子
・放課後
遠坂凛 (III)
OPTIONS
階段に飛び込む
廊下に飛び退く
END

  scenes :s1013, <<END
5・放課後
テクスチャー
END

  route :s1013 => :tiger16
  tiger 16

  scenes :s1014, <<OPTIONS, <<END, :flag3, :flag4
VS遠坂凛
パニックソニックコースター
OPTIONS
令呪を差し出していいのか？
遠坂に負けを認めていいのか？
END

  flag 3
  flag 4

  route :flag3 => :s1015
  route :flag4 => :s1015


  scenes :s1015, <<OPTIONS, <<END, :s1016, :s1017, :s1023A
5・睨み合い〜雑木林へ
絞首刑〜VSライダー
OPTIONS
令呪を使う
残った左手で応戦する
右手に刺さった”釘”を抜けば
END


  scenes :s1016, <<END
VSライダー
蜘蛛の虜
END

  route :s1016 => :tiger17
  tiger 17

  scenes :s1017, <<OPTIONS, <<END, :s1018
5・VSライダー
応戦
5・雑木林〜遠坂邸
凛の治療
・凛の部屋
自然治癒の体
・凛の部屋
協力関係、成立
・帰宅
アーチャーの見送り。英雄の定義
・夕食
本日の夕食
・夜
セイバーに、凛と協力関係になったと報告
OPTIONS
断言はできない
そういう事になるな
END

  scenes :s1018, <<OPTIONS, <<END, :s1019
5・就寝
セイバー忠告
幕間
ある話
6・朝〜学校
慎二と美綴
6・放課後
結界探し〜凛による精神的いじめ
・放課後
マスター判明
・帰宅、夕食前
藤ねえの三分間ダッキング
OPTIONS
日が沈んで夕飯になる前に、藤ねえの悪行を止めておこう
日が沈んで夕飯になる前に、桜の様子を見てこよう
日が沈んで夕飯になる前に、セイバーに帰宅を報告しに行こう
END


  scenes :s1019, <<OPTIONS, <<END, :s1020
6・夕食前
強襲、お好み焼き丼阻止
6・夕食後、剣の稽古
平和な一時
・深夜
コーリング
幕間
セイバーVSアサシン
・柳洞寺境内
アーチャーVSキャスター
・柳洞寺境内
フォールダウン、ユアマインド
7・朝〜剣の稽古
セイバー〜不機嫌
・学校・昼休み
忍び寄るアクマの影
OPTIONS
あいつの狙いは俺だ。大人しく出て行こう
あいつの狙いは俺だ。死にたくないから黙っていよう
あいつの狙いは俺だ。分からないからとぼけよう
END


  scenes :s1020, <<OPTIONS, <<END, :s1021
7・昼休み
懸命な判断
・屋上
遠坂凛 (IV)
・結界発動
選択肢
OPTIONS
二人で慎二を捜す
令呪を使用してセイバーを呼ぶ
END

  scenes :s1021, <<OPTIONS, <<END, :s1022, :s1024
7・鮮血神殿
凛の忠告
7・鮮血神殿
凛と共に一階へ。ライダーの死、慎二の逃亡
・〜雑木林
遅れてきたアーチャー
・帰宅〜就寝
夜に想う
幕間
ある話
8・朝〜登校
凛さまご立腹
・昼休み・生徒会室
一成への疑惑は晴れたが？
OPTIONS
一応、話を聞いてみる
無駄だろうし、止めておこう
END

  scenes :s1022, <<END
8・生徒会室
ヒュプノス
END

  route :s1022 => :tiger18
  tiger 18

  scenes :s1023A, <<OPTIONS, <<END
VSライダー
奮戦
5・雑木林〜遠坂邸
凛の治療
・凛の部屋
自然治癒の体
・凛の部屋
協力関係、成立
・帰宅
アーチャーの見送り。英雄の定義
・夕食
本日の夕食
・夜
セイバーに、凛と協力関係になったと報告
OPTIONS
断言はできない
そういう事になるな
END

  scenes :s1024, <<OPTIONS, <<END, :flag11, :flag12, :flag13
8・生徒会室
深追い厳禁
幕間
この敗者に今一度の祝福を
・放課後
選択肢
OPTIONS
桜が気にかかる。間桐邸に行ってみよう
そうだ、遠坂に連絡しなくては
今日は肉の特売日。ご馳走にしてセイバーを喜ばせよう
END

  flag 11
  flag 12
  flag 13

  route :flag11 => :s1067
  route :flag12 => :s1025
  route :flag13 => :s1065

  scenes :s1067, <<END
8・放課後〜間桐邸
あやしい二人
END
  route :s1067 => :s1066

  scenes :s1025, <<END
8・放課後〜帰宅
電話で連絡
END
  route :s1025 => :s1066

  scenes :s1065, <<END
8・放課後〜商店街
おかしなメイド
END
  route :s1065 => :s1066

  scenes :s1066, <<OPTIONS, <<END, :s1026A
・夕食〜就寝
その理由
幕間
ある騎士の物語
9・朝〜放課後
柳洞寺に済む、もう一人の人物
・夜、集合〜決行
葛木先生にガンドを撃つ凛
OPTIONS
やっぱり危険だ。遠坂を止める
今はそれしかない
END

  scenes :s1026A, <<OPTIONS, <<END, :s1027, :s1028A
9・夜・奇襲
止める
・奇襲
キャスター出現。セイバーの一閃
幕間
毒蛇百芸
・奇襲
セイバー、破れる
OPTIONS
セイバーの助けに入る
遠坂を守りきる
END

  scenes :s1027, <<END
9・奇襲
殺人鬼
END

  route :s1027 => :tiger19
  tiger 19

  scenes :s1028A, <<OPTIONS, <<END, :s1029, :s1037, :s1061
9・奇襲
応戦、投影魔術
9・夜・交差点
作戦失敗。凛の疑惑
9・就寝
リバウンド
幕間
ナピシュツムの末
10・起床〜学校〜帰宅
麻痺した半身
・午後
リン・ストライクバック!
・夕食前
藤ねえVS凛
OPTIONS
いや、遠坂と話をつけないと
道場でセイバーと話をつけよう
寒いのでパス。ミカンミカンミカン
END

  scenes :s1029, <<END
10・夜
凛と投影魔術の話
END

  flag 5
  flag 6
  flag 7

  route :s1029 => :flag5
  route :flag5 => :s1052

  scenes :s1037, <<END
10・夜・道場
セイバーの好き嫌い。ワイルドワイルドイングランド
END

  route :s1037 => :flag6
  route :flag6 => :s1052

  scenes :s1061, <<END
10・夜・今
どっちが好きなの？
END
  route :s1061 => :flag7
  route :flag7 => :s1052

  scenes :s1052, <<OPTIONS, <<END, :s1030, :s1036
・夜・縁側
遠坂凛 (V) 〜士郎の瑕
・就寝〜土蔵
夜の鍛錬〜アーチャーの警告
11・早朝
食パン消失事件
OPTIONS
パンがないのは今朝は和風で。というか犯人をとっちめに行く
パンの使い道はあえて不問。ジョギングがてらに商店街へ
END

  scenes :s1030, <<OPTIONS, <<END, :s1035, :s1031
11・早朝・離れ
犯人はオマエ
OPTIONS
中の様子を見る
ま、遠坂なら大丈夫だろう
END

  scenes :s1031, <<END
11・〜商店街へ
ライフシグナル大回灯
・朝食
犯人逮捕
・朝
デートに行こう
・新都
スペシャル？
・午後・帰宅
キャスター襲来
END

  scenes :s1032, <<END
拒否
ディストレーション (III)〜ルールブレーカー
11・逃走〜遠坂邸へ
戦線離脱
幕間
遠坂凛 (VI)
・夜・ビル屋上
ディスタンス
幕間
魔女の思惑
・帰宅〜自室
戦う理由
幕間
聖女陵辱
END

  edge :s1032, :s1059, '※3'

  node :n1, label:''

  edge :s1032, :n1, '※4'
  route :n1 => :s1060
  edge :n1, :s1059, '※13&※6'


  scenes :s1059, <<END
12・戦いへ
情報源
END

  route :s1059 => :s1038

  scenes :s1038, <<OPTIONS, <<END, :s1033, :s1033, :s1033
12・教会
バッドラック
OPTIONS
逃げる
戦う
隙を見つける
END

#  edge :s1038opt_s1033, label:'1,2,3'

  scenes :s1033, <<END
12・教会〜掌
人工宝具
END

  tiger 21
  route :s1033 => :tiger21


  scenes :s1034, <<END
11・カプセル
朧
END

  tiger 20
  route :s1034 => :tiger20

  scenes :s1060, <<OPTIONS, <<END, :s1039, :s1038
12・戦いへ
選択肢
OPTIONS
遠坂と合流する
教会へ相談に行く
END


  scenes :s1035, <<END
11・凛の客間
グッドモーニング？
・朝
デートに行こう
・新都
スペシャル？
・午後・帰宅
キャスター襲来
END

  scenes :s1036, <<OPTIONS, <<END, :s1032, :s1034
11・早朝〜
深山町最速伝説
・朝食
犯人逮捕
・朝
デートに行こう
・新都
スペシャル？
・午後・帰宅
キャスター襲来
OPTIONS
断る
従う
END

  scenes :s1039, <<OPTIONS, <<END, :s1040, :s1041
12・新都へ
囮探索
幕間
無限の
・夜〜教会地下
退治する凛とキャスター
OPTIONS
いける。今ならキャスターに隙を作れる
まだだ。そんな安易な真似はできない
END

  scenes :s1040, <<END
12・教会地下
剣と魔術
END

  tiger 22
  route :s1040 => :tiger22

  scenes :s1041, <<OPTIONS, <<END, :s1042
12・対峙
アーチャーの裏切り
OPTIONS
助けない
助ける
END

  scenes :s1042, <<OPTIONS, <<END, :s1043
12・対峙
肉体反抗
・対峙
決死の投影〜生還
・夜の外人墓地
遠坂凛 (VII)
・帰宅〜夕食
暖かな夕食
・作戦会議
打開策、ある？
OPTIONS
そんなものはない。正面突破、これあるのみ
正面突破は却下だ。教会に抜け道とかある？
俺たちだけでは無理だ。他のマスターと協力する。
END


  scenes :s1043, <<OPTIONS, <<END, :s1044, :s1045
凛の笑顔
怖いタイプ
12・〜仮眠
方針決定、睡眠
幕間
王女メディア
13・目覚め〜森へ
冬の森、大魔神かなり怒る
十三日目
アインツベルン城侵入
13・アインツベルン城
ギルガメッシュVSバーサーカー
OPTIONS
自分を押し留める
男を止める
END

  scenes :s1044, <<END
決断
イリヤの死
アインツベルン城
傀儡の主
END

  route :s1044 => :s1053
  scenes :s1053, <<END
13・夜〜教会へ
或る結末
END

  tiger 23
  route  :s1053 => :tiger23


  scenes :s1045, <<OPTIONS, <<END, :s1046, nil, :s1053
決断
ディトレーション (IV)
幕間
冬の森
アインツベルン城
傀儡の主
アインツベルン城
君の歪み
アインツベルン城・洛陽
ランサーの提案
OPTIONS
いいだろう
構わないが、一つ条件がある
断る
END

  scenes :s1046, <<OPTIONS, <<END, :s1047
共闘提案
快諾
13・夜〜教会へ
夜を越えて
14・夜明け〜教会
戦闘開始
・教会地下聖堂
対決
幕間
必中の槍、無敗の盾
対決
凛の奇策
対決、決着
選択肢
OPTIONS
止められるのなら、止めてはいけないのか
止めて、どうする
END

  scenes :s1047, <<OPTIONS, <<END, :flag8, :flag9, :flag10
選択
理想
14・教会地下聖堂
リアリティ・マーブル
・〜教会外へ
セイバーと共に帰還
幕間
囚われの姫
14・深夜〜
断罪の場へ
幕間
オリジナル&amp;フェイク
15・夜明け〜アインツベルン城
『VS』
幕間
英雄の結末
決着
アンサー
アインツベルン城
倒すべき敵
幕間
矛盾聖杯
15・〜帰還・夜
最終決戦前
OPTIONS
遠坂と作戦を練る
セイバーの様子を見に道場へ
もう一度、よく考えてみる
END

  flag 8
  flag 9
  flag 10

  route :flag9 => :s1048

  scenes :s1048, <<END
最後の行動
セイバーとお茶を
END

  route :s1048 => :s1062

  scenes :s1063, <<END
最後の行動
凛に相談
END
  route :flag8 => :s1063
  route :s1063 => :s1062

  scenes :s1064, <<END
最後の行動
もう一度考える
END
  route :flag10 => :s1064
  route :s1064 => :s1062

  scenes :s1062, <<OPTIONS, <<END, :s1049, :s1050
15・夜
凛の提案 (致死量)
二人の選択
心と体
16・夜明け前
柳洞寺へ
幕間
厳流、無名
対峙
ギフト ”エンブリオ”
決戦
サーキット・オーバーロード
決戦
花鳥風月
決着
アンリミテッドブレードワークス
幕間
聖杯崩壊
幕間
夢の終わり
決着
ラスト・フライト
OPTIONS
こうなったら、せめて道連れに
冗談、簡単に諦められるか
END

  scenes :s1049, <<END
16・円冠回廊
ヘブンズフォール
END

  tiger 24
  route :s1049 => :tiger24

  scenes :s1050, <<END
夜明け
ステイ・アウェイ
END

  node :RinTrue, label: "凛ルート True End"
  node :RinGood, label: "凛ルート Good End"
  edge :s1050, :RinTrue, '※1'
  node :n0, label: ''
  edge :s1050, :n0, '※2'
  route :n0 => :RinTrue
  edge :n0, :RinGood, '※6&※9'

end
