# FIXME: es muy feo crear esta clase !!
# se usa solo para la accion index
# no es lo mismo que los scopes, que dice aca https://github.com/elabs/pundit

class ArrayPolicy < Struct.new(:user, :questionnaire)

  def index?
    user.is_admin?
  end

end