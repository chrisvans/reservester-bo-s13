### EDGE / 2013-05-06
* Compatibility for Rails 4 pre-release (Ben Woosley)
* Fallback to synchronous is default when connection to Redis fails
* Avoid lazy evaluation of mail when excluded, for use with mail_view 
  (gingerlime)

### 2.2.3 / 2013-02-27
* MessageDecoy should handle non rails current_env (Hunter Haydel)

### 2.2.2 / 2013-01-27
* Fall back to deliver (not deliver!) on actual message, expected
  behavios when perform_deliveries is false, etc.

### 2.2.1 / 2012-12-09
* Added optional support for synchronous fallback (Lee Edwards and
  Peter Jaros)
* Added optional custom error_handler lambda support (Adam Bird)

### 2.2.0 / 2012-12-01
* Added logging for failed deliveries (Mike Swieton)
* Fixed / preserved exceptions for template renders (Sidharth Shanker)
* Add `deliver_at` and `deliver_in` methods for scheduling mail in the
  future if resque-scheduler is installed (Harry Marr)

### 2.1.0 / 2012-06-09

* Message decoy acts more like a real message (to\_s)
* Removed jeweler as a dependency (managing gem directly via Bundler)
* Removed Resque dependency for compatibility with Resque forks
  (mongo-resque, etc)
* Add support for non-Rails applications (Fabio Kreusch)

### 2.0.3 / 2012-02-17

* Added ability to override local queue name (example scenario: using
  two different queues for different mail priority levels)

### 2.0.2 / 2011-08-20

* Fixed deliver vs deliver! issue so mail interceptors will work as
  expected

### 2.0.1 / 2011-08-19

* Restore the mailer proxy object so mailer method bodies never get
  invoked more than once accidentally (not required to be idempotent)

### 2.0.0 / 2011-06-24

* Removed support for legacy Rails 2.x applications (please use v1.x)
* Removed mailer proxy, return Mail::Message object
* Reorganize and modernize gem structure, add bundler and move to RSpec 2.x
* Queue target (::Resque) can now be overridden for testing (Joshua
  Clayton)

### 1.0.1 / 2010-12-21

* Respect ActionMailer::Base.perform\_deliveries

### v1.0.0 / 2010-07-28

* Added support for Rails 3.x (Marcin Kulik)
