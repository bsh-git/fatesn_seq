# coding: utf-8
require "ScenarioGraph"

ScenarioGraph("fatesnseq1", true) do
  scenes :s0000, <<OPTIONS, <<END, :s2001, :s0001
1・十年前の回想〜朝
Rebirth
OPTIONS
桜の手伝いをしに行こう。
いつもの日課を住ませてしまおう。
END

  scenes :s0001, <<END
一日目・朝の鍛錬
道場風景
一日目・朝食
衛宮邸の朝
学校～放課後
日常 (I)
END


  route :s0001 => :c0002

  options :c0002, <<END
生徒会の手伝いをしよう。
アルバイトに行こう。
END

  edge :c0002, :s0002, 1
  edge :c0002, :s0085, 2

  scenes :s0002, <<END
一日目・放課後
高値の花 (誤字にあらず)
・夜の帰宅
白い少女
・夕食後
おつかれさまでした
END

  route :s0002 => :c0003

  options :c0003, <<END
桜を送っていく
藤ねえと遊ぶ。
大人しく休む。
END


  edge :c0003, :s0003, 3

  ## 3
  scenes :s0003, <<END
一日目・夜
更におつかれさまでした。
・就寝
鍛錬(魔術回路)
二日目・目覚め
衛宮邸の朝
END

  route :s0003 => :s0086

  scenes :s0086, <<END
・朝
道場風景
・学校
日常 (II)
・放課後
パイプライン
・放課後～アルバイト
遠坂凛 (I)
・夕食
恋のマジカルレンジャーフォース
三日目・目覚め～朝
焼きついたもの。
・朝～登校
不自然な痣。
END
  route :s0086 => :s0088

scenes :s0088, <<OPTIONS, <<END, :s0004, :s0005
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

  ## 1
  scenes :s0004, <<END
三日目・夜
令呪、一回目
END

  node :Rin, label:"凛ルート", shape:"oval"
  route :s0004 => :Rin

  scenes :s0005, <<END
三日目・マスター講座
遠坂凛 (II)
三日目・言峰協会
オルター・エゴ
END

  route :s0005 => :c0005

  options :c0005, <<END
刻印を破棄する。
戦う。
END

  edge :c0005, :s0006, 1
  ## 1
  scenes :s0006, <<END
帰らずの森
三日目・夜
END
  tiger 1
  route :s0006 => :tiger1

  edge :c0005, :s0007, 2

  ## 2
  scenes :s0007, <<END
三日目・言峰協会
決意
最強の敵
END

  route :s0007 => :c0006

  options :c0006, <<END, :s0008, :s0009
遠坂を連れて逃げる
セイバーを助ける
END

  ## 1
  scenes :s0008, <<END
三日目・深夜
少女狂想
END
  tiger 2
  route :s0008 => :tiger2

  ## 2
  scenes :s0009, <<END
三日目・ラスト
ディストレーション (I)
四日目・目覚め～自室
行動原理～遠坂凛 (III)
END

  route :s0009 => :c0007

  options :c0007, <<END, nil, nil, :s0010
まずは昨日の話から
それじゃあ真面目な話から
いやな予感がする。どっちも聞かない。
END

  ## 3
  scenes :s0010, <<END
四日目・凛の質問
勧誘お断り
・朝
凛の提案
END

  route :s0010 => :c0008

  options :c0008, <<END
分かった、手を組もう。
悪いが、組めない。
END

  edge :c0008, :s0011, 2

  scenes :s0011, <<OPTIONS, <<END2
・朝
ソロ&amp;オンリー
四日目・午後・学校
テレフォンマーダー藤
OPTIONS
このまま弓道場にいる。
生徒会室に移動する。
セイバーに学校案内をする。
END2

  edge :s0011opt, :s0012, 1
  scenes :s0012, <<END
四日目・弓道場
立射
END
  route :s0012 => :s0012b

  scenes :s0012b, <<OPTIONS, <<END2
・帰宅～夕食
藤ねえたちにセイバーを紹介～女の子同盟?
・就寝
魔術鍛錬
OPTIONS
セイバーの様子を見に行こう
桜の手伝いをしに行こう
藤ねえを起こしに行こう
END2

  edge :s0011opt, :s0014, 2
  scenes :s0014, <<END
