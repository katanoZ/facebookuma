module Kuma
  require 'flickraw'

  Dotenv.load
  FlickRaw.api_key = ENV["FLICKER_API_KEY"]
  FlickRaw.shared_secret = ENV["FLICKER_API_SECRET"]

  def kuma_title
    kuma_titles01 = %W(くま クマ 熊 ベアー BEAR 球磨)
    kuma_titles02 = %W(人生 日和 生活 大会 会議 画像 戦争 ごはん 学校 ダンス 協会 集団 牧場 大回転 温泉 暴走 元気 体操 精神 パワー)
    kuma_titles03 = %W(くま くま？ くま！ くまー くまっ くまーーー くまʕ•ᴥ•ʔ くま(ᵔᴥᵔ) くま(￣(工)￣) くまฅʕ•ᴥ•ʔฅ)
    random = Random.new
    title = kuma_titles01[random.rand(kuma_titles01.length)] + kuma_titles02[random.rand(kuma_titles02.length)] + kuma_titles03[random.rand(kuma_titles03.length)]
    return title
  end

  def kuma_content
    kuma_contents01 = %W(この画像は この人は あなたは くま会議で くまも歩けば 今日も一日 今日は いつものように 今回は この日はずっと 見れば見るほど よい画像なので この画像を見て そういえば 実を言うと)
    kuma_contents02 = %W(たのしい ねむい おいしい おもしろい おそろしい かなしい うれしい おいしそう おなかがへった 踊りたい 食べたい 逃げたい 歌をうたう ダンスダンスダンス クマトルネード 冬眠する くまごはん 転がり続ける めでたい レッツ 毛皮が暑い ハングリー 満腹 熊野詣で 熊本県)
    kuma_contents03 = %W|くま くま？ くま！ くまー くまっ くまーーー くまʕ•ᴥ•ʔ くま(ᵔᴥᵔ) くま(￣(工)￣) くまままま・・・ くまくま！ く、くまー くまฅʕ•ᴥ•ʔฅ くまʕ´•ᴥ•`ʔ くまʕ￫ᴥ￩ʔ くまʕ•ɷ•ʔฅ くまʕ•̀ω•́ʔ✧ くまʕ·ᴥ·ʔ♡*:.✧ |
    random = Random.new
    content = kuma_contents01[random.rand(kuma_contents01.length)] + kuma_contents02[random.rand(kuma_contents02.length)] + kuma_contents03[random.rand(kuma_contents03.length)]
    return content
  end

  def kuma_image
  # tag:  検索タグ。
  # sort: ソート順。デフォルトは「date-posted-desc」。
  #       「relevance」は関連度の高さでソート。
  # per_page: 検索した時の取得件数。デフォルトは100件。

    word = "くま, クマ, 熊, bear" # 検索タグ
    random = Random.new
    images = flickr.photos.search(tags: word, sort: "relevance", per_page: 100, tag_mode: "all")
    image = images[random.rand(images.length)]
    url = FlickRaw.url image
    return url
  end
end
