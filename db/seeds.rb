vk_groups = [ { name: 'Комсомольская правда',  link: 'http://vk.com/public15722194' },
              { name: 'Без формата',           link: 'http://vk.com/moskvabezformata' },
              { name: 'Московский комсомолец', link: 'http://vk.com/mk_ru' },
              { name: 'Интер факс',            link: 'http://vk.com/interfaxru' },
              { name: 'ТАСС',                  link: 'http://vk.com/tassagency' },
              { name: 'Бравика',               link: 'http://vk.com/bravica_inc' },
              { name: 'Вечерняя Москва',       link: 'http://vk.com/vechermoskwa' },
              { name: 'РОСБАЛТ',               link: 'http://vk.com/rosbalt_ru' },
              { name: 'Mail Ru',               link: 'http://vk.com/nowosti_mail_ru' },
              { name: 'В Москве',              link: 'http://vk.com/newsmskcom'},
              { name: 'Российская газета',     link: 'http://vk.com/rgru'} ]

vk_groups.each { | vk_group | VkGroup.create name: vk_group[:name], link: vk_group[:link] }


sources = [ { url: 'http://www.kp.ru/',             vk_link: 'https://vk.com/public15722194',   title: 'Комсомольская правда' },
            { url: 'http://moskva.bezformata.ru/',  vk_link: 'https://vk.com/moskvabezformata', title: 'Без формата' },
            { url: 'http://www.mk.ru/',             vk_link: 'https://vk.com/mk_ru',            title: 'Московский комсомолец' },
            { url: 'http://www.interfax.ru/',       vk_link: 'https://vk.com/interfaxru',       title: 'Интер факс' },
            { url: 'http://tass.ru/',               vk_link: 'https://vk.com/tassagency',       title: 'ТАСС' },
            { url: 'http://www.bravica.info/ru/',   vk_link: 'https://vk.com/bravica_inc',      title: 'Бравика' },
            { url: 'http://vm.ru/',                 vk_link: 'https://vk.com/vechermoskwa',     title: 'Вечерняя Москва' },
            { url: 'http://www.rosbalt.ru/',        vk_link: 'https://vk.com/rosbalt_ru',       title: 'РОСБАЛТ' },
            { url: 'https://news.mail.ru/',         vk_link: 'https://vk.com/nowosti_mail_ru',  title: 'Mail Ru' },
            { url: 'http://www.newsmsk.com/',       vk_link: 'https://vk.com/newsmskcom',       title: 'В Москве' },
            { url: 'http://www.rg.ru/',             vk_link: 'https://vk.com/rgru',             title: 'Российская газета' } ]

sources.each { | source | ArticleSource.create url: source[:url], vk_link: source[:vk_link], title: source[:title] }

#@article = []

#@article << Article.create( url_title:     'http://red-news.ru/v-kolizee-vosstanovili-lift-dlia-dikih-zverei/',
#                            page_title:    'v-kolizee-vosstanovili-lift-dlia-dikih-zverei',
#                            article_title: 'В Колизее восстановили лифт для диких зверей',
#                            article_body:  'Немецкие археологи восстановили деревянный лифт, по которому в римский Колизей поднимали львов. После открытия дверцы звери выбегали на арену и нападали на гладиаторов. О реконструкции амфитеатра сообщает Daily Mail. Пользуясь исключительно древнеримскими технологиями, коллектив археологов и инженеров построил лифт, способный поднимать клетку грузоподъемностью в 300 килограммов на высоту 7,3 метра. Система блоков гарантирует, что дверцы в клетке и в стене амфитеатра открываются одновременно, выпуская животных на арену. Для поднятия лифта требовался труд восьми рабов, вращавших деревянный ворот. Зверей поднимали из гипогея — подвала, где содержались львы, тигры, кабаны и осужденные преступники. «В Колизее было установлено 28 лифтов — больше, чем в каком-либо другом амфитеатре античности. Согласно римским источникам, на арену одновременно выпускали до сотни львов», — рассказала директор Колизея Россела Реа (Rossela Rea). Реконструкция лифта обошлась в 20 миллионов евро, которые предоставила компания Providence Pictures, снявшая о работе археологов документальный фильм. В ходе съемок в клетку посадили волка, чтобы выпустить его затем на арену. «Это первое дикое животное, попавшее в Колизей за последние полторы тысячи лет. Конечно, нам бы хотелось выпустить льва, но из соображений безопасности это не получилось. Тогда мы остановились на волке — символе Рима», — рассказал продюсер фильма Гэри Глассмен (Gary Glassman). Известно, что диких зверей выпускали против гладиаторов. Однако факт травли волками и львами беззащитных христиан на арене Колизея многие историки считают недостоверным (благочестивой выдумкой агиографов более позднего времени).',
#                            source_url:    'http://red-news.ru/v-kolizee-vosstanovili-lift-dlia-dikih-zverei/',
#                            preview_url:   'http://red-news.ru/wp-content/uploads/2015/06/7146368ef030cf5eb394a44549f9b1b6.jpg' )