四日目・生徒会室
是の呼吸
END

  route :s0014 => :s0012b


  edge :s0012bopt, :s0013, 1
  ## 1
  scenes :s0013, <<END
五日目・朝
セイバーの様子を見る
END

  route :s0013 => :s0013b

  edge :s0012bopt, :s0016, 2
  ## 2
  scenes :s0016, <<END
五日目・朝
桜と朝食の支度
END

  route :s0016 => :s0013b

  edge :s0012bopt, :s0017, 3
  ## 3
  scenes :s0017, <<END
五日目・朝
藤ねえ地獄車
END

  route :s0017 => :s0013b

  scenes :s0013b, <<END
・朝食～登校
日常 II
・学校
誇りの代償
・放課後
テクスチャー
END

  tiger 16
  route :s0013b => :tiger16


  edge :c0008, :s0018, 1
  ## 1
  scenes :s0018, <<OPTIONS, <<END2
四日目・朝
契約成立
・午前
セイバー (I)
OPTIONS
セイバーは何処の英雄なのか?
体は大丈夫なのか?
その服、どうしたのさ。
END2

  edge :s0018opt, :s0019, 1
  ## 1
  scenes :s0019, <<OPTIONS, <<END2
四日目・午後
セイバーの事情
・夕食
仲良しセイバー、仲良し凛
・夜
マスター適正、低めでしょうか?
・就寝
霧中の星
五日目・朝
薔薇と紫陽花
五日目・朝食～登校
わくわく藤ねえランド～間桐の兄妹
五日目・昼休み
選択肢
OPTIONS
遠坂との待ち合わせ場所へ
桜に、きちんと説明する
END2

  edge :s0019opt, :s0020, 1
  ## 1
  scenes :s0020, <<OPTIONS, <<END2
五日目・昼休み
遠坂凛 (IV)
・下校～夕方
セイバーへの質問
OPTIONS
ランサーについて
アーチャーについて
バーサーカーについて
END2

  edge :s0020opt, :s0021,1
  ## 1
  scenes :s0021, <<OPTIONS, <<END2
五日目・質問
サバイバー
五日目・夕食
君も一緒に
・夕食～就寝
激突、ライオン対トラ
六日目・朝食～登校
衛宮家の朝・お祭り編
・学校～間桐邸
第四のマスター
慎二の誘い、決裂
選択肢
OPTIONS
ライダーに話かける
危うきに近寄らず
END2

  edge :s0021opt, :s0022, 1
  ## 1
  scenes :s0022, <<OPTIONS, <<END2
六日目・間桐邸帰り
鮮血淑女
・帰宅～夕食
みんな仲良く
・夜
作戦会議。柳洞寺に挑むべきか?
OPTIONS
戦う
戦わない
END2

  edge :s0022opt, :s0023, 1
  ## 1
  scenes :s0023, <<END
六日目・深夜～柳洞寺
ミッシング・アリアドネ
END
  tiger 3
  route :s0023 => :tiger3

  edge :s0022opt, :s0024, 2
  scenes :s0024, <<OPTIONS, <<END2
六日目・夜
戦闘拒否。二人の齟齬
幕間
月下流麗～VSアサシン
六日目・深夜
セイバー不在
幕間
「魔剣」～VSアサシン2
六日目・帰還～契約
ボーイ・ミーツ・ガール I
七日目・目覚め～朝
正義の見方といつもの朝食
・午前・剣の修行
ライフ・ガード
OPTIONS
戦う理由。聖杯を求める理由が知りたい。
サーヴァントになる前のセイバーを知りたい
切り札がほしい。必殺剣とか、いいね
END2

  edge :s0024opt, :s0025, 1
  scenes :s0025, <<OPTIONS, <<END2
七日目・セイバーとの会話
杯に注ぐもの
七日目・昼
冬の娘～イリヤ I
・帰宅～夕食前
士郎除き事件・序
・夕食後
遠坂先生の魔術講座。魔術刻印とは
・深夜～就寝
異なる者
八日目・朝～剣の修行
ライフガード&amp;セーフ
OPTIONS
サーヴァントになる前のセイバーを知りたい
サルでも分かる必殺剣
END2

  edge :s0025opt, :s0026, 1

  scenes :s0026, <<OPTIONS, <<END2
