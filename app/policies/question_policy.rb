class QuestionPolicy < Struct.new(:user, :question)

  def create?
    user.is_admin? 
  end

  def show?
    user.is_admin?
  end

  def new?
    create?
  end

  def index?
    user.is_admin?
  end

  def update?
    user.is_admin?
  end

end