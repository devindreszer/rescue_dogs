desc "Migrate dog matches to dog queries"
task migrate_data: :environment do
  User.all.each do |user|
    user.dog_queries.each do |dog_query|
      dog_query.is_match = true
      dog_query.view_count = 1
      dog_query.save
    end
  end
end
