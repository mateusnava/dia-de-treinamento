FactoryGirl.define do
  factory :login do
    association :usuario
    data { Date.current }
    ip "127.0.0.1"
  end
end