八日目・セイバーとの会話
英雄黙示譚
八日目・昼
商店街
OPTIONS
衛宮邸にまっすぐ帰る
公園に寄っていく
END2

  edge :s0026opt, :s0027, 2
  scenes :s0027, <<OPTIONS, <<END2
八日目・昼
冬の娘～イリヤ (II)
・午後
一成の見舞い～笑顔の種類
・夕食前
選択肢
OPTIONS
藤ねえ、おみやげは?
本気でパイを作らされかねない。しばらく退避しよう
林檎とかはいい。藤ねえ、蜜柑を食べるんだ
END2

  edge :s0027opt, :s0028, 2
  scenes :s0028, <<OPTIONS, <<END2
八日目・夕方
金色の湯浴み
八日目・夜
ベアナックラーリン
・夜
遠坂先生の魔術講座～スイッチ編
九日目・起床～朝食
侵食される食卓
・午前～午後
剣の稽古～凛の授業
OPTIONS
遠坂を呼びに行く
大人しく待つ
END2

  edge :s0028opt, :s0029, 1
  ## 1
  scenes :s0029, <<OPTIONS, <<END2
九日目・余談
ワークス
・午後
鮮血神殿～VSライダー (I)
OPTIONS
止まる必要などない
自分では防げない
END2

  edge :s0029opt, :s0030, 1
  ## 1
  scenes :s0030, <<OPTIONS, <<END2
VSライダー (I)
攻撃

スパークス
OPTIONS
倒される前に倒す
戦いになどならない
END2

  edge :s0030opt, :s0031, 2
  ## 2
  scenes :s0031, <<OPTIONS, <<END2
VSライダー (I)
フォールダウン、ユアマインド
OPTIONS
セイバーを召喚する
セイバーに助けて貰えば
ダメだ、令呪は消費できない
END2

  edge :s0031opt, :s0032,1
  scenes :s0032, <<OPTIONS, <<END2
VSライダー (I)
セイバー召喚
VSライダー (I)
クレイジー・トレイン
九日目・夜
ボーイ・ミーツ・ガール (II)
十日目・起床～朝
作戦会議
十日目・午後～十年前の回想
ポートレイト
VSライダー (II)
強襲
OPTIONS
ここで待機する
セイバーを追わなければ
END2

  edge :s0032opt, :s0033, 2
  scenes :s0033, <<OPTIONS, <<END2
VSライダー (II)
デス・サーカス
VSライダー (II)
約束された勝利の剣
OPTIONS
慎二を追う
セイバーに駆け寄る
END2

  edge :s0033opt, :s0034, 2
  scenes :s0034, <<OPTIONS, <<END2
十日目・夜
ボーイ・ミーツ・ガール (III)
・就寝
勝利の代償
十一日目・起床～外へ
王の記憶～残心
十一日目・朝の公園
白い呪眼～イリヤ(III)
OPTIONS
今は頷くしかない
それは出来ない
END2

  edge :s0034opt, :s0035, 2
  scenes :s0035, <<OPTIONS, <<END2
十一日目・アインツベルン城
拒絶と脱出
OPTIONS
こうなったら戦うだけだ。扉が開いた瞬間、先手を撃つ
戦える状態じゃない。椅子に座って、縛られたフリをしよう
あのベッドなどいかがなものか?
END2

  edge :s0035opt, :s0036, 1
  ## 1
  scenes :s0036, <<OPTIONS, <<END2
十一日目・アインツベルン城
小さな抵抗
十一日目・アインツベルン城ロビー
遠い背中
十一日目・アインツベルン城脱出
逃避行
十一日目・森の廃墟
ボーイ・ミーツ・ガール&amp;ガール
幕間・弓兵と狂戦士
十一日目・廃墟の夜明け
OPTIONS
セイバーが気にかかる
遠坂が気にかかる
END2

  edge :s0036opt, :s0037, 1

  ## 1
  scenes :s0037, <<OPTIONS, <<END2
廃墟の朝
ボーイ・ミーツ・ガール (IV)
VSバーサーカー
神話再生
OPTIONS
弓で援護を
それが何になる
END2

  edge :s0037opt, :s0038, 2
  ## 2
  scenes :s0038, <<OPTIONS, <<END2
