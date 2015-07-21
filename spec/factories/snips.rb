FactoryGirl.define do
  factory :snip do
    name "MyString"
    description "MyString"
    content "MyText"
    language Language.first
  end
end
