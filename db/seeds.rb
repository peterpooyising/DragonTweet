# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# =============================================== Accounts ================================================================
default_user = User.create(username: 'Default User', email: 'defaultuser@gmail.com', password: 'defaultuser', password_confirmation: 'defaultuser')
default_user_2 = User.create(username: 'Default User 2', email: 'defaultuser2@example.com', password: 'password', password_confirmation: 'password')

# Dragonball Characters
user_0 = User.create(username: 'Goku', email: 'goku@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Z-Fighter", biography: "Main protagonist of Dragon Ball Z" , quote: "I am a Saiyan who was raised on Planet Earth and in the name of every single Saiyan that you've made suffer, for them and all the people of Planet Namek too, I will defeat you!", avatar: 'https://cdn.filestackcontent.com/mZVV2uNCQQ2RALyOoEBP')

user_1 = User.create(username: 'Vegeta', email: 'vegeta@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Saiyan Prince", biography: "Deuteragonist of Dragon Ball Z", quote: "There's no such thing as fair or unfair in battle. There is only victory, or in your case, defeat.", avatar: 'https://cdn.filestackcontent.com/Dcu0rnITIOjdWJRcxdNw')

user_2 = User.create(username: 'Frieza' , email: 'frieza@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Emperor", biography: "Emperor of Universe 7", quote: "I doubt I need an introduction, but just in case, I am the mighty Frieza, and yes, all the horrible stories you've heard are true.", avatar: 'https://cdn.filestackcontent.com/CjBNEMp1SH6hDLp3Nyj6')

user_3 = User.create(username: 'Cell' , email: 'cell@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Bio-Android", biography: "Ultimate creation of an evil scientist", quote: "You see, I'm perfect, my strength is perfect, and with that I shall bring equally perfect destruction through the rest of the universe.", avatar: 'https://cdn.filestackcontent.com/XPGTFhFR1KIaEqgTxA2Q')

user_4 = User.create(username: 'Android 18' , email: 'andriod18@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Andriod", biography: "Eighteenth android creation of an evil scientist", quote: "Whoever owns these clothes should have their optic sensors adjusted. They are obviously malfunctioning.", avatar: 'https://cdn.filestackcontent.com/W07Eo5cTQyyscxxvwxQn')

user_5 = User.create(username: 'Majin Buu' , email: 'majinbuu@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Agent of Destruction", biography: "Summoning of an evil wizard", quote: "I'm the terror of the universe.", avatar: 'https://cdn.filestackcontent.com/Hw92yCQTxm9j8ysPo5hq')

user_6 = User.create(username: 'Gohan' , email: 'gohan@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Z-Fighter", biography: "Elder son of main protagonist", quote: "You killed my Dad. And Krillin too. And the others... Because of you, they're gone! I'm going to make you pay for what you did to them!!!", avatar: 'https://cdn.filestackcontent.com/f1KPlLhfQOidvrqDvHPm')

user_7 = User.create(username: 'Trunks' , email: 'trunks@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Z-Fighter", biography: "Son of deuteragonist", quote: "You hate the fact that you're powerless to stop me, that you're completely outmatched. Well, imagine feeling the way you do now, all of the time like the people of this planet do! Fools, how do you think my master Gohan felt when you ganged up on him in the rain, and HE had no way out? Well, now it's your turn. I hope you enjoy it!", avatar: 'https://cdn.filestackcontent.com/hn9zaX0fSj7jo9KNtqlj')

user_8 = User.create(username: 'Android 19' , email: 'andriod19@example.com', password: 'password', password_confirmation: 'password', jobtitle: "Andriod", biography: " Nineteenth android creation of an evil scientist", quote: "Do not try to escape. Yes, it is useless. Until I have all your energy, I will never let you go.", avatar: 'https://cdn.filestackcontent.com/DQPXEYPPRy2Cr9ojirsI')

# =================================================== Note =================================================================
=begin
If you receive the error

    "rake aborted! ActiveRecord::RecordNotSaved: You cannot call create unless the parent is saved"

when running rake db:seed, it is most likely because the record isn't created due to VALIDATIONS in your MODEL(S). Example, TWEET MODEL has a validation of "validates: length: { maximum: 140 }" which prevented the tweet from being created because it exceeded the maximum length.
=end

# # ============================================== Tweets & Tags ===========================================================
# Goku
user_0.tweets.build(content: "I've never really thought as myself as a savior. But I just can't stand by and watch innocent people suffer." + " #saviour").save_with_tags
user_0.tweets.build(content: "I am a Saiyan who was raised on Earth and in the name of every single Saiyan that you've made suffer, I will defeat you!" + " #Saiyan #Earth").save_with_tags

# Vegeta
user_1.tweets.build(content: "I'll surpass every single warrior in the Universe. I won't stop until I'm the ultimate number one." + " #Universe").save_with_tags
user_1.tweets.build(content: "There's no such thing as fair or unfair in battle. There is only victory, or in your case, defeat." + " #victory #defeat").save_with_tags


# Frieza
user_2.tweets.build(content: "Goku couldn't will himself to destroy me. He's a man of great moral clarity. So pure, he makes me want to vomit!" + " #Goku").save_with_tags
user_2.tweets.build(content: "I doubt I need an introduction, but just in case, I am the mighty Frieza, and yes, all the horrible stories you've heard are true."  + " #Frieza").save_with_tags

# Cell
user_3.tweets.build(content: "You see, I'm perfect, my strength is perfect, and with that I shall bring equally perfect destruction." + " #perfect").save_with_tags
user_3.tweets.build(content: "You fool! Don't you realize yet you're up against the perfect weapon?!" + " #perfect").save_with_tags

# Android 18
user_4.tweets.build(content: "Whoever owns these clothes should have their optic sensors adjusted." + " #sensors").save_with_tags
user_4.tweets.build(content: "Now that you know you can't win I don't mind let you have the victory." + " #victory").save_with_tags

# Majin Buu
user_5.tweets.build(content: "I'm the terror of the universe." + " #universe").save_with_tags
user_5.tweets.build(content:  "I was promised a good fight. Produce the challenger. Which one of you is it?" + " #challenger").save_with_tags

# Gohan
user_6.tweets.build(content: "You killed my Dad. And the others! I'm going to make you pay for what you did to them!!!" + " #Dad").save_with_tags
user_6.tweets.build(content: "You stop hurting... MY DADDY!!!").save_with_tags

# Trunks
user_7.tweets.build(content: "You hate the fact that you're powerless to stop me, that you're completely outmatched." + " #powerless").save_with_tags
user_7.tweets.build(content: "Gohan, why'd you have to do it, why'd you have to leave me? This just isn't fair!" + " #Gohan").save_with_tags

# Android 19
user_8.tweets.build(content: "Yes, it is useless. Until I have all your energy, I will never let you go." + " #useless #energy").save_with_tags
user_8.tweets.build(content: "I know all of your moves Vegeta. Oh, yes, Dr. Gero studied you very thoroughly." + " #Vegeta #Dr.Gero").save_with_tags
