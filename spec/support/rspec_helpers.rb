module AssoEnsimag
  module RSpecHelpers
    # Helper methods
    def random_date(n = 1)
      d = if n % 2
            DateTime.now + (5 + rand(5)).days + rand(30).minutes + rand(12).hours
          else
            DateTime.now - (5 + rand(5)).days - rand(30).minutes - rand(12).hours
          end
      d.to_formatted_s(:db)
    end

    def date_after(d)
      d.nil? ? random_date : (DateTime.parse(d) + (1 + rand(24 * 2)).hours).to_formatted_s(:db)
    end
  end
end
