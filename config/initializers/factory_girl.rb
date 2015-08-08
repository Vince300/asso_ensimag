if Rails.env == 'test'
  if defined? FactoryGirl and defined? RSpec::Matchers
    Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }
    FactoryGirl::SyntaxRunner.send(:include, AssoEnsimag::RSpecHelpers)
  end
end
