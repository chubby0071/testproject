class Report

  create_report = true  

  if create_report
    time = Time.new
    time = time.strftime("%Y%m%d_%H%M%S")
    FileUtils.mkdir_p "./report/#{time}"
  end  

  if create_report
    # FileUtils.mv("./report/user_data", "./report/#{time}")
    FileUtils.cp("./report/results.html", "./report/#{time}")
  end

end # Report