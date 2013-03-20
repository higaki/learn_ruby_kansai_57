class Person
  include Comparable

  def initialize(name, born = nil)
    @name, @born = name, born
  end

  attr_reader :name
  attr_accessor :born

  def age
    (Time.now.strftime('%Y%m%d').to_i - born.strftime('%Y%m%d').to_i) / 1_00_00
  end

  def to_s
    "#{name}(#{age})" rescue name
  end

  def <=> o
    return nil unless o.kind_of? Person
    identity <=> o.identity
  end

  def hash
    identity.hash
  end

  def eql? o
    return false unless o.kind_of? Person
    identity.eql? o.identity
  end

  def identity
    [@name, @born]
  end

  protected :identity
end