#@article << Article.create( url_title:     'http://red-news.ru/google-glass-pomogyt-slepym-orientirovatsia-v-gorode/',

#page_title:    'google-glass-pomogyt-slepym-orientirovatsia-v-gorode',
#                            article_title: 'Google Glass помогут слепым ориентироваться в городе',
#                            article_body:  'Американский стартап Aira разработал сервис, который помогает слепым или слабовидящим людям передвигаться по городу с помощью аудиоподсказок специально обученных ассистентов. Работа сервиса предусматривает использование очков дополненной реальности Google Glass, сообщается на сайте компании. Сейчас сервис находится на этапе бета-тестирования и станет доступен пользователям в первом квартале 2016 года. Для того, чтобы подключиться к обслуживанию Aira, необязательно быть обладателем собственной пары умных очков: их использование входит в стоимость ежемесячной подписки. Тарифы на обслуживание пока не называются. Надев очки, пользователь три раза прикасается к сенсору на дужке, запуская работу сервиса. В момент связи ассистенту доступно не только видео с очков, но и обновляемая в режиме реального времени информация о его местоположении, дорожном движении в этом районе, местах, которые могут быть необходимы пользователю на основании его предпочтений. Система собирает и хранит детальную информацию о пользователях: историю болезни, контакты доверенных лиц в экстренной ситуации, а также их предпочтения: любимые кафе, самые посещаемые места, хобби и привычки. Ассистентом для слепого или слабовидящего пользователя может быть близкий родственник, волонтер или сотрудник Aira. Контроль за уровнем их подготовки берет на себя сам стартап. По условиям контракта, помощником для слепого или слабовидящего человека может быть только тот, с кем пользователь знаком и чьим инструкциям доверяет. Создатели сервиса не уточняют, является ли Google Glass единственным носимым устройством, с которым совместимо ПО Aira. На рынке представлено сразу несколько моделей очков дополненной реальности. В мае свою разработку представил Microsoft, а чуть раньше — BMW и Sony. Активно развиваются проекты на основе Oculus Rift.',
#                            source_url:    'http://red-news.ru/google-glass-pomogyt-slepym-orientirovatsia-v-gorode/',
#                            preview_url:   'http://red-news.ru/wp-content/uploads/2015/06/911c6c52307d76ec336f05a26a14ca7f.jpg' )

#@article << Article.create( url_title:    'http://red-news.ru/izdatelstva-giganty-obvinili-v-zahvate-rynka-naychnoi-literatyry/',

#page_title:    'izdatelstva-giganty-obvinili-v-zahvate-rynka-naychnoi-literatyry',
#                          article_title: 'Издательства-гиганты обвинили в захвате рынка научной литературы',
#                           article_body:  'Новый проект автора платформеров из цикла Castlevania поставил рекорд по сумме средств, полученных с помощью сервиса общественных пожертвований Kickstarter на разработку видеоигры, передает The Verge. Геймеры собрали около 4,2 миллиона долларов, чтобы геймдизайнеры смогли выпустить новинку под названием Bloodstained. На счету у предыдущего рекордсмена — ролевой игры Torment: Tides of Numenera — 4,1 миллиона долларов. Первенство по собранным средствам среди всех игровых проектов, а не только тех, которые относятся к электронным развлечениям, по-прежнему удерживает карточная игра о взрывоопасных котах Exploding Kittens. К финалу завершившейся в феврале 2015 года кампании она набрала 8,7 миллиона долларов. Платформер Bloodstained: Ritual of the Night задуман как идейный преемник классических двухмерных Castlevania. Как и в упомянутых играх, основная роль в нем отводится исследованию мира, битвам с монстрами и упражнениям персонажей в акробатике. Новинка выйдет на PC, Xbox One, PS4, Wii U и карманной консоли PS Vita. Среди персонажей, за которых сможет играть пользователь — девушка Мириам, жертва алхимических экспериментов. Первый миллион долларов игра набрала всего за 14 часов после того, как страница с описанием будущего проекта появилась на Kickstarter.',
#                           source_url:    'http://red-news.ru/izdatelstva-giganty-obvinili-v-zahvate-rynka-naychnoi-literatyry/',
#                           preview_url:   'http://red-news.ru/wp-content/uploads/2015/06/e49faeda7d58d4a6ad7cedb168f720ca.jpg' )

