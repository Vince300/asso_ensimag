module ApplicationHelper
  def all_assos
    User.all.each do |user|
      yield user
    end
  end
end
