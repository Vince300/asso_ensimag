class ColorValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.nil? and not options[:allow_nil]
      record.errors[attribute] << (options[:message] || I18n.t('errors.messages.blank'))
    else
      unless value.nil? or value =~ /^#\h{6}$/
        record.errors[attribute] << (options[:message] || I18n.t('errors.messages.color'))
      end
    end
  end
end