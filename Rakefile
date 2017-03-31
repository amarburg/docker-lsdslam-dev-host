

IMAGE_NAME =  "amarburg/lsdslam-dev-host"
IMAGE_TAG  =  "nvidia_cuda_nocv"

task :default => "docker:build"

paths = { ".": "nvidia_cuda_nocv",
          "system_opencv": "nvidia_cuda" }

namespace :docker do


  task :build do
    paths.each_pair { |dir,tag|
      tag = "%s:%s" % [IMAGE_NAME, tag]

      sh "docker build -t #{tag} #{dir}"
    }
  end

  task :push do
      sh "docker login"
      sh "docker push #{tag}"
  end

end
