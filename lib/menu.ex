defmodule Menu do
  defstruct [:day, :name]

  defimpl String.Chars, for: Menu do
    def to_string(menu) do
      "#{menu.day} = {menu.name}"
    end


  end

end
