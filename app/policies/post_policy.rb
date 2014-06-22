PostPolicy = Struct.new(:user, :post) do
  self::Scope = Struct.new(:user, :scope) do
    def resolve
      if user.nil? || user.role == "viewer"
        scope.where(:published => true)
      elsif user.role == "owner"
        scope.all
      end
    end
  end

  def create?
    return false if user.nil?
    user.owner?
  end

  def publish?
    return false if user.nil?
    user.owner?
  end
  
  def edit?
    return false if user.nil?
    user.owner?
  end

  def destroy?
    return false if user.nil?
    user.owner?
  end 

  def permitted_attributes
    if user.owner?
      [:title, :body, :description, :published, :tag_list]
    end
  end
end
