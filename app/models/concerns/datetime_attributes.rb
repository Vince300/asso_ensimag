module DatetimeAttributes
  extend ActiveSupport::Concern

  module ClassMethods
    def datetime_attribute(*attribute_names)
      attribute_names.each do |attribute_name|
        self.send(:define_method, "#{attribute_name}_before_type_cast", lambda {
                    dt = self.send(attribute_name)
                    return unless dt
                    dt.localtime
                    return dt.strftime("%Y-%m-%d %H:%M") })
      end
    end
  end
end