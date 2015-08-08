RSpec::Matchers.define :have_attributes do |attributes|
  match do |record|
    attributes.all? { |k, v| record.attributes[k.to_s] == v }
  end

  failure_message_when_negated do |record|
    "#{record} does have unexpected attributes #{attributes}"
  end

  failure_message do |record|
    "#{record} does not have expected attributes #{attributes}"
  end
end