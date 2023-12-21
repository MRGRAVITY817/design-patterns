# Participants
# - Client
# - Target
# - Adapter
# - Adaptee

defmodule Shape do
  @moduledoc """
  Target, a behavior that shape modules should implement
  """
  @type coordinate() :: tuple()

  @callback bounding_box() :: list(coordinate())
  @callback drag_object() :: coordinate()
end

defmodule TextShape do
  @moduledoc """
  Adapter, implements `Shape` behavior and delegates `TextField.get_shape()` method
  """
  @behaviour Shape

  def bounding_box() do
    TextField.get_shape()
  end

  def drag_object() do
    # final center coordinate after drag
    {11, 22}
  end
end

defmodule TextField do
  @moduledoc """
  Adaptee, unrelaed to `Shape` but can work together via `TextShape` adapter.
  """

  def get_shape() do
    [{0, 0}, {12, 2}, {12, 0}, {0, 2}]
  end
end
