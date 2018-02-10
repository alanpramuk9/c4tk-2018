# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# rubocop:disable Metrics/LineLength
# rubocop:disable Style/MutableConstant
# rubocop:disable Style/TrailingCommaInLiteral
# rubocop:disable Style/WordArray

require "tag"

TOPICS = [
  ["Faith", ["Belief", "Trust", "Confidence"]],
  ["Hope", ["Aspiration", "Desire", "Wish", "Expectation", "Ambition", "Aim", "Goal", "Plan"]],
  ["Love", ["Affection", "Fondness", "Tenderness", "Warmth", "Intimacy", "Attachment", "Endearment"]],
  ["Trust", ["Confidence", "Belief", "Faith", "Certainty", "Assurance", "Conviction", "Credence; Reliance", "Loyalty"]],
  ["Marriage", ["Wedding", "Nuptials", "Union"]],
  ["Family", ["Relations", "Kin", "Kindred", "Near And Dear", "Dear Ones"]],
  ["Suffering", ["Hurt", "Ache", "Pain", "Affliction", "Disease", "Hardship"]],
  ["Patriotism", ["Nationalism", "Loyalty"]],
  ["Finance", ["Financial Affairs", "Money Matters", "Fiscal Matters", "Economics", "Money Management", "Commerce", "Business", "Investment"]],
  ["Christmas", ["Nativity", "Christ Birth", "Virgin Birth", "Xmas", "Advent"]],
  ["Easter", ["Resurrection", "Rebirth", "Crucifixion", "Cross"]],
  ["Leadership", ["Guidance", "Direction", "Control", "Management", "Superintendence", "Supervision; Organization", "Governance"]],
  ["Teamwork", ["Partnership", "Synergy", "Collaboration", "Fellowship", "Working Together"]],
  ["Missions", ["Commission", "Missionary", "Evangelization", "Spread The Word"]],
  ["Generosity", ["Giving", "Charity", "Offering", "Philanthropy", "Kindness", "Sacrifice"]],
  ["Grace", ["Favor", "Unmerited Favor", "Approval"]],
  ["Palm Sunday", ["Passion Week"]],
  ["Good Friday", ["Passion", "Crucifixion", "Cross", "Christ Death"]],
  ["Persecution", ["Oppression", "Victimization", "Mistreatment", "Abuse", "Discrimination", "Tyranny"]],
  ["Prayer", ["Intercession", "Invocation", "Quiet Time", "Talking To God"]],
  ["Worship", ["Reverence", "Veneration", "Adoration", "Glorification", "Glory", "Exaltation"]],
  ["Obedience", ["Compliance", "Acquiescence", "Tractability", "Dutifulness", "Duty", "Deference", "Submissiveness", "Submission", "Conformity", "Docility", "Subservience", "Obsequiousness", "Servility"]]
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

# rubocop:enable Style/WordArray
# rubocop:enable Style/TrailingCommaInLiteral
# rubocop:enable Style/MutableConstant
# rubocop:enable Metrics/LineLength