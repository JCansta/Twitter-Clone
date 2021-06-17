# -*- encoding: utf-8 -*-
# stub: postgresql_cursor 0.6.4 ruby lib

Gem::Specification.new do |s|
  s.name = "postgresql_cursor".freeze
  s.version = "0.6.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Allen Fair".freeze]
  s.date = "2019-10-03"
  s.description = "  PostgreSQL Cursor is an extension to the ActiveRecord PostgreSQLAdapter for\n  very large result sets.  It provides a cursor open/fetch/close interface to\n  access data without loading all rows into memory, and instead loads the result\n  rows in 'chunks' (default of 1_000 rows), buffers them, and returns the rows\n  one at a time.\n".freeze
  s.email = ["allen.fair@gmail.com".freeze]
  s.homepage = "http://github.com/afair/postgresql_cursor".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.2.15".freeze
  s.summary = "ActiveRecord PostgreSQL Adapter extension for using a cursor to return a large result set".freeze

  s.installed_by_version = "3.2.15" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.1.0"])
    s.add_development_dependency(%q<irb>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_development_dependency(%q<pg>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  else
    s.add_dependency(%q<activerecord>.freeze, [">= 3.1.0"])
    s.add_dependency(%q<irb>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
    s.add_dependency(%q<pg>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
  end
end