VSバーサーカー
活路を見出す
VSバーサーカー
十二の試練
OPTIONS
それしか、ないのか
使うな
END2

  edge :s0038opt, :s0039, 2
  scenes :s0039, <<OPTIONS, <<END2
VSバーサーカー
And thus I pray, unlimited blade works
十二日目・起床～朝
王の記憶～おかしなセイバー
・朝食作り～衛宮邸会議
ハンバーグ争奪戦～セイバー凛イリヤ、朝食の大決戦
OPTIONS
イリヤを匿う
教会に預ける
END2

  edge :s0039opt, :s0040, 1
  scenes :s0040, <<OPTIONS, <<END2
十二日目・朝
セイバー、拗ねる
十二日目・午前～昼
剣の修行～やっぱりおかしなセイバー
OPTIONS
よし、昼食にしよう
けど、なんで今日に限って時間ピッタリなんだ?
だめでござる。今日は断食でござる
END2

  edge :s0040opt, :s0041, 1
  scenes :s0041, <<OPTIONS, <<END2
お昼の時間
素直に頷く
十二日目・昼食
ランチタイム
・午後
遠坂先生の魔術講座～仮免許
OPTIONS
投影魔術を詳しく聞く
疑問点、いち
沈黙は美徳
END2

  edge :s0041opt, :s0042, 1
  scenes :s0042, <<OPTIONS, <<END2
なぜなにクエスチョン
投影魔術について
・夕食～脱衣場
士郎除き事件・現行犯逮捕

セイバー (III)
十三日目・起床
王の記憶
・朝食
スイート
・剣の稽古～昼食
セイバー (IV)
・午後
遠坂先生の勘違い～セイバーの矛盾
・夜、聖杯の使い道について
セイバー (V) ～ VSキャスター
OPTIONS
キャスターはセイバーに任せ、ここで二人を守る
セイバーと二人で打って出る
END2

  edge :s0042opt, :s0043, 2
  scenes :s0043, <<OPTIONS, <<END2
VSキャスター
乱戦
OPTIONS
遠坂を信じる
セイバーにキャスターを任せる
END2

  edge :s0043opt, :s0044, 1
  scenes :s0044, <<OPTIONS, <<END2
VSキャスター
予感
OPTIONS
あの間合い、取った
だめだ、セイバー
END2

  edge :s0044opt, :s0045,2
  scenes :s0045, <<OPTIONS, <<END2
VSキャスター
第八のサーヴァント
十三日目・夜・会議
黄金の騎士～十年前の真実
・深夜～教会へ
Youre My Only Star
・深夜・凛の客間
ガールズエール
十四日目・朝～デート
ハリー・ゴー・ランド
・デート
ボーイ・ミーツ・ガール (V)
・デート
プレゼント
・帰宅
橋上の別れ
・夜～街へ
ラスト・ボーイ・ミーツ・ガール
遭遇
最古の王
VSギルガメッシュ
守りたいもの
OPTIONS
立ち上がる
立ち上がらない
END2

  edge :s0045opt, :s0046, 1
  scenes :s0046, <<OPTIONS, <<END2
VSギルガメッシュ
願い
十四日目・夜・自室
手に入れたもの
十四日目・夜・自室
いっときのユメ
十五日目・起床～教会へ
スパイラル・ラダー
OPTIONS
家に戻る
地下室に下りる
END2

  edge :s0046opt, :s0047, 2
  scenes :s0047, <<OPTIONS, <<END2
十五日目・教会地下
生存代償、因縁清算
幕間
セイバー、教会へ
十五日目・教会地下
ほほをつたう
幕間
葛藤
十五日目・教会地下
ゆずれぬとが
十五日目・外人墓地
輝ける星
・帰宅〜凛
選択肢
OPTIONS
それでもだ、遠坂
方法があるのか?
END2

  edge :s0047opt, :s0048, 1
  scenes :s0048, <<OPTIONS, <<END2
質問
頷く
十五日目・夜
決戦前
OPTIONS
セイバーとの時間にする
切嗣に報告する
作戦会議をする
END2

  edge :s0048opt, :s0049, 1
  edge :s0048opt, :s0091, 3
  ## 1
  scenes :s0049, <<END
十五日目・夜
最後の稽古
十五日目・決戦
聖杯成就
END
  tiger 14
  route :s0049 => :tiger14

  edge :s0047opt, :s0090, 2

  scenes :s0090, <<OPTIONS, <<END
