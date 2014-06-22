module ProjectHelper
  def project_tag_list(project)
    project.tag_list.map{ |t| link_to t, project_tag_path(t) }.join( ', ')
  end
end
