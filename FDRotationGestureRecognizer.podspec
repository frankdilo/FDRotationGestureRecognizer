Pod::Spec.new do |s|

  s.name         = "FDRotationGestureRecognizer"
  s.version      = "0.0.1"
  s.summary      = "A gesture recognizer for rotations"

  s.description  = <<-DESC
                   A UIGestureRecognizer subclass that, once added to a view, allows to easily measure the rotation performed by the user dragging on the screen.
                   DESC

  s.homepage     = "https://github.com/frankdilo/FDRotationGestureRecognizer"
  s.screenshots  = "https://raw.githubusercontent.com/frankdilo/FDRotationGestureRecognizer/master/Other/demo.gif", "https://raw.githubusercontent.com/frankdilo/FDRotationGestureRecognizer/master/Other/explanation.png", "https://raw.githubusercontent.com/frankdilo/FDRotationGestureRecognizer/master/Other/myfert.jpeg"

  s.platform     = :ios, '8.0'

  s.license      = "MIT"

  s.author             = { "Francesco Di Lorenzo" => "francescodilorenzo@me.com" }
  s.social_media_url   = "http://twitter.com/frankdilo"

  s.source       = { :git => "https://github.com/frankdilo/FDRotationGestureRecognizer.git", :tag => "0.0.1" }

  s.source_files  = "Classes", "FDRotationGestureRecognizer/FDRotationGestureRecognizer/*.{h,m}"

  s.frameworks = 'UIKit'

end
