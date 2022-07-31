Gem::Specification.new do |spec|
  spec.name = "Log Parser"
  spec.authors = ["Yasser Kavousi"]
  spec.email = ["y.kavousi@gmail.com"]

  spec.summary = ""
  spec.homepage = "https://github.com/kavoocy/log_parser"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/kavoocy/log_parser/issues",
    "changelog_uri" => "https://github.com/kavoocy/log_parser/releases",
    "source_code_uri" => "https://github.com/kavoocy/log_parser",
    "homepage_uri" => spec.homepage,
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[README.md {lib}/**/*]).reject { |f| File.directory?(f) }
  spec.require_paths = ["lib"]
end
