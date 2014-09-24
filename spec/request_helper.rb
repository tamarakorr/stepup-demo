def clean!(tables=false)
  # Ideal use for this method is for the Spec classes to clean DB 
  #   and email deliveries or anything else that has to be deleted.

  # This method will clean the tables that you pass in the argument array.
  #   if nothing is passed, it will clean all the tables that are defined below.
  #     Also, this method clears are email deliveries.

  tables ||=  %w{
                  vacancies volunteers
                }

  tables.each do |table|
    ActiveRecord::Base.connection.execute("TRUNCATE #{table};")
  end
  reset_email_deliveries
end

def reset_email_deliveries
  ActionMailer::Base.deliveries = []
end