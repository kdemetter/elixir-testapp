defmodule PersonTest do
  use ExUnit.Case
  doctest Person

  test "person with birth_date" do
    person_with_age =  %Person{name: "Alice", birth_date: ~D[1986-12-11]}
    assert Person.age(person_with_age) == 37
  end

  test "person without birth_date should raise exception" do
    person_with_age =  %Person{name: "Alice"}
    assert_raise FunctionClauseError, fn ->
      Person.age(person_with_age)
    end
  end


end
