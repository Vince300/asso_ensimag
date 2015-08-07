if defined? FactoryGirl
  Dir[Rails.root.join("spec/support/*.rb")].each { |f| require f }
  FactoryGirl::SyntaxRunner.send(:include, AssoEnsimag::RSpecHelpers)
end