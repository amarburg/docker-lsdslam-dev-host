

namespace :docker do

  tag = "amarburg/lsdslam-dev-host:coverity-latest"

  task :build do
    sh "docker build -t #{tag} . "
  end

  task :push do
      sh "docker login"
      sh "docker push #{tag}"
  end

end
