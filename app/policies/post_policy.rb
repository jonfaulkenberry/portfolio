PostPolicy = Struct.new(:user, :post) do
  self::Scope = Struct.new(:user, :scope) do
    def resolve
      if user.nil?
        scope.where(:published => true)
      elsif user.role == "author"
        scope.where("published = true OR author_id =#{user.id}")
      elsif user.role == "owner"
        scope.all
      end
    end
  end

  def create?
    return false if user.nil?
    user.author?
  end

  def publish?
    return false if user.nil?
    user.owner?
  end
  
  def edit?
    return false if user.nil?
    (user.owner? || (user.author? && post.author == user))
  end

  def destroy?
    return false if user.nil?
    (user.owner? || (user.author? && post.author == user))
  end 

  def permitted_attributes
    if publish?
      [:title, :body, :published]
    elsif create?
      [:title, :body]
    end
  end
end
