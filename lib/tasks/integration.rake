# ganked from rspec.rake
rspec_base = File.expand_path(File.dirname(__FILE__) + '/../../vendor/plugins/rspec/lib')
$LOAD_PATH.unshift(rspec_base) if File.exist?(rspec_base)
require 'spec/rake/spectask'
require 'spec/rake/verify_rcov'

spec_prereq = File.exist?(File.join(RAILS_ROOT, 'config', 'database.yml')) ? "db:test:prepare" : :noop
task :noop do
end

task :integration => %w{ environment:test configure:target gems:install db:test:purge db:migrate db:test:prepare integration:spec integration:rcov }

namespace :environment do
  task :test do
    RAILS_ENV = 'test'
  end
end

namespace :integration do
  Spec::Rake::SpecTask.new(:spec => spec_prereq) do |t|
    t.spec_opts = %w{ --format progress
                      --loadby mtime
                      --reverse }
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.rcov = true
    t.rcov_opts = lambda do
      IO.readlines("#{RAILS_ROOT}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    end
  end

  RCov::VerifyTask.new(:rcov => :spec) do |t|
    t.require_exact_threshold = false
    t.threshold = 100.0
  end

  # TODO: add Cucumber
end
