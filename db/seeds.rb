require 'faker'

Organization.transaction do

  org = Organization.create!(name: Faker::Company.name)

  # org = Organization.create!(name: Faker::Company.name)# create! будет выводить ошибку при записи невалидных данных
   org_1 = Organization.create!(name: "Samsung")
  User.transaction do
    User.create!(organization: org, name: Faker::Name.name, state: 'active')
    User.create!(organization: org, name: Faker::Name.name, state: "inactive")
    User.create!(organization: org, name: Faker::Name.name, state: "active")
    User.create!(organization: org, name: Faker::Name.name, state: "inactive")
    User.create!(organization: org, name: Faker::Name.name, state: "active")
    user = User.all
    User.create!(organization: org_1, name: Faker::Name.name, state: "active")
    User.create!(organization: org_1, name: Faker::Name.name, state: "inactive")
    User.create!(organization: org_1, name: Faker::Name.name, state: "active")
    User.create!(organization: org_1, name: Faker::Name.name, state: "inactive")
    users = User.all
    Post.transaction(requires_new: true) do
      count = 0
      while count < 12_500
        Post.create!(user: user[0], organization: org, text_post: Faker::Beer.brand, status: "active")
        count += 1
      end
       Post.create!(user: user[1], organization: org, text_post: "True Detective cool", status: "under_review")
      count = 0
      while count < 12_500
       Post.create!(user: user[2], organization: org, text_post: Faker::Beer.brand, status: "active")
       count += 1
      end
       Post.create!(user: user[3], organization: org, text_post: "Sunshine", status: "archived")
      count = 0
      while count < 12_500
       Post.create!(user: user[4], organization: org, text_post: Faker::Beer.brand, status: "active")
       count += 1
      end
      Post.create!(user: users[5], organization: org_1, text_post: "cross the bridge", status: "inactive")
      Post.create!(user: users[6], organization: org_1, text_post: "kill carrot", status: "under_review")
      count = 0
      while count < 12_500
      Post.create!(user: users[7], organization: org_1, text_post: Faker::Beer.brand, status: "active")
      count += 1
      end
      Post.create!(user: users[8], organization: org_1, text_post: "people are happy", status: "archived")
      raise ActiveRecord::Rollback if Post.blank? #чисто по приколу тут if, если уберу, то будет откат и данные не запишутся
    end
  end
rescue ActiveRecord::RecordInvalid
  puts "Oops. We tried to do an invalid operation!"
end


