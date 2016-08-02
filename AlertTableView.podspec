

Pod::Spec.new do |s|


  s.name         = "AlertTableView"
  s.version      = "0.0.1"
  s.summary      = "一个数组解决弹出视图列表"
  s.homepage     = "https://github.com/rongshuizhou/AlertAlertTableView.git"

  s.license      = "MIT"


  s.author             = { "rongshuizhou" => "1013620104@qq.com" }
   s.platform     = :ios, "7.0"


  s.source       = { :git => "https://github.com/rongshuizhou/AlertAlertTableView.git", :tag => "0.0.1" }

  s.source_files  = "AlertTableView/Classes/*.{h,m,xib}"
  #s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "AlertTableView/*.xcassets"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

   s.requires_arc = true

  #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
   s.dependency "Masonry", "~> 0.6.3"

end
