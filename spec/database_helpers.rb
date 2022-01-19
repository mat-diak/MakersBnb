require 'pg'

def persisted_data(id, tb_name)
  connection = PG.connect(dbname: 'makers_bnb_test')
  result = connection.query("SELECT * FROM #{tb_name} WHERE id = #{id};")
end