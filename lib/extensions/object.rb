class Object
  def blank?
    return true if respond_to?(:nil?) && nil?
    return true if respond_to?(:empty?) && empty?

    false
  end
end