質問
問い
十五日目・夜
決戦前
OPTIONS
セイバーとの時間にする
切嗣に報告する
作戦会議をする
END

  edge :s0090opt, :s0049, 1
  edge :s0090opt, :s0093, 2
  edge :s0090opt, :s0091, 3

  scenes :s0091, <<OPTIONS, <<END
十五日目・土蔵内
作戦会議
OPTIONS
武器を探す
セイバーを強化する
鞘をセイバーに返す
END

  edge :s0091opt, :s0092, 3

  scenes :s0092, <<END
十五日目・夜
聖剣返還
フェイト/ステイナイト (I)

フェイト/ステイナイト (II)

黄金の別離
END

  node :SaberEnd, label:"セイバールート End", shape:"oval"
  route :s0092 => :SaberEnd

  ## 1
  scenes :s0093, <<END
十五日目・夜
決意
十五日目・決戦
聖杯成就
END

  route :s0093 => :tiger14


  edge :s0024opt, :s0050, 3

  scenes :s0050, <<OPTIONS, <<END2
七日目・セイバーとの会話
セイバーさんご立腹
七日目・昼
冬の娘～イリヤ I
・帰宅～夕食前
士郎除き事件・序
・夕食後
遠坂先生の魔術講座。魔術刻印とは
・深夜～就寝
異なる者
八日目・朝～剣の修行
ライフガード&amp;セーフ
OPTIONS
戦う理由。聖杯を求める理由が知りたい。
サーヴァントになる前のセイバーを知りたい
END2

  edge :s0050opt, :s0051, 1
  scenes :s0051, <<OPTIONS, <<END2
八日目・セイバーとの会話
杯に注ぐもの
・昼
商店街
OPTIONS
衛宮邸にまっすぐ帰る
公園に寄っていく
END2

  edge :s0051opt, :s0052, 1
  scenes :s0052, <<OPTIONS, <<END2
八日目・昼食
背水セイバー
・午後
一成の見舞い～笑顔の種類

・夕食前
OPTIONS
藤ねえ、おみやげは?
本気でパイを作らされかねない。しばらく退避しよう
林檎とかはいい。藤ねえ、蜜柑を食べるんだ
END2

  edge :s0052opt, :s0053, 3
  scenes :s0053, <<OPTIONS, <<END2
八日目・夕方
 オレンジペコーの怪
八日目・夜
ベアナックラーリン
・夜
遠坂先生の魔術講座～スイッチ編
九日目・起床～朝食
侵食される食卓
・午前～午後
剣の稽古～凛の授業
OPTIONS
遠坂を呼びに行く
大人しく待つ
END2

  edge :s0053opt, :s0054, 1
  scenes :s0054, <<OPTIONS, <<END2
九日目・余談
ワークス
 ・午後
鮮血神殿～VSライダー (I)
OPTIONS
止まる必要などない
自分では防げない
END2

  edge :s0054opt, :s0055, 1
  scenes :s0055, <<OPTIONS, <<END2
VSライダー (I)
攻撃

スパークス
OPTIONS
倒される前に倒す
戦いになどならない
END2

  edge :s0055opt, :s0056, 1
  scenes :s0056, <<END
VSライダー (I)
メルティブラッド
END
  tiger 4
  route :s0056 => :tiger4

  edge :s0055opt, :s0057, 2
  scenes :s0057, <<OPTIONS, <<END2
VSライダー (I)
フォールダウン、ユアマインド
OPTIONS
セイバーを召喚する
セイバーに助けて貰えば
ダメだ、令呪は消費できない
END2

  edge :s0057opt, :s0058, 3
  scenes :s0058, <<END
---
---
END
  tiger 5
  route :s0058 => :tiger5

  edge :s0057opt, :s0059, 2
  ## 2
  scenes :s0059, <<OPTIONS, <<END2
VSライダー (I)
召喚と救出
VSライダー (I)
クレイジー・トレイン
九日目・夜
ボーイ・ミーツ・ガール (II)
十日目・起床～朝
作戦会議
十日目・午後～十年前の回想
ポートレイト
VSライダー (II)
強襲
OPTIONS
ここで待機する
セイバーを追わなければ
END2

  edge :s0059opt, :s0060, 1
  ## 1
  scenes :s0060, <<END
