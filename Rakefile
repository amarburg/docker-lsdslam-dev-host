

IMAGE_NAME =  "amarburg/lsdslam-dev-host"
IMAGE_TAG  =  "nvidia_cuda_nocv"

task :default => "docker:build"

## No dependency tracking right now, just builds them in order
paths = { ".": "nvidia_cuda_nocv",
          "system_opencv": "nvidia_cuda",
          "opencv_3.1": "nvidia_cuda_opencv3.1",
          "opencv_3.1/zed_1.2": "nvidia_cuda_opencv3.1_zed1.2",
          "opencv_3.2": "nvidia_cuda_opencv3.2",
          "opencv_3.2/zed_1.2": "nvidia_cuda_opencv3.2_zed1.2" }

namespace :docker do


  task :build do
    paths.each_pair { |dir,tag|
      tag = "%s:%s" % [IMAGE_NAME, tag]

      sh "docker build -t #{tag} #{dir}"
    }
  end

  namespace :build do

    paths.each_pair { |dir,tag|
      task tag do
        sh "docker build -t #{tag} #{dir}"
      end
    }

  end

  task :push do
      sh "docker login"
      sh "docker push #{tag}"
  end

end
