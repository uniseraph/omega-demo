# brew install ruby
# gem i sequel
# gem i mysql2
# ruby 10000_user_insert.rb

# create database user;
# create table    user(id varchar(40) not null, name varchar(40) not null, primary key(id));
# 执行查看操作数量
# show global status like 'Com_insert'

require "sequel"
require "pp"
require 'benchmark'

kingshard = Sequel.mysql2("sk_dev", :host => '127.0.0.1', :user => "kingshard", :password => "kingshard", :port => 32826)
mysql = Sequel.mysql2("sk_dev", :host => '127.0.0.1', :user => "root", :password => nil, :port => 3306)

kingshard[:user].delete
mysql[:user].delete

puts "SQL insert 10000 times benchmark test."
Benchmark.bm do |x|
    x.report("KingShard insert") {
        10000.times{|t|
            kingshard.run("insert into user(id, name ) values(#{t}, 'bob');")
        }
    }
    x.report("MySQL insert") {
        10000.times{|t|
            mysql.run("insert into user(id, name ) values(#{t}, 'bob');")
        }
    }
end

