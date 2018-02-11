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

Tag.where(type: "TheologicalTheme").delete_all

TOPICS = [
  ["Apologetics", ["Defense", "Giving An Answer"]],
  ["Apostles Creed", []],
  ["Arminianism", []],
  ["Atonement", ["Reconciliation"]],
  ["Baptism", ["Baptismal", "Christening", "Sprinkling", "Dunking"]],
  ["Bible", ["Scripture", "Word", "Writ"]],
  ["Biblical Inerrancy", ["Chicago Statement", "Infallibility"]],
  ["Calvinism", []],
  ["Canon", ["Law", "Decree", "Edict", "Statue"]],
  ["Christmas", ["Nativity", "Christ Birth", "Virgin Birth", "Xmas", "Advent"]],
  ["Church Discipline", []],
  ["Church Organization", ["Organization", "Deacon", "Body Of Christ"]],
  ["Common Grace", []],
  ["Creation", ["Universe", "Genesis", "Beginning Of Time"]],
  ["Easter", ["Risen", "Rebirth"]],
  ["End Times", ["Tribulation", "Post Trib", "Day Of The Lord"]],
  ["Ethics", ["Morals", "Moral Code", "Principles", "Value System"]],
  ["Faith", ["Belief", "Confidence"]],
  ["Family", ["Relations", "Kin", "Kindred", "Near And Dear", "Dear Ones"]],
  ["Finance", ["Financial Affairs", "Money Matters", "Fiscal Matters", "Economics", "Money Management", "Commerce", "Business", "Investment"]],
  ["Generosity", ["Giving", "Charity", "Offering", "Philanthropy", "Kindness", "Sacrifice"]],
  ["Glorification", ["Exaltation", "Deification"]],
  ["Good Friday", ["Passion", "Crucifixion", "Cross", "Christ Death"]],
  ["Grace", ["Favor", "Unmerited Favor", "Approval"]],
  ["Heresy", ["Blasphemy", "Apostasy", "Dissent"]],
  ["Hope", ["Aspiration", "Desire", "Wish", "Expectation", "Ambition", "Aim", "Goal", "Plan"]],
  ["Justification", ["Made Righteous", "Forgiven"]],
  ["Leadership", ["Guidance", "Direction", "Control", "Management", "Superintendence", "Supervision, Organization", "Governance"]],
  ["Love", ["Affection", "Fondness", "Tenderness", "Warmth", "Intimacy", "Attachment", "Endearment"]],
  ["Marriage", ["Wedding", "Nuptials", "Union"]],
  ["Missions", ["Commission", "Missionary", "Evangelization", "Spread The Word"]],
  ["Obedience", ["Compliance", "Acquiescence", "Tractability", "Dutifulness", "Duty", "Deference", "Submissiveness", "Submission", "Conformity", "Docility", "Subservience", "Obsequiousness", "Servility"]],
  ["Palm Sunday", ["Passion Week"]],
  ["Patriotism", ["Nationalism"]],
  ["Persecution", ["Oppression", "Victimization", "Mistreatment", "Abuse", "Discrimination", "Tyranny"]],
  ["Perseverance of the Saints", []],
  ["Prayer", ["Intercession", "Invocation", "Quiet Time", "Talking To God"]],
  ["Providence", ["Gods Will", "Divine Intervention"]],
  ["Resurrection", ["Death And Resurrection"]],
  ["Sacraments", ["Absolution", "Eucharist"]],
  ["Salvation", ["Redemption"]],
  ["Sanctification", ["Purification", "Dedication"]],
  ["Second Coming", ["Last Judgement", "Return Of Christ", "Second Advent"]],
  ["Spiritual Gifts", ["Ministry Gifts", "Gifts Of The Holy Spirit"]],
  ["Suffering", ["Hurt", "Ache", "Pain", "Affliction", "Disease", "Hardship"]],
  ["Teamwork", ["Partnership", "Synergy", "Collaboration", "Fellowship", "Working Together"]],
  ["The Lord's Supper", ["Holy Communion"]],
  ["The Reformation", ["Protestant Reformation", "Martin Luther"]],
  ["Trinity", ["Godhead", "Three In One"]],
  ["Trust", ["Certainty", "Assurance", "Conviction", "Credence,Reliance", "Loyalty"]],
  ["Worship", ["Reverence", "Veneration", "Adoration", "Glorify", "Glory", "Exalt"]],
]

all_topics = []
TOPICS.each do |canonical_name, variants|
  all_topics << Topic.find_or_create_by(canonical_name: canonical_name, variant: canonical_name)
  variants.each do |variant|
    all_topics << Topic.find_or_create_by(canonical_name: canonical_name, variant: variant)
  end
end
Topic.where.not(id: all_topics).delete_all

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

all_characters = []
BIBLE_CHARACTERS.each do |canonical_name, variants|
  all_characters << Character.find_or_create_by(canonical_name: canonical_name, variant: canonical_name)
  variants.each do |variant|
    all_characters << Character.find_or_create_by(canonical_name: canonical_name, variant: variant)
  end
end
Character.where.not(id: all_characters).delete_all

# rubocop:enable Style/WordArray
# rubocop:enable Style/TrailingCommaInLiteral
# rubocop:enable Style/MutableConstant
# rubocop:enable Metrics/LineLength