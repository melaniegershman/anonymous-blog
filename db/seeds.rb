25.times do
  Entry.create(title: Faker::Hacker.say_something_smart, body: Faker::Lorem.paragraph)
end

100.times do
  EntryTag.create(tag_id:rand(1..25), entry_id: rand(1..25))
end

25.times do
  Tag.create(tag: Faker::Lorem.word)
end

