Given /^that project has a ticket:$/ do |table|
  table.hashes.each do |attributes|

    ticket = @project.tickets.create!(attributes)

  end
end