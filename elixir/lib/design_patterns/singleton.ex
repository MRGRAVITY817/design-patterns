defmodule Singleton.Stack do
  use GenServer

  @name :singleton_stack
  @initial_value []

  # Client API

  def start_link() do
    GenServer.start_link(__MODULE__, @initial_value, name: @name)
  end

  def value() do
    GenServer.call(@name, :read)
  end

  def push(element) do
    GenServer.cast(@name, {:push, element})
  end

  def pop() do
    GenServer.call(@name, :pop)
  end

  # Server (callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_call(:read, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  @impl true
  def handle_call(:pop, _from, state) do
    [new_state | to_caller] = state
    {:reply, to_caller, new_state}
  end

  @impl true
  def handle_cast({:push, element}, state) do
    new_state = [state | element]
    {:noreply, new_state}
  end
end

# Client can start singleton as GenServer
Singleton.Stack.start_link()
# []
Singleton.Stack.value()

Singleton.Stack.push(1)
Singleton.Stack.push(2)
Singleton.Stack.push(3)
# [1, 2, 3]
Singleton.Stack.value()

# 3
Singleton.Stack.pop()
# 2
Singleton.Stack.pop()
# 1
Singleton.Stack.pop()
# nil
Singleton.Stack.pop()
# []
Singleton.Stack.value()
