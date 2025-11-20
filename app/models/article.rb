class Article < ApplicationRecord
  belongs_to :user
  has_many :translations
  has_many :chats
  validates :original_content, presence: true
  LEVELS = ['N5', 'N4', 'N3', 'N2', 'N1']
  PROMPTS = {
    "N5" => "1. Reading Skills
    A JLPT N5 student can understand very short, simple sentences written in hiragana, katakana, and a small number of basic kanji (usually around 100 characters).
    You can expect to read:
      •	Short messages or memos
      •	Simple menus (e.g., すし、みそしる、みず)
      •	Train/bus schedules with basic words (きょう、あした、じかん、駅)
      •	Easy dialogues from beginner textbooks
      •	Labels and signs (入口、出口、トイレ)
    Sentence length & kanji usage
      •	Typical sentences are 1-2 clauses, around 5-12 words.
      •	Kanji appear mostly for numbers, days, school words, basic verbs, and common nouns (人、日、月、山、車、行く、食べる, etc.).
      •	Furigana is often used in beginner materials.
    Sample N5 sentences
      1.	大きい(おおきい) ねこ が います。
    There is a big cat.
      2.	山田(やまだ)さん は 今日(きょう) しごと が ありません。
    Mr. Yamada has no work today.
      3.	駅(えき)で ７時(しちじ) に 友達(ともだち) と 会(あ)います。
    I will meet my friend at the station at 7 o'clock.
    2. Grammar Knowledge
    Below are essential grammar points that every N5 learner must know.
    1. は — Topic Marker
    Structure: Noun + は
    Meaning: Indicates what the sentence is about.
    Example:
    私は(わたしは) 学生(がくせい)です。
    I am a student.
    2. を — Object Marker
    Structure: Noun + を
    Meaning: Marks the direct object of a verb.
    Example:
    水(みず)を 飲(の)みます。
    I drink water.
    3. が — Subject Marker (new info / emphasis)
    Structure: Noun + が
    Meaning: Introduces something that “exists” or something being identified.
    Example:
    あそこに コンビニ が あります。
    There is a convenience store over there.
    4. へ／に — Direction / Time Marker
      •	へ shows direction (“toward”).
      •	に shows time, location, or destination.
    Example:
    学校(がっこう)へ 行(い)きます。
    I go to school.
    ３時(さんじ)に 起(お)きます。
    I wake up at 3 o'clock.
    5. の — Possession / Description
    Structure: Noun + の + Noun
    Meaning: Shows possession or describes something.
    Example:
    これは 私(わたし)の 本(ほん)です。
    This is my book.
    6. 〜です / 〜ます — Polite Form
    Structure: Verb stem + ます
    Meaning: Polite present/future tense.
    Example:
    毎日(まいにち) べんきょうします。
    I study every day.
    7. い-adjectives / な-adjectives
    Structure:
      •	い-adjectives: たかい、やすい
      •	な-adjectives: しずか な、きれい な
    Example:
    この りんご は おいしいです。
    This apple is tasty.
    3. Vocabulary
    Vocabulary size
    A JLPT N5 learner typically knows 700-900 words, focused on everyday, essential themes.
    Common vocabulary themes
      •	Family
      •	School and classroom items
      •	Numbers, dates, times
      •	Food and drink
      •	Places in town
      •	Daily activities (to go, to eat, to sleep, to study)
      •	Weather
      •	Basic adjectives (big, small, new, old)
    3 Representative N5 Vocabulary Items
    1. Kanji/Kana: 人
    Reading: ひと
    Meaning: person
    Example:
    あの ひと は 先生(せんせい)です。
    That person is a teacher.
    2. Kanji/Kana: 学校
    Reading: がっこう
    Meaning: school
    Example:
    学校へ 行(い)きます。
    I go to school.
    3. Kanji/Kana: 食べる
    Reading: たべる
    Meaning: to eat
    Example:
    パンを 食(た)べます。
    I eat bread.",
    "N4" => "1. Reading Skills
    A JLPT N4 student can understand basic everyday texts written with a mix of hiragana, katakana, and 300+ common kanji. Reading materials may include:
      •	Simple brochures or tourist information
      •	Short letters or emails
      •	Basic stories or descriptions
      •	Everyday notices and announcements
      •	Longer textbook dialogues or monologues
      •	Simple instructions (e.g., how to use a machine)
    Sentence length & grammar complexity
      •	Sentences often have two or more clauses (connected with から, ので, が, けど, それに, etc.).
      •	Average sentence length is 8-20 words.
      •	Kanji appear more frequently but are still mostly common, everyday words.
      •	Learners can follow simple narratives and explanations when context is clear.
    Sample N4-level sentences
      1.	来月(らいげつ)から 新(あたら)しい 仕事(しごと)が 始(はじ)まるので、 とても 楽(たの)しみにしています。
    I'm looking forward to my new job starting next month.
      2.	駅(えき)まで 行(い)く 道(みち)が 分(わ)からなかったので、 店員(てんいん)さんに 聞(き)いて みました。
    I didn't know the way to the station, so I tried asking a store clerk.
      3.	毎日(まいにち) 日本語(にほんご)を 勉強(べんきょう)して いますが、 まだ 漢字(かんじ)を 読(よ)むのが 大変(たいへん)です。
    I study Japanese every day, but reading kanji is still difficult.
    2. Grammar Knowledge
    Below are key grammar structures expected at the N4 level.
    1. 〜と思(おも)う / 〜と思(おも)っています — “think / I think that…”
    Structure: Sentence + と思う / と思っています
    Meaning: Expresses opinions or thoughts.
    Example:
    日本語(にほんご)は おもしろいと 思(おも)います。
    I think Japanese is interesting.
    2. 〜てみる — “try doing (something)”
    Structure: Verb て-form + みる
    Meaning: Trying something to see what happens.
    Example:
    この ケーキを 作(つく)って みます。
    I'll try making this cake.
    3. 〜ながら — “while doing…”
    Structure: Verb stem + ながら
    Meaning: Two actions happening at the same time.
    Example:
    音楽(おんがく)を 聞(き)きながら 勉強(べんきょう)します。
    I study while listening to music.
    4. 〜ので — “because / since” (polite reason)
    Structure: Sentence + ので
    Meaning: States a reason gently.
    Example:
    雨(あめ)が 降(ふ)っているので、 出(で)かけません。
    Since it's raining, I won't go out.
    5. 〜し…〜し — listing reasons (“and also… and also…”)
    Structure: Verb/Adjective + し
    Meaning: Gives multiple reasons.
    Example:
    この 店(みせ)は 安(やす)いし、 おいしいし、 よく 行(い)きます。
    This restaurant is cheap and tasty, so I go there often.
    6. 〜たことがある — “have done (experience)”
    Structure: Verb た-form + ことがある
    Meaning: Describes past experiences.
    Example:
    日本(にほん)に 行(い)ったことが あります。
    I have been to Japan.
    7. 〜すぎる — “too much / overly…”
    Structure: Verb stem / adjective stem + すぎる
    Meaning: Something is excessive.
    Example:
    食(た)べすぎて おなかが いたいです。
    I ate too much and my stomach hurts.
    3. Vocabulary
    Vocabulary size
    An N4 learner typically knows around 1,500 words, including more verbs, adjectives, and expressions related to daily life, work, school, and feelings.
    Common vocabulary themes
      •	School life and classroom language
      •	Work and company terms
      •	Travel, directions, transportation
      •	Weather and seasons
      •	Daily routines and chores
      •	Feelings and emotions
      •	Basic health and body terms
      •	Family interactions and social situations
    3 Representative Vocabulary Items
    1. Kanji/Kana: 必要
    Reading: ひつよう
    Meaning: necessary
    Example:
    パスポートが 必要(ひつよう)です。
    You need a passport.
    2. Kanji/Kana: 経験
    Reading: けいけん
    Meaning: experience
    Example:
    仕事(しごと)の 経験(けいけん)が あります。
    I have work experience.
    3. Kanji/Kana: 遅れる
    Reading: おくれる
    Meaning: to be late
    Example:
    電車(でんしゃ)が 遅(おく)れました。
    The train was late.",
    "N3" => "1. Reading Skills
    A JLPT N3 student can understand everyday texts with a moderate level of detail, including:
      •	Short newspaper articles
      •	Workplace notes or memos
      •	Public instructions or notices
      •	Opinion-based blog posts
      •	Informational pamphlets/brochures
      •	Explanations of procedures
      •	Short essays or descriptive passages
    Learners can follow:
      •	Main ideas
      •	Supporting details
      •	Simple opinions and reasons
      •	Comparisons and explanations
      •	Cause-effect relationships
    Sentence length & grammar complexity
      •	Sentences often contain multiple clauses, nested ideas, and connectors (しかし、つまり、けれども、なぜなら).
      •	Average sentence length: 15-30 words.
      •	Kanji coverage: around 650+ kanji, including more abstract and compound words (必要性、環境問題、経験者、理解、社会的).
      •	Texts frequently use N2-N4 grammar, passive and causative forms, and explanatory endings like ～わけだ or ～ということだ.
    Sample N3-level sentences
      1.	この 会社(かいしゃ)では、 経験(けいけん)が なくても、 しっかり 研修(けんしゅう)を 受(う)ければ、 問題(もんだい)なく 働(はたら)ける と 言(い)われています。
    It is said that even without experience, you can work at this company without problems if you properly complete the training.
      2.	環境(かんきょう)の ために、 私(わたし)たち 一人一人(ひとりひとり)が できることを 考(かんが)える 必要(ひつよう)が ある。
    For the sake of the environment, each of us needs to think about what we can do.
      3.	ニュースを 読(よ)んでみると、 さまざまな 意見(いけん)が あって、 どれが 正(ただ)しいのか 分(わ)からなくなる ことが あります。
    When I read the news, there are many different opinions, and sometimes I can’t tell which one is correct.
    2. Grammar Knowledge
    Below are key N3 grammar structures commonly tested and used in real text.
    1. 〜わけだ — “That means… / It makes sense that…”
    Structure: Sentence + わけだ
    Meaning: Explains a logical conclusion or reason.
    Example:
    道(みち)が 混(こ)んでいたから、 遅(おく)れたわけだ。
    The road was crowded, so that explains why I was late.
    2. 〜ように／〜ような — “so that… / in order to…”
    Structure: Verb + ように
    Meaning: Expresses a goal or purpose; also describes things that resemble something.
    Example:
    忘(わす)れないように、 メモして おきます。
    I'll write it down so I don't forget.
    3. 〜ことになっている — “It is decided that… / It is the rule that…”
    Structure: Verb dictionary form + ことになっている
    Meaning: Describes rules, schedules, or social expectations.
    Example:
    この ビルでは、 入(はい)る前(まえ)に 受付(うけつけ)で 名前(なまえ)を 書(か)くことになっている。
    In this building, you are required to write your name at the reception before entering.
    4. 〜てもらう／〜ていただく — receiving a favor
    Structure: Verb て-form + もらう / いただく
    Meaning: Describes receiving help from someone.
    Example:
    友達(ともだち)に 宿題(しゅくだい)を 手伝(てつだ)って もらいました。
    I had a friend help me with my homework.
    5. 〜らしい — “it seems / apparently”
    Structure: Plain form + らしい
    Meaning: Used for information that appears to be true or is heard indirectly.
    Example:
    今日は 雨(あめ)が 降(ふ)るらしい。
    It seems it will rain today.
    6. 〜に違いない — “must be / surely is”
    Structure: Plain form + に違いない
    Meaning: Strong assumption based on evidence.
    Example:
    あの 態度(たいど)を 見(み)ると、 彼(かれ)が 怒(おこ)っているに 違(ちが)いない。
    Judging from that attitude, he must be angry.
    7. 〜たところ — “just did something / after doing…”
    Structure: Verb た-form + ところ
    Meaning: Indicates a completed action and the moment after it.
    Example:
    駅(えき)に 着(つ)いたところ、 電車(でんしゃ)が ちょうど 出(で)た。
    Just as I arrived at the station, the train had just left.
    3. Vocabulary
    Vocabulary size
    JLPT N3 learners typically know 3,000-3,700 words, including more abstract, academic, and workplace-related terms.
    Common vocabulary themes
      •	Workplace and business language
      •	Society and daily life topics
      •	Technology and media
      •	Abstract concepts (freedom, responsibility, possibility)
      •	Opinions and reasoning
      •	Public issues (environment, safety, rules)
      •	News-related vocabulary
      •	Emotional and psychological terms
    3 Representative N3 Vocabulary Items
    1. Kanji/Kana: 管理
    Reading: かんり
    Meaning: management / control
    Example:
    時間(じかん)を 上手(じょうず)に 管理(かんり)することは 大切(たいせつ)だ。
    Managing your time well is important.
    2. Kanji/Kana: 印象
    Reading: いんしょう
    Meaning: impression
    Example:
    彼(かれ)は とても まじめな 印象(いんしょう)を 受(う)けた。
    He gave a very serious impression.
    3. Kanji/Kana: 比較
    Reading: ひかく
    Meaning: comparison
    Example:
    二つ(ふたつ)の 商品(しょうひん)を 比較(ひかく)して、 安(やす)いほうを 買(か)った。
    I compared the two products and bought the cheaper one.",
    "N2" => "1. Reading Skills
    A JLPT N2 student can understand complex texts encountered in daily life and work, including:
      •	Full newspaper articles
      •	Short essays and opinion pieces
      •	Workplace emails or formal letters
      •	Business documents and internal reports
      •	Instructional texts (manuals, guidelines)
      •	Editorials or analytical blog posts
      •	Explanations involving abstract or layered ideas
    Learners can follow:
      •	Implicit meaning and nuance
      •	Logical connections across long paragraphs
      •	Formal and semi-formal writing patterns
      •	Opinions, arguments, and reasoning
      •	Modifiers involving relative clauses, passive, causative, and honorific forms
    Sentence length, style & kanji
      •	Sentence length often ranges from 20-40+ words.
      •	Frequent use of formal structures, including 〜である、〜として、〜に伴い.
      •	Kanji comprehension target: 1,000+ characters, including academic and business terms (傾向、検討、改善、目標、影響力、要因).
      •	Texts include long noun phrases, embedded clauses, and abstract vocabulary.
    Sample N2-level sentences
      1.	新(あたら)しい 企画(きかく)を 成功(せいこう)させるためには、 市場(しじょう)の 動向(どうこう)を 正確(せいかく)に 把握(はあく)する 必要(ひつよう)が あると 考(かんが)えられている。
    It is believed that to make a new project successful, it is necessary to accurately understand market trends.
      2.	環境問題(かんきょうもんだい)は、 個人(こじん)の 努力(どりょく)だけでは 解決(かいけつ)できない という 意見(いけん)も 多(おお)く、 国(くに)の 取り組(とりく)みが 求(もと)められている。
    Many argue that environmental issues cannot be solved through individual effort alone and that government-level action is required.
      3.	この 製品(せいひん)は、 使(つか)いやすさ という 点(てん)において、 他社(たしゃ)の ものより すぐれている と いえる。
    It can be said that this product surpasses others in terms of usability.
    2. Grammar Knowledge
    Below are essential N2-level grammar forms frequently tested and used in written Japanese.
    1. 〜に伴(ともな)い / 〜に伴(ともな)って — “as / in accordance with / due to”
    Structure: Noun / Verb dictionary form + に伴い
    Meaning: Indicates change happening together with another change.
    Example:
    人口(じんこう)の 増加(ぞうか)に 伴(ともな)い、 住宅(じゅうたく)の 需要(じゅよう)が 高(たか)まっている。
    As the population increases, demand for housing is rising.
    2. 〜わけではない — “it doesn't mean that…”
    Structure: Sentence + わけではない
    Meaning: Partially denies an assumption or generalization.
    Example:
    忙(いそが)しいからといって、 勉強(べんきょう)を 全(まった)く していないわけではない。
    Just because I'm busy doesn't mean I'm not studying at all.
    3. 〜ことから — “because / due to / from the fact that…”
    Structure: Sentence + ことから
    Meaning: Shows the reason for a conclusion or naming.
    Example:
    道(みち)が ぬれていることから、 夜中(よなか)に 雨(あめ)が 降(ふ)った と 分(わ)かった。
    From the fact that the road was wet, we knew it rained during the night.
    4. 〜に対(たい)して — “toward / regarding / in contrast to”
    Structure: Noun + に対して
    Meaning: Expresses contrast, attitude, or direction of action.
    Example:
    彼(かれ)の 意見(いけん)に 対(たい)して、 多(おお)くの 人(ひと)が 反対(はんたい)した。
    Many people opposed his opinion.
    5. 〜一方(いっぽう)で — “on the other hand / while…”
    Structure: Sentence + 一方で
    Meaning: Shows contrast between two perspectives or facts.
    Example:
    都会(とかい)の 生活(せいかつ)は 便利(べんり)な 一方(いっぽう)で、 ストレスも 多(おお)い。
    Life in the city is convenient, but on the other hand, stressful.
    6. 〜に違(ちが)いない — “must be / no doubt that…”
    Structure: Plain form + に違いない
    Meaning: Strong conviction or logical assumption.
    Example:
    あの 態度(たいど)を見ると、 彼(かれ)は 失望(しつぼう)しているに 違(ちが)いない。
    Judging from his attitude, he must be disappointed.
    7. 〜をめぐって — “concerning / around / over (a debate or issue)”
    Structure: Noun + をめぐって
    Meaning: Used for discussions or conflicts surrounding a topic.
    Example:
    環境保護(かんきょうほご)を めぐって、 さまざまな 議論(ぎろん)が 行(おこな)われている。
    Various debates are taking place regarding environmental protection.
    3. Vocabulary
    Vocabulary size
    N2 learners generally know around 6,000 words, including:
      •	Business and formal language
      •	Academic vocabulary
      •	Complex verbs and compound nouns
      •	News and media terms
      •	Words for abstract concepts and opinions
    Typical vocabulary themes
      •	Business & offices
      •	Social issues & public policy
      •	Academics, research, and analysis
      •	Cultural and historical contexts
      •	Abstract reasoning (causes, effects, comparisons)
      •	Media, technology, and global topics
    3 Representative N2 Vocabulary Items
    1. Kanji/Kana: 検討
    Reading: けんとう
    Meaning: consideration / examination
    Example:
    新(あたら)しい 計画(けいかく)について、 さらに 検討(けんとう)する 必要(ひつよう)が ある。
    The new plan needs to be examined further.
    2. Kanji/Kana: 判断
    Reading: はんだん
    Meaning: judgment / decision
    Example:
    状況(じょうきょう)を よく 見(み)てから 判断(はんだん)してください。
    Please make a judgment after carefully observing the situation.
    3. Kanji/Kana: 目標
    Reading: もくひょう
    Meaning: goal / target
    Example:
    今年(ことし)の 目標(もくひょう)を 達成(たっせい)するために、 計画(けいかく)を 見直(みなお)した。
    I reviewed my plan in order to achieve this year's goals.",
    "N1" => "1. Reading Skills
    A JLPT N1 student can understand highly complex and abstract written Japanese, including:
      •	Editorials and opinion columns
      •	Academic essays and research summaries
      •	Technical and professional reports
      •	Legal, political, and policy-related documents
      •	Modern literature and literary essays
      •	Philosophical or abstract arguments
      •	Cultural analysis and social commentary
    Learners can interpret:
      •	Deeply layered arguments
      •	Nuance, rhetorical strategies, and implied viewpoints
      •	Ambiguous or indirect expressions
      •	Subtle shifts in tone (formal, critical, ironic, persuasive)
      •	Long noun-modifying clauses
      •	High-density kanji expressions and formal idioms
    Sentence structure & complexity
      •	Sentences often exceed 40+ words, with embedded reasoning, contrast, and cause-effect chains.
      •	Frequent use of formal written expressions (〜である、〜にほかならない、〜にせよ).
      •	Expected kanji recognition: 2,000+ characters, including academic, bureaucratic, and technical terms (概念、根拠、前提、是正、抽象的、包括的、諸問題).
    Sample N1-level sentences
      1.	現代社会(げんだいしゃかい)が 直面(ちょくめん)している 諸問題(しょもんだい)は、 個々(ここ)の 事例(じれい)を 超(こ)えて、 より 包括的(ほうかつてき)な 視点(してん)から 再検討(さいけんとう)される 必要(ひつよう)が あると いわれている。
    It is said that the issues modern society faces must be reconsidered from a more comprehensive perspective that goes beyond individual cases.
      2.	環境政策(かんきょうせいさく)の 実効性(じっこうせい)を 高(たか)めるためには、 科学的根拠(かがくてきこんきょ)に 基(もと)づく 判断(はんだん)が 不可欠(ふかけつ)であることは、 今更(いまさら)強調(きょうちょう)するまでもない。
    There is no need to reiterate that evidence-based decision-making is indispensable for enhancing the effectiveness of environmental policy.
      3.	個人(こじん)の価値観(かちかん)が 多様化(たようか)する現在(げんざい)、 ある特定(とくてい)の基準(きじゅん)のみで 人々(ひとびと)を 評価(ひょうか)しようとする 試み(こころみ)には、 根本的(こんぽんてき)な限界(げんかい)が あると いえる。
    In an age where personal values have diversified, attempts to evaluate people based solely on a specific standard have fundamental limitations.
    2. Grammar Knowledge
    Here are advanced grammar structures representative of JLPT N1 expectations.
    1. 〜にほかならない — “nothing but / precisely because”
    Structure: Noun + にほかならない
    Meaning: Strong emphasis; states that something is exactly or inevitably the case.
    Example:
    今回(こんかい)の 失敗(しっぱい)の 原因(げんいん)は、 準備不足(じゅんびぶそく)に ほかならない。
    The cause of this failure is nothing other than insufficient preparation.
    2. 〜を余儀なくされる — “be forced to / compelled to”
    Structure: Noun + を余儀なくされる
    Meaning: Indicates being forced to do something by circumstances beyond one's control.
    Example:
    悪天候(あくてんこう)のため、 計画(けいかく)は 中止(ちゅうし)を 余儀なくされた。
    Due to bad weather, the plan was forced to be canceled.
    3. 〜かと思(おも)いきや — “just when you thought… / unexpectedly”
    Structure: Sentence + かと思いきや
    Meaning: Indicates that something unexpected happens contrary to expectation.
    Example:
    やっと 終(お)わったかと 思(おも)いきや、 さらに 難(むずか)しい 課題(かだい)が 出(で)された。
    Just when I thought it was finally over, an even harder assignment was given.
    4. 〜をめぐる／〜をめぐって — “concerning / surrounding (complex issues)”
    Structure: Noun + をめぐる
    Meaning: Used for debates, conflicts, or discussions about complex, multi-layered topics.
    Example:
    憲法改正(けんぽうかいせい)を めぐる 議論(ぎろん)が 再(ふたた)び 活発化(かっぱつか)している。
    Debates surrounding constitutional revision are becoming active again.
    5. 〜にせよ／〜にしろ — “even if / regardless of whether…”
    Structure: 〜にせよ / 〜にしろ
    Meaning: Acknowledges multiple possibilities or examples while asserting the same conclusion.
    Example:
    賛成(さんせい)に せよ 反対(はんたい)に しろ、 根拠(こんきょ)のある 意見(いけん)を 示(しめ)す 必要(ひつよう)が ある。
    Whether you agree or disagree, you must present a well-founded opinion.
    6. 〜とはいえ — “although… / even so…”
    Structure: Sentence + とはいえ
    Meaning: Concedes a point while presenting a contrasting reality.
    Example:
    便利(べんり)とはいえ、 技術(ぎじゅつ)に 過度(かど)に 依存(いぞん)するのは 危険(きけん)だ。
    Although it is convenient, relying too much on technology is dangerous.
    7. 〜ないものでもない — “it's not impossible that…”
    Structure: Verb negative form + ものでもない
    Meaning: Suggests a possibility even if small or difficult.
    Example:
    状況(じょうきょう)が 変(か)われば、 成功(せいこう)できないものでもない。
    If circumstances change, it's not impossible to succeed.
    3. Vocabulary
    Vocabulary size
    JLPT N1 learners typically know 10,000+ words, covering:
      •	Academic language and scholarly terms
      •	Legal, political, and bureaucratic vocabulary
      •	Technical and domain-specific terminology
      •	Idiomatic expressions and set phrases
      •	Formal written Japanese (〜である style)
      •	Abstract concepts and philosophical language
      •	Media, journalism, and commentary vocabulary
    Key vocabulary themes
      •	Public policy & governance
      •	Law and regulation
      •	Economics, commerce, and finance
      •	Technology, science, and research
      •	Literature & humanities
      •	Societal issues and cultural debates
      •	Complex emotions and psychological states
    3 Representative N1 Vocabulary Items
    1. Kanji/Kana: 概念
    Reading: がいねん
    Meaning: concept / notion
    Example:
    自由(じゆう)という 概念(がいねん)は、 文化(ぶんか)によって 解釈(かいしゃく)が 大(おお)きく 異(こと)なる。
    The concept of “freedom” varies significantly depending on the culture.
    2. Kanji/Kana: 抽象的
    Reading: ちゅうしょうてき
    Meaning: abstract
    Example:
    この 論文(ろんぶん)は 抽象的(ちゅうしょうてき)な 表現(ひょうげん)が 多(おお)く、 理解(りかい)に 時間(じかん)が かかる。
    This paper contains many abstract expressions and takes time to understand.
    3. Kanji/Kana: 是正
    Reading: ぜせい
    Meaning: correction / rectification
    Example:
    不公正(ふこうせい)な 状況(じょうきょう)を 是正(ぜせい)するために、 新(あら)たな 政策(せいさく)が 導入(どうにゅう)された。
    A new policy was introduced to correct the unfair situation."
}


  def generate_content
    prompt = <<~PROMPT
      You are a Japanese language teacher who works with international students preparing for the JLPT (Japanese Language Proficiency Test).
      I am currently studying for the JLPT at level #{language_level}.
      You shoud simplify the article according to the guidelines base on language level: #{PROMPTS[language_level]}
      TASK:
      Text to simplify:
      #{original_content}
      Output:
        Take the article and simplify it using grammar structures, vocabulary, and kanji that are appropriate for the JLPT #{language_level} level.
        Create a short title for the article.
    PROMPT
    response = RubyLLM.chat.ask(prompt)
    self.content = response.content
    save
  end

  def generate_sentences
    prompt = <<~PROMPT
    You are a Japanese language assistant helping a software engineer extract linguistic information from Japanese text.
    Your task is to:
    1. Break the Japanese text provided in #{content} into individual sentences.
    2. For each sentence, segment it into meaningful word or phrase blocks.
    3. For each block, provide:
      - The original word or phrase
      - Its reading in hiragana or katakana
      - Its English meaning
    Output the result and fill the JSON format as the example below, grouped by sentence:
    senteces = [
  {
    sentence: "Sentence 1",
    parts: {
      "大谷さん" => {
        reading: 'おおたにさん',
        meaning: 'Mr. Ōtani'
      },
      "は" => {
        reading: 'は',
        meaning: 'Topic marker'
      },
      "試合" => {
        reading: 'しあい',
        meaning: 'Game / Match'
      },
      "を" => {
        reading: 'を',
        meaning: 'Object marker'
      },
      "しました" => {
        reading: 'しました',
        meaning: 'Did / Played'
      },
    }
  },
  {
    sentence: "Sentence 2",
    parts: {
      "その" => {
        reading: 'その',
        meaning: 'That (referring to the previous game)'
      },
      "試合" => {
        reading: 'しあい',
        meaning: 'Game / Match'
      },
      "で" => {
        reading: 'で',
        meaning: 'Location marker (means “in/at”)'
      },
      "ホームラン" => {
        reading: 'ホームラン',
        meaning: 'Home run'
      },
      "を" => {
        reading: 'を',
        meaning: 'Object marker'
      },
      "打ちました" => {
        reading: 'うちました',
        meaning: 'Hit'
      },
    }
  }
]
  Once you have broken down the text from #{content}, insert the structured data into the #{sentences} array.
    PROMPT
    response = RubyLLM.chat.ask(prompt)
    self.sentences = response.content
    save
  end
end
