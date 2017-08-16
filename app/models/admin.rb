class Admin

  def projects
    return Project.count
  end

  def projects_graph
    return Project.group("DATE_TRUNC('day', created_at)").count
  end

  def documents
    return Document.count
  end

  def versions
    return Version.count
  end

  def versions_graph
    return Version.group("DATE_TRUNC('day', created_at)").count
  end

  def users
    return User.count
  end

  def span_begin
  end

  def span_end
  end


end