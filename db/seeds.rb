org = Organization.create(name: "Voka")

user1 = User.create(organization: org, name: 'Maks', state: "active")
user2 = User.create(organization: org, name: 'Vita', state: "inactive")
user3 = User.create(organization: org, name: 'Dasha', state: "active")
user4 = User.create(organization: org, name: 'Misha', state: "inactive")
user = User.all

post1 = Post.create(user: user[0], organization: org, status: "inactive")
post2 = Post.create(user: user[1], organization: org, status: "under_review")
post3 = Post.create(user: user[2], organization: org, status: "active")
post4 = Post.create(user: user[3], organization: org, status: "archived")

org_1 = Organization.create(name: "Samsung")

user1_1 = User.create(organization: org_1, name: 'Valik', state: "active")
user2_2 = User.create(organization: org_1, name: 'Pasha', state: "inactive")
user3_3 = User.create(organization: org_1, name: 'Nastya', state: "active")
user4_4 = User.create(organization: org_1, name: 'Mirak', state: "inactive")
users = User.all

post1_1 = Post.create(user: users[4], organization: org_1, status: "inactive")
post2_2 = Post.create(user: users[5], organization: org_1, status: "under_review")
post3_3 = Post.create(user: users[6], organization: org_1, status: "active")
post4_4 = Post.create(user: users[7], organization: org_1, status: "archived")

