module DashboardHelper
  def project_label
    label = [["default","Archived"],["success","Completed"],["warning","Collecting Data"],["info","Draft"]].sample
    "<span class='label label-#{label[0]}'>#{label[1]}</span>".html_safe
  end

  def project_date from = Time.local(2010, 1, 1), to = Time.now
    time = Time.at(from + rand * (to.to_f - from.to_f))
    time.strftime("%I:%M%p %d/%m/%Y")
  end

  def project_name
    ["Mangroves Exploitation for Species resilence",
    "Carbon sequestration through seagrass in habitats",
    "Impact of fuel subsidies in Columbia",
    "Environmental Quality and Livelihood Analysis",
    "Pacific island mangroves in climate change",
    "Mangrove Action Project",
    "Mangrove Restoration in Asia",
    "Mangrove Management in Solomon Islands",
    "Alaska's migratory birds and climate change",
    "Distribution of migratory bird stopovers"].sample
  end
end
