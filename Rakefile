namespace :test do
  desc "Run the XING Tests for iOS"
  task :ios do
    $ios_success = system("xcodebuild -workspace XNGAPIClient.xcworkspace -scheme 'XINGAPIClient Tests' -destination platform='iOS Simulator',OS=$OS,name='iPhone Retina (4-inch)' clean build test -sdk iphonesimulator | xcpretty -t -c; exit ${PIPESTATUS[0]}")
  end
end

desc "Run the XING Tests for iOS"
task :test => ['test:ios'] do
  puts "\033[0;31m! iOS unit tests failed" unless $ios_success
  if $ios_success
    puts "\033[0;32m** All tests executed successfully"
  else
    exit(-1)
  end
end

task :default => 'test'
