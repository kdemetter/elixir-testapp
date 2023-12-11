defmodule Person do
  defstruct [:name, :birth_date]

  def age(person, current_date \\ Date.utc_today()) when person.birth_date != nil  do
    years = current_date.year - person.birth_date.year
    birthday_this_year = %{person.birth_date | year: current_date.year}
    # if we already had your birthday this year, remove one year
    case Date.compare(current_date, birthday_this_year) do
      :lt -> years - 1
      _ -> years
    end

  end

  defimpl String.Chars, for: Person do
    def to_string(person) when person.birth_date != nil do
      "Person named #{person.name} and aged #{Person.age(person)}"
    end

    def to_string(person) when person.birth_date == nil do
      "Person named #{person.name}"
    end

  end

end
