json.extract! leaderboard, :id, :score, :user_id, :genre_id, :subgenre_id, :created_at, :updated_at
json.url leaderboard_url(leaderboard, format: :json)
