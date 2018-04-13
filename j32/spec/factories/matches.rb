FactoryBot.define do
  factory :match do
    candidate_1_id 1
    candidate_2_id 1
    lock 1
    candidate_1_picture "MyText"
    candidate_1_firstname "MyString"
    candidate_1_lastname "MyString"
    candidate_1_bio "MyText"
    candidate_2_picture "MyText"
    candidate_2_firstname "MyString"
    candidate_2_lastname "MyString"
    candidate_2_bio "MyText"
  end
end
