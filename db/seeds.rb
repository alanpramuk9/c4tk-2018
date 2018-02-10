# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rubocop:disable Style/MutableConstant
# rubocop:disable Style/TrailingCommaInLiteral

TOPICS = [
  ["Faith", []],
  ["Hope", []],
  ["Love", []],
  ["Trust", []],
  ["Marriage", []],
  ["Family", []],
  ["Suffering", []],
  ["Patriotism", []],
  ["Finance", []],
  ["Christmas", []],
  ["Easter", []],
  ["Leadership", []],
  ["Teamwork", []],
  ["Missions", []],
  ["Generosity", []],
  ["Grace", []],
  ["Palm Sunday", []],
  ["Good Friday", []],
  ["Persecution", []],
  ["Prayer", []],
  ["Worship", []],
  ["Obedience", []],
]
TOPICS.each do |canonical_name, variants|
  Topic.find_or_create_by(canonical_name: canonical_name, variant: canonical_name)
  variants.each do |variant|
    Topic.find_or_create_by(canonical_name: canonical_name, variant: variant)
  end
end

THEOLOGICAL_THEMES = [
  ["Salvation", []],
  ["2nd Coming", []],
  ["Justification", []],
  ["Atonement", []],
  ["Bible", []],
  ["Canon", []],
  ["Trinity", []],
  ["Creation", []],
  ["Heresy", []],
  ["Biblical Inerrancy", []],
  ["Apologetics", []],
  ["Ethics", []],
  ["Providence", []],
  ["Common Grace", []],
  ["Sanctification", []],
  ["Baptism", []],
  ["Perseverance of the Saints", []],
  ["Glorification", []],
  ["Church Discipline", []],
  ["Church Organization", []],
  ["The Lord's Supper", []],
  ["Sacraments", []],
  ["Spiritual Gifts", []],
  ["The Reformations", []],
  ["Apostles Creed", []],
  ["Calvinism", []],
  ["Arminianism", []],
  ["End Times", []],
  ["Resurrection", []],
]
THEOLOGICAL_THEMES.each do |canonical_name, variants|
  TheologicalTheme.find_or_create_by(canonical_name: canonical_name, variant: canonical_name)
  variants.each do |variant|
    TheologicalTheme.find_or_create_by(canonical_name: canonical_name, variant: variant)
  end
end

BIBLE_CHARACTERS = [
  ["Adam", []],
  ["Eve", []],
  ["Cain", []],
  ["Abel", []],
  ["Noah", []],
  ["Abraham", []],
  ["Lot", []],
  ["Sarah", []],
  ["Hagar", []],
  ["Ishmael", []],
  ["Rebekkah", []],
  ["Jacob", []],
  ["Esau", []],
  ["Joseph", []],
  ["Benjamin", []],
  ["Levi", []],
  ["Judah", []],
  ["Moses", []],
  ["Aaron", []],
  ["Caleb", []],
  ["Joshua", []],
  ["Rahab", []],
  ["Judges", []],
  ["Gideon", []],
  ["Deborah", []],
  ["Samson", []],
  ["Ruth", []],
  ["Samuel", []],
  ["Hannah", []],
  ["Eli", []],
  ["Saul", []],
  ["Jonathan", []],
  ["David", []],
  ["Goliath", []],
  ["Nathan", []],
  ["Solomon", []],
  ["Elijah", []],
  ["Jezebel", []],
  ["Isaiah", []],
  ["Josiah", []],
  ["Jeremiah", []],
  ["Ezekiel", []],
  ["Daniel", []],
  ["Nebuchadnezzar", []],
  ["Belshazzar", []],
  ["Shadrach", []],
  ["Meschach", []],
  ["Abednego", []],
  ["Esther", []],
  ["Mordecai", []],
  ["Nehemiah", []],
  ["Malachi", []],
  ["Peter", []],
  ["Andrew", []],
  ["James", []],
  ["John", []],
  ["Philip", []],
  ["Thomas", []],
  ["Matthew", []],
  ["James", []],
  ["Simon", []],
  ["Judas Iscariot", []],
  ["Paul", []],
  ["Barnabas", []],
  ["John the Baptist", []],
  ["Mary Magdalene", []],
  ["Mary", []],
  ["Nicodemus", []],
  ["Timothy", []],
  ["Titus", []],
]
BIBLE_CHARACTERS.each do |canonical_name, variants|
  Character.find_or_create_by(canonical_name: canonical_name, variant: canonical_name)
  variants.each do |variant|
    Character.find_or_create_by(canonical_name: canonical_name, variant: variant)
  end
end

# rubocop:enable Style/TrailingCommaInLiteral
# rubocop:enable Style/MutableConstant