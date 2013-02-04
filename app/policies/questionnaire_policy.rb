class QuestionnairePolicy < Struct.new(:user, :questionnaire)

  # class Scope < Struct.new(:user, :scope)
  #   def resolve
  #     if user.is_admin?
  #     else
  #       scope.where(:published => true)
  #     end
  #   end
  # end

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

  def destroy?
    user.is_admin?
  end

end