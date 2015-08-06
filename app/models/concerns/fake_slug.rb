module FakeSlug
  extend ActiveSupport::Concern

  included do
    # Override model's to_param
    define_method :to_param do
      if fake_slug_attributes.any? { |attr| attribute_changed? attr } or @_as_param.nil?
        @_as_param = fake_slug_attributes.map { |attr| self.send(attr).to_s.parameterize }.join('-')
      end

      return @_as_param
    end
  end

  module ClassMethods
    def fake_slug_uses(*attributes)
      self.send(:define_method, :fake_slug_attributes, lambda { attributes })
    end
  end
end