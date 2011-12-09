DocasaurusRex
==============

Installation:
--------
		rvm install 1.9.3 # You're using RVM, right?
    rvm use 1.9.3 # Ruby 1.9.3 required due to bug in 1.9.2 that causes em-synchrony to segfault
		gem install goliath em-http-request
		

Test:
-----

    rspec spec/doc_rex_spec.rb