FactoryBot.define do
  factory :movie do
    title {"test"}
    description {"hello!"}
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    video {File.open("#{Rails.root}/public/videos/test_video.mp4")}
    user


  end
end