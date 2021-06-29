org = Organization.create(name: "Voka")

user1 = User.create(organization: org, name: 'Maks', state: "active")
user2 = User.create(organization: org, name: 'Vita', state: "inactive")
user3 = User.create(organization: org, name: 'Dasha', state: "active")
user4 = User.create(organization: org, name: 'Misha', state: "inactive")
user5 = User.create(organization: org, name: 'Pablo', state: "active")
user = User.all

post1 = Post.create(user: user[0], organization: org, text_post: "Privet VK", status: "inactive")
post2 = Post.create(user: user[1], organization: org, text_post: "True Detective cool", status: "under_review")
post3 = Post.create(user: user[2], organization: org, text_post: "Nice day", status: "active")
post4 = Post.create(user: user[2], organization: org, text_post: "Bad day", status: "active")
post5 = Post.create(user: user[3], organization: org, text_post: "Sunshine", status: "archived")
post6 = Post.create(user: user[4], organization: org, text_post: "Good job", status: "active")

org_1 = Organization.create(name: "Samsung")

user1_1 = User.create(organization: org_1, name: 'Valik', state: "active")
user2_2 = User.create(organization: org_1, name: 'Pasha', state: "inactive")
user3_3 = User.create(organization: org_1, name: 'Nastya', state: "active")
user4_4 = User.create(organization: org_1, name: 'Mirak', state: "inactive")
users = User.all

post1_1 = Post.create(user: users[5], organization: org_1, text_post: "cross the bridge", status: "inactive")
post2_2 = Post.create(user: users[6], organization: org_1, text_post: "kill carrot", status: "under_review")
post3_3 = Post.create(user: users[7], organization: org_1, text_post: "cycle mode", status: "active")
post4_4 = Post.create(user: users[8], organization: org_1, text_post: "people are happy", status: "archived")

