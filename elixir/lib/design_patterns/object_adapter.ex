# Participants
# - Client
# - Target
# - Adapter
# - Adaptee

defmodule DesignPatterns.ObjectAdapter.Shape do
  @moduledoc """
  Target, a behavior that shape modules should implement
  """
  @type t :: term()
  @type coordinate :: tuple()

  @callback bounding_box(shape :: Shape.t()) :: list(coordinate)
  @callback drag_object(shape :: Shape.t()) :: coordinate
end

defmodule DesignPatterns.ObjectAdapter.TextShape do
  @moduledoc """
  Adapter, delegates `TextShape.bounding_box()` method via `TextField` module within struct
  """
  @behaviour DesignPatterns.ObjectAdapter.Shape

  defstruct text_field: DesignPatterns.ObjectAdapter.TextField

  alias __MODULE__

  def bounding_box(%TextShape{text_field: text_field}) do
    text_field.get_shape()
  end

  def drag_object(%TextShape{} = _) do
    # final center coordinate after drag
    {11, 22}
  end
end

defmodule DesignPatterns.ObjectAdapter.TextField do
  @moduledoc """
  Adaptee, unrelaed to `Shape` but can work together via `TextShape` adapter.
  """

  def get_shape() do
    [{0, 0}, {12, 2}, {12, 0}, {0, 2}]
  end
end
