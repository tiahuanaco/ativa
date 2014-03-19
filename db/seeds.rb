Project.destroy_all
Phase.destroy_all
Post.destroy_all
User.destroy_all

users = [
  {name: "Batman", email: 'batman@example.com', profile_pic: 'https://s3.amazonaws.com/mks_learn_app/batman.jpg', password: 'DickGrayson4Life'},
  {name: "Catwoman", email: 'catwoman@example.com', profile_pic: 'https://s3.amazonaws.com/mks_learn_app/catwoman.jpg', password: 'I<3Bruce'}
]

users.each do |user|
  User.create(
    name: user[:name],
    email: user[:email],
    password: user[:password],
    profile_pic: user[:profile_pic]
  )
end

phases = ['onboarding', 'creative', 'design', 'development', 'implementation']

phases.each do |phase|
  Phase.create(name: phase)
end

projects = [
  'Bird Watch',
  'GameStarter',
  'Prepify',
  'Mission Impossible',
  'Clownstagram',
  'FreqShow',
  'MikeMikeMike',
  'iDiningDeals',
  'MakerSquare'
]

projects.each do |project|
  Project.create(name: project, phase_id: Phase.first.id)
end

posts = [
  {
    title: "Search Results",
    message: "Once a user searches for a restaurant, we want the results to look like Google. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod, Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.",
    attachment: "https://ativa.s3.amazonaws.com/uploads/attachment/file/138/1.5-Search-Results.jpg"
  },
  {
    title: "Create Sign In Page",
    message: "Create a sign in page that allows native sign in or the use of Facebook or Twitter. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod, Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.",
    attachment: "https://ativa.s3.amazonaws.com/uploads/attachment/file/88/1_Home_with_Sign_In.pdf"
  },
  {
    title: "Homepage",
    message: "The home page should be nice and simple. It would be nice if the page looked similar to AirBnB. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod, Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.",
    attachment: "https://ativa.s3.amazonaws.com/uploads/post/attachment/173/iDiningDeals_Front_End_Wire_Frames.pdf"
  },
  {
    title: "Schedule",
    message: "We have strict schedule outlined for the project. It should take 3 months in total if we stay on pace. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod, Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod.",
    attachment: "https://ativa.s3.amazonaws.com/uploads/attachment/file/62/PSD_Calendar-_iDiningDeals.pdf"
  }
]

Project.all.each do |project|
  Phase.all.each do |phase|
    posts.each do |post|
      Post.create(
        message: post[:message],
        attachment: post[:attachment],
        title: post[:title],
        project_id: project.id,
        phase_id: phase.id,
        user_id: User.first.id + rand(0..1)
      )
    end
  end
end