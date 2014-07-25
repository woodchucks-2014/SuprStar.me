# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Creating 2 parties
party_1 = Party.create(name: "Cicadas", hash_tag: "#cicadas", queue: ["Iv-Xmv2yjjQ","N5IUaHr2r8Y", "0rHEpRZeh-4"])
# party_2 = Party.create(name: "Woodchucks", hash_tag: "#woodchucks", queue: ["9Xo1J9Xl0Io", "SpVNr6k5zeY", "MZxvu2sXzug"])

# Creating users for woodchucks
p kai = User.create(name: "Kai", phone_number: "123-456-7890", party_id: 1)
p ken = User.create(name: "Ken", phone_number: "123-456-7890", party_id: 1)
p john = User.create(name: "John", phone_number: "123-456-7890", party_id: 1)

# Creating users for cicadas
# jake = User.create(name: "Jake", phone_number: "123-456-7890", party_id: 2)
# jess = User.create(name: "Jess", phone_number: "123-456-7890", party_id: 2)
# danielle = User.create(name: "Danielle", phone_number: "123-456-7890", party_id: 2)

# Creating songs for woodchucks
Song.create(name: "All of Me", youtube_url: "Iv-Xmv2yjjQ", user_id: kai.id, party_id: kai.party_id)
Song.create(name: "Just Give Me A Reason", youtube_url: "N5IUaHr2r8Y", user_id: ken.id, party_id: ken.party_id)
Song.create(name: "Because of You", youtube_url: "0rHEpRZeh-4", user_id: john.id, party_id: john.party_id)
