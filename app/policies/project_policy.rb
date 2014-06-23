ProjectPolicy = Struct.new(:user, :project) do
  self::Scope = Struct.new(:user, :scope) do
    def resolve
      if user.nil? || user.role == "viewer"
        scope.where(:published => true)
      elsif user.role == "owner"
        scope.all
      end
    end
  end

  def owner?
    return false if user.nil?
    user.owner?
  end
  
  def permitted_attributes
    if user.owner?
      [:name, :body, :description, :tag_list]
    end
  end
end
