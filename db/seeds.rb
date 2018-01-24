# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =============================================== Accounts ================================================================
user_0 = User.create(username: 'Goku', email: 'user0@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Z-Fighter", biography: "Main protagonist of Dragon Ball Z" , avatar: 'http://cdn.playbuzz.com/cdn/d0b128e9-841e-4a54-928c-094123202f85/cd0e575c-440c-45ea-bce8-5950ff1574a5.png')

user_1 = User.create(username: 'Vegeta', email: 'user1@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Saiyan Prince", biography: "Deuteragonist of Dragon Ball Z", avatar: 'https://static.comicvine.com/uploads/original/11130/111304459/5650015-vegeta_by_bardocksonic-d606hr0.png')

user_2 = User.create(username: 'Frieza' , email: 'user2@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Emperor", biography: "Emperor of Universe 7", avatar: 'https://vignette.wikia.nocookie.net/vsbattles/images/7/77/500px-2204548-frieza_final_form.png/revision/latest?cb=20141015231701')

user_3 = User.create(username: 'Cell' , email: 'user3@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Bio-Android", biography: "Ultimate creation of an evil scientist", avatar: 'https://vignette.wikia.nocookie.net/villains/images/6/60/Perfection.png/revision/latest?cb=20130929103157')

user_4 = User.create(username: 'Android 18' , email: 'user4@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Andriod", biography: "Eighteenth android creation of an evil scientist", avatar: 'https://vignette.wikia.nocookie.net/deathbattle/images/3/37/Android_18.png/revision/latest?cb=20170524174351')

user_5 = User.create(username: 'Majin Buu' , email: 'user5@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Agent of Destruction", biography: "Summoning of an evil wizard", avatar: 'https://vignette.wikia.nocookie.net/villains/images/1/17/Super_Buu.png/revision/latest?cb=20130727003604')

user_6 = User.create(username: 'Gohan' , email: 'user6@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Z-Fighter", biography: "Elder son of main protagonist", avatar: 'http://img06.deviantart.net/e27e/i/2017/123/c/d/ultimate_gohan___mystic_gohan_by_aashan-db7zz6v.png')

user_7 = User.create(username: 'Trunks' , email: 'user7@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Z-Fighter", biography: "Son of deuteragonist", avatar: 'https://pbs.twimg.com/profile_images/886786124043223041/y5tN-eTH.jpg')

user_8 = User.create(username: 'Android 19' , email: 'user8@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Andriod", biography: " Nineteenth android creation of an evil scientist", avatar: 'https://pm1.narvii.com/6331/e48e4b12345b6074850706bcc048f14ecad5da69_hq.jpg')



# ============================================== Tweets & Tags ===========================================================
# Goku
user_0.tweets.build(content: "I've never really thought as myself as a savior, I just want to fight strong opponents. But I can't just stand by and watch innocent people and animals suffer. That's what my grandpa taught me." + " #saviour").save_with_tags
user_0.tweets.build(content: "I am a Saiyan who was raised on Planet Earth and in the name of every single Saiyan that you've made suffer, for them and all the people of Planet Namek too, I will defeat you!" + " #Saiyan #Namek #Earth").save_with_tags

# Vegeta
user_1.tweets.build(content: "Fine, Kakarot, you are the mightiest Saiyan, I've admitted that much. At least for now. But don't you dare think that this is over. I won't let you keep me in second place forever, feeding on the scraps of your glory. I will surpass you, and even then I'll keep pushing, I'll surpass every single warrior in the Universe. I won't stop until I'm the ultimate number one." + " #Saiyan #Universe #Kakarot").save_with_tags
user_1.tweets.build(content: "There's no such thing as fair or unfair in battle. There is only victory, or in your case, defeat." + " #victory #defeat").save_with_tags


# Frieza
user_2.tweets.build(content: "Despite all my heinous provocations on Namek, Goku still couldn't will himself to destroy me. He's a noble man of great moral clarity. So pure, he makes me want to vomit!" + " #Namek #Goku").save_with_tags
user_2.tweets.build(content: "I doubt I need an introduction, but just in case, I am the mighty Frieza, and yes, all the horrible stories you've heard are true."  + " #Frieza").save_with_tags

# Cell
user_3.tweets.build(content: "You see, I'm perfect, my strength is perfect, and with that I shall bring equally perfect destruction through the rest of the universe." + " #perfect #universe").save_with_tags
user_3.tweets.build(content: "You fool! Don't you realize yet you're up against the perfect weapon?!" + " #perfect").save_with_tags

# Android 18
user_4.tweets.build(content: "Whoever owns these clothes should have their optic sensors adjusted. They are obviously malfunctioning." + " #sensors").save_with_tags
user_4.tweets.build(content: "Now that you know you can't win I don't mind let you have the victory." + " #victory").save_with_tags

# Majin Buu
user_5.tweets.build(content: "I'm the terror of the universe." + " #universe").save_with_tags
user_5.tweets.build(content:  "I was promised a good fight. Produce the challenger. Which one of you is it? Don't be shy. Come forward. The time has arrived." + " #challenger").save_with_tags

# Gohan
user_6.tweets.build(content: "You killed my Dad. And Krillin too. And the others... Because of you, they're gone! I'm going to make you pay for what you did to them!!!" + " #Krillin #Dad").save_with_tags
user_6.tweets.build(content: "You stop hurting... MY DADDY!!!").save

# Trunks
user_7.tweets.build(content: "You hate the fact that you're powerless to stop me, that you're completely outmatched. Well, imagine feeling the way you do now, all of the time like the people of this planet do! Fools, how do you think my master Gohan felt when you ganged up on him in the rain, and HE had no way out? Well, now it's your turn. I hope you enjoy it!" + " #powerless #Gohan #fools").save_with_tags
user_7.tweets.build(content: "Gohan, why'd you have to do it, why'd you have to leave me? It's not fair! Oh gosh no... what did they do to you Gohan? You were my best friend, you were everything to me... everything! This just isn't fair! Gohan... Gohan... GOHAN!!!" + " #Gohan #friend").save_with_tags

# Android 19
user_8.tweets.build(content: "Do not try to escape. Yes, it is useless. Until I have all your energy, I will never let you go." + " #escape #useless #energy").save_with_tags
user_8.tweets.build(content: "You know some of my moves, but I know all of your moves Vegeta. Oh, yes, Dr. Gero studied you very thoroughly." + " #Vegeta #Dr.Gero").save_with_tags
