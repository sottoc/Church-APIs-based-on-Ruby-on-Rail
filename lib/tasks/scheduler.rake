desc "This task is called by the Heroku scheduler add-on"
task update_crm: :environment do
  puts "Updating CRM data..."
  puts "Starting uCare data transfer..."
  CrmAnalytic.initial_data()
  puts "Finished uCare transfer."
  puts 'Completed updating CRM data!'
end

task update_financial: :environment do
  puts "Updating financial data..."
  puts "Starting DonorTools data transfer..."
  DonorTool.initial_data()
  puts "Finished DonorTools transfer."
  puts "Completed updating financial data!"
end
