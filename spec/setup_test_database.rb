require 'pg'

def setup_test_database
  connectdb = PG.connect(dbname: 'makers_bnb_test')
  connectdb.exec("TRUNCATE spaces;")
end

