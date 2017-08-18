class Admin

  def projects
    return Project.count
  end

  def projects_quantity(data)
    projects = Audits.where(auditable_type: "Project").group("DATE_TRUNC('day', created_at)", :action).count
    projects.sort_by { |date, value| date }
    p projects
    
    value = Project.where("created_at <= ?", 1.month.ago).count
    values = Hash.new
    projects.each do |project|
      if project[0][1] = "create"
        values[project[0][0]] = value + project[1]
      elsif project[0][1] == "destroy"
        values[project[0][0]] = value - project[1] 
      end
    end
    p "values"
    p values
    return values
  end

  def documents
    return Document.count
  end

  def documents_quantity(data)
    documents = Audits.where(auditable_type: "Document").group("DATE_TRUNC('day', created_at)", :action).count
    documents.sort_by { |date, value| date }
    p documents
    
    value = Document.where("created_at <= ?", 1.month.ago).count
    values = Hash.new
    documents.each do |document|
      if document[0][1] = "create"
        values[document[0][0]] = value + document[1]
      elsif document[0][1] == "destroy"
        values[document[0][0]] = value - document[1] 
      end
    end
    p "values"
    p values
    return values
  end

  def versions
    return Version.count
  end

  def versions_quantity(data)
    versions = Audits.where(auditable_type: "Version").group("DATE_TRUNC('day', created_at)", :action).count
    versions.sort_by { |date, value| date }
    p versions
    
    value = Version.where("created_at <= ?", 1.month.ago).count
    values = Hash.new
    versions.each do |version|
      if version[0][1] = "create"
        values[version[0][0]] = value + version[1]
      elsif version[0][1] == "destroy"
        values[version[0][0]] = value - version[1] 
      end
    end
    p "values"
    p values
    return values
  end

  def users
    return User.count
  end

  def users_quantity(data)
    users = Audits.where(auditable_type: "User").group("DATE_TRUNC('day', created_at)", :action).count
    users.sort_by { |date, value| date }
    p users
    
    value = User.where("created_at <= ?", 1.month.ago).count
    values = Hash.new
    users.each do |user|
      if user[0][1] = "create"
        values[user[0][0]] = value + user[1]
      elsif user[0][1] == "destroy"
        values[user[0][0]] = value - user[1] 
      end
    end
    p "values"
    p values
    return values
  end

  def span_end
  end
end