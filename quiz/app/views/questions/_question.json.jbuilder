json.extract! question, :id, :qtype, :qstring, :optionA, :optionB, :optionC, :optionD, :answer, :subgenre_id, :score, :created_at, :updated_at
json.url question_url(question, format: :json)