十日目～朝
くるみ割り人形
END
  tiger 6
  route :s0060 => :tiger6

  edge :s0059opt, :s0061, 2
  scenes :s0061, <<OPTIONS, <<END2
VSライダー (II)
デス・サーカス
OPTIONS
慎二を追う
セイバーに駆け寄る
END2

  edge :s0061opt, :s0062, 1
  scenes :s0062, <<OPTIONS, <<END2
十日目・夜
惨劇の後
十日目・就寝
勝利の代償
十一日目・起床～外へ
王の記憶～残心
十一日目・朝の公園
白い呪眼～イリヤ(III)
OPTIONS
今は頷くしかない
それは出来ない
END2

  edge :s0062opt, :s0063, 1
  scenes :s0063, <<END
十一日目・アインツベルン城
天のドレス
END
  tiger 7
  route :s0063 => :tiger7

  edge :s0062opt, :s0064, 2
  scenes :s0064, <<OPTIONS, <<END2
十一日目・アインツベルン城
拒絶と脱出
OPTIONS
こうなったら戦うだけだ。扉が開いた瞬間、先手を撃つ
戦える状態じゃない。椅子に座って、縛られたフリをしよう
あのベッドなどいかがなものか?
END2

  edge :s0064opt, :s0065, 3
  scenes :s0065, <<OPTIONS, <<END2
十一日目・アインツベルン城
ぬいぐるみ部屋殺人事件
十一日目・アインツベルン城ロビー
遠い背中
十一日目・アインツベルン城脱出
逃避行
十一日目・森の廃墟
ボーイ・ミーツ・ガール&amp;ガール
幕間・弓兵と狂戦士
十一日目・廃墟の夜明け
OPTIONS
セイバーが気にかかる
遠坂が気にかかる
END2

  edge :s0065opt, :s0066, 1
  scenes :s0066, <<OPTIONS, <<END2
廃墟の朝
ボーイ・ミーツ・ガール (IV)
VSバーサーカー
神話再生
OPTIONS
弓で援護を
それが何になる
END2

  edge :s0066opt, :s0067, 1
  ## 1
  scenes :s0067, <<OPTIONS, <<END2
VSバーサーカー
小さな抵抗
VSバーサーカー
十二の試練
OPTIONS
それしか、ないのか
使うな
END2

  edge :s0067opt, :s0068, 1
  scenes :s0068, <<END
VSバーサーカー
明けない夜
END

  tiger 8
  route :s0068 => :tiger8

  edge :s0065opt, :s0069, 2
  scenes :s0069, <<OPTIONS, <<END2
廃墟の朝
ごーるど・らっしゅ
VSバーサーカー
神話再生
OPTIONS
弓で援護を
それが何になる
END2

  edge :s0069opt, :s0070, 2
  scenes :s0070, <<OPTIONS, <<END2
VSバーサーカー
活路を見出す
VSバーサーカー
十二の試練
OPTIONS
それしか、ないのか
使うな
END2

  edge :s0070opt, :s0071, 2
  scenes :s0071, <<OPTIONS, <<END2
VSバーサーカー
And thus I pray, unlimited blade works
十二日目・起床～朝
王の記憶～おかしなセイバー
・朝食作り～衛宮邸会議
ハンバーグ争奪戦～セイバー凛イリヤ、朝食の大決戦
OPTIONS
イリヤを匿う
教会に預ける
END2

  edge :s0071opt, :s0072, 2
  scenes :s0072, <<OPTIONS, <<END
十二日目・朝
イリヤ、拗ねる
十二日目・午前～昼
剣の修行～やっぱりおかしなセイバー
OPTIONS
よし、昼食にしよう
けど、なんで今日に限って時間ピッタリなんだ?
だめでござる。今日は断食でござる
END

  edge :s0072opt, :s0073, 3
  ## 3
  scenes :s0073, <<OPTIONS, <<END
お昼の時間
闘将ハングリーハート
十二日目・昼食
ランチタイム
・午後
遠坂先生の魔術講座～仮免許
OPTIONS
投影魔術を詳しく聞く
疑問点、いち
沈黙は美徳
END

  edge :s0073opt, :s0074, 2
  scenes :s0074, <<OPTIONS, <<END