#@article << Article.create( url_title:    'http://red-news.ru/igra-ot-avtora-castlevania-poctavila-rekord-po-sboram-na-kickstarter/',
#                           page_title:    'igra-ot-avtora-castlevania-poctavila-rekord-po-sboram-na-kickstarter',
#                           article_title: 'Игра от автора Castlevania поcтавила рекорд по сборам на Kickstarter',
#                           article_body:  'Новый проект автора платформеров из цикла Castlevania поставил рекорд по сумме средств, полученных с помощью сервиса общественных пожертвований Kickstarter на разработку видеоигры, передает The Verge. Геймеры собрали около 4,2 миллиона долларов, чтобы геймдизайнеры смогли выпустить новинку под названием Bloodstained. На счету у предыдущего рекордсмена — ролевой игры Torment: Tides of Numenera — 4,1 миллиона долларов. Первенство по собранным средствам среди всех игровых проектов, а не только тех, которые относятся к электронным развлечениям, по-прежнему удерживает карточная игра о взрывоопасных котах Exploding Kittens. К финалу завершившейся в феврале 2015 года кампании она набрала 8,7 миллиона долларов. Платформер Bloodstained: Ritual of the Night задуман как идейный преемник классических двухмерных Castlevania. Как и в упомянутых играх, основная роль в нем отводится исследованию мира, битвам с монстрами и упражнениям персонажей в акробатике. Новинка выйдет на PC, Xbox One, PS4, Wii U и карманной консоли PS Vita. Среди персонажей, за которых сможет играть пользователь — девушка Мириам, жертва алхимических экспериментов. Первый миллион долларов игра набрала всего за 14 часов после того, как страница с описанием будущего проекта появилась на Kickstarter.',
#                           source_url:    'http://red-news.ru/igra-ot-avtora-castlevania-poctavila-rekord-po-sboram-na-kickstarter/',
#                           preview_url:   'http://red-news.ru/wp-content/uploads/2015/06/5f8ac0a2684897ebcb6833311fe2f1d0.jpg' )

#@article << Article.create( url_title:    'http://red-news.ru/geimery-ekranizovali-grand-theft-auto/',
#                           page_title:    'geimery-ekranizovali-grand-theft-auto',
#                           article_title: 'Геймеры экранизовали Grand Theft Auto',
#                           article_body:  'Команда CorridorDigital сняла видеоролик по мотивам криминальных экшнов Grand Theft Auto, передает IGN. Запись разместили на официальном канале команды в сервисе YouTube. В нем воспроизводятся как декорации Grand Theft Auto, так и ракурсы, под которыми геймер видит происходящее, характерная походка и ужимки персонажей, а также типичные сцены. Оставлены даже традиционные игровые условности вроде пачек денег, которые выпадают из жертв героя. Дополнительно авторы опубликовали материалы со съемочной площадки, рассказав, как были проделаны различные трюки.',
#                           source_url:    'http://red-news.ru/"geimery-ekranizovali-grand-theft-auto"/',
#                           preview_url:   'http://red-news.ru/wp-content/uploads/2015/06/5631e39776155b91fe1bf4111af73fd9.jpg' )

#categories = { main:           'Главная',
#               news:           'Новости',
#               world:          'В мире',
#               russia:         'Россия',
#               social:         'Общество',
#               political:      'Политика',
#               business:       'Бизнес',
#               science:        'Наука и Техника',
#               sport:          'Спорт',
#               most_visited:   'Самые популярные',
#               most_readest:   'Самые читаемые',
#               most_discussed: 'Самые обсуждаемые' }
#categories.each do | en_name, ru_name |
#  Category.create( title: en_name, page_title: ru_name )
#end
#Category.all.map { |c| c.articles << Article.all  }
