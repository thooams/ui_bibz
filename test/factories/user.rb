# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name_fr { "Name fr" }
    name_en { "Name en" }
    body_fr { "Body fr" }
    body_en { "Body en" }
    active  { true }
  end
end
