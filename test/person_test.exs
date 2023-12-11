defmodule PersonTest do
  use ExUnit.Case
  doctest Person

  test "person with birth_date where birthday has not yet passed" do
    person_with_age =  %Person{name: "Alice", birth_date: ~D[1986-05-01]}
    assert Person.age(person_with_age, ~D[2023-03-11]) == 36
  end

  test "person with birth_date on the exact date" do
    person_with_age =  %Person{name: "Alice", birth_date: ~D[1986-12-11]}
    assert Person.age(person_with_age, ~D[2023-12-11]) == 37
  end

  test "person with birth_date where birthday has passed" do
    person_with_age =  %Person{name: "Kenny", birth_date: ~D[1986-09-12]}
    assert Person.age(person_with_age, ~D[2023-12-11]) == 37
  end





  test "person without birth_date should raise exception" do
    person_with_age =  %Person{name: "Alice"}
    assert_raise FunctionClauseError, fn ->
      Person.age(person_with_age, ~D[2023-12-11])
    end
  end


end