なぜなにクエスチョン
頑丈なんだ
十二日目・凛の客間
セイバー (II)
・夕食～脱衣場
士郎除き事件・現行犯逮捕

セイバー (III)
十三日目・起床
王の記憶
・朝食
スイート
・剣の稽古～昼食
セイバー (IV)
・午後
遠坂先生の勘違い～セイバーの矛盾
・夜、聖杯の使い道について
セイバー (V) ～ VSキャスター
OPTIONS
キャスターはセイバーに任せ、ここで二人を守る
セイバーと二人で打って出る
END

  edge :s0074opt, :s0075, 1
  scenes :s0075, <<END
VSキャスター
ワルプルギスの夜
END
  tiger 9
  route :s0075 => :tiger9

  edge :s0074opt, :s0076, 2
  scenes :s0076, <<OPTIONS, <<END
VSキャスター
乱戦
OPTIONS
遠坂を信じる
セイバーにキャスターを任せる
END

  edge :s0076opt, :s0075, 2
#  edge :s0076opt, :s0077, 2
#  scenes :s0077, <<END
#VSキャスター
#ワルプルギスの夜
#END
#  tiger 9
#  route :s0077 => :tiger9

  edge :s0076opt, :s0078, 1
  scenes :s0078, <<OPTIONS, <<END
VSキャスター
予感
OPTIONS
あの間合い、取った
だめだ、セイバー
END

  edge :s0078opt, :s0079, 1
  scenes :s0079, <<END
VSキャスター
魔女の烙印
END
  tiger 10
  route :s0079 => :tiger10

  edge :s0078opt, :s0080, 2
  scenes :s0080, <<OPTIONS, <<END
VSキャスター
第八のサーヴァント
十三日目・夜・会議
黄金の騎士～十年前の真実
・深夜～教会へ
Youre My Only Star
・深夜・凛の客間
ガールズエール
十四日目・朝～デート
ハリー・ゴー・ランド
・デート
ボーイ・ミーツ・ガール (V)
・デート
プレゼント
・帰宅
橋上の別れ
・夜～街へ
ラスト・ボーイ・ミーツ・ガール
遭遇
最古の王
VSギルガメッシュ
守りたいもの
OPTIONS
立ち上がる
立ち上がらない
END

  edge :s0080opt, :s0081, 2
  scenes :s0081, <<END
---
---
END
  tiger 11
  route :s0081 => :tiger11

  edge :s0080opt, :s0082, 1

  scenes :s0082, <<OPTIONS, <<END
VSギルガメッシュ
願い
十四日目・夜・自室
手に入れたもの
十四日目・夜・自室
いっときのユメ
十五日目・起床～教会へ
スパイラル・ラダー
OPTIONS
家に戻る
地下室に下りる
END

  edge :s0082opt, :s0083, 1
  scenes :s0083, <<END
十五日目・午前
タイムリミット
END
  tiger 12
  route :s0083 => :tiger12

  edge :s0082opt, :s0084, 2
  scenes :s0084, <<END
十五日目・教会地下
生存代償、因縁清算
幕間
セイバー、教会へ
十五日目・教会地下
ほほをつたう
幕間
葛藤
END
  tiger 13
  route :s0084 => :tiger13

  scenes :s0085, <<END
1・放課後
ブラウニーチョコケーキ
・夜の帰宅
白い少女
・夕食後
おつかれさまでした
END

  # route :s0085 => :c0003   # XXX
  edge :s0085, :c0003,'要確認'


  scenes :s2001, <<OPTIONS, <<END, :s0002B
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

  route :s0002B => :c0003B
  copy :s0002, :s0002B
  copy :c0003, :c0003B, :s2002, nil, :s0003

  scenes :s2002, <<OPTIONS, <<END, :s0086, :s2003
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

  node :Sakura, label:"桜ルート", shape:"oval"

  scenes :s2003, <<OPTIONS, <<END, :s0087, :Sakura
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

  scenes :s0087, <<END
・放課後～アルバイト
遠坂凛 (I)
・夕食
恋のマジカルレンジャーフォース
三日目・目覚め～朝
焼きついたもの。
・朝～登校
悪化する痣
END

  route :s0087 => :s0088


#  save(:fatesnseq1, :png)
end
