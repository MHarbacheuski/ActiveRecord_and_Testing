Organization.transaction do
  org = Organization.create!(name: "Voka")# create! будет выводить ошибку при записи невалидных данных
  org_1 = Organization.create!(name: "Samsung")
  User.transaction do
    User.create!(organization: org, name: 'Maks', state: "active")
    User.create!(organization: org, name: 'Vita', state: "inactive")
    User.create!(organization: org, name: 'Dasha', state: "active")
    User.create!(organization: org, name: 'Misha', state: "inactive")
    User.create!(organization: org, name: 'Pablo', state: "active")
    user = User.all
    User.create!(organization: org_1, name: 'Valik', state: "active")
    User.create!(organization: org_1, name: 'Pasha', state: "inactive")
    User.create!(organization: org_1, name: 'Nastya', state: "active")
    User.create!(organization: org_1, name: 'Mirak', state: "inactive")
    users = User.all
    Post.transaction(requires_new: true) do
      Post.create!(user: user[0], organization: org, text_post: "Privet VK", status: "inactive")
      Post.create!(user: user[1], organization: org, text_post: "True Detective cool", status: "under_review")
      Post.create!(user: user[2], organization: org, text_post: "Nice day", status: "active")
      Post.create!(user: user[3], organization: org, text_post: "Sunshine", status: "archived")
      Post.create!(user: user[4], organization: org, text_post: "Good job", status: "active")
      Post.create!(user: users[5], organization: org_1, text_post: "cross the bridge", status: "inactive")
      Post.create!(user: users[6], organization: org_1, text_post: "kill carrot", status: "under_review")
      Post.create!(user: users[7], organization: org_1, text_post: "cycle mode", status: "active")
      Post.create!(user: users[8], organization: org_1, text_post: "people are happy", status: "archived")
      raise ActiveRecord::Rollback if Post.blank? #чисто по приколу тут if, если уберу, то будет откат и данные не запишутся
    end
  end
rescue ActiveRecord::RecordInvalid
  puts "Oops. We tried to do an invalid operation!"
end


