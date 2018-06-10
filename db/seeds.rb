Card.destroy_all
%w(1 2 3 5 8 13 21 34 55 89 144 233 ∞ ? ☕).each { |name| Card.create(name: name) }
