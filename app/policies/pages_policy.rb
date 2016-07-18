class PagesPolicy < Struct.new(:user, :pages)
  def address?
    user.admin? || user.vip?
  end
end
