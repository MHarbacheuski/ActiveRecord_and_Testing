# frozen_string_literal: true

desc 'print hello world!'        # description.
task 'hello_world' do            # rake task name.
  p 'hello good world!'                 # print "hello world!"
end

namespace :organizations do
  desc 'Create organizations'
  task create: :environment do
    org = Organization.create!(name: 'Kit')
    unless org.save
      warn('Cannot create a new organization:')
      user.errors.full_messages.each do |message|
        warn(" * #{message}")
      end
    end
  end
end