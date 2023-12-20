defmodule WeaponFactory do
  @moduledoc """
  Abstract factory for creating weapons
  """
  @type t :: module()

  @callback create_sword() :: Sword.t()
  @callback create_gun() :: Gun.t()
end

defmodule Sword do
  @moduledoc """
  Abstract product for sword
  """
  @type t :: module()

  @callback swing() :: :ok
end

defmodule Gun do
  @moduledoc """
  Abstract product for gun
  """
  @type t :: module()

  @callback shoot() :: :ok
end

defmodule TexasWeaponFactory do
  @moduledoc """
  Concreate factory for creating weapons in Texas
  """
  @behaviour WeaponFactory

  def create_sword() do
    TexasSword
  end

  def create_gun() do
    TexasGun
  end
end

defmodule TexasSword do
  @moduledoc """
  Concrete product for sword in Texas
  """
  @behaviour Sword

  def swing() do
    IO.puts("[ Sharp metalic sound ]")
  end
end

defmodule TexasGun do
  @moduledoc """
  Concrete product for gun in Texas
  """
  @behaviour Gun

  def shoot() do
    IO.puts("[ Bbaak Bbaak ]")
  end
end

defmodule ChildWeaponFactory do
  @moduledoc """
  Concreate factory for creating child's weapons
  """
  @behaviour WeaponFactory

  def create_sword() do
    ChildSword
  end

  def create_gun() do
    ChildGun
  end
end

defmodule ChildSword do
  @moduledoc """
  Concrete product for child's sword
  """
  @behaviour Sword

  def swing() do
    IO.puts("[ Plastic dull sound ]")
  end
end

defmodule ChildGun do
  @moduledoc """
  Concrete product for child's gun
  """
  @behaviour Gun

  def shoot() do
    IO.puts("[ Nerf Nerf ]")
  end
end

defmodule WeaponClient do
  @spec create_and_test_weapons(factory :: WeaponFactory.t()) :: :ok
  def create_and_test_weapons(factory) do
    sword = factory.create_sword()
    sword.swing()

    gun = factory.create_gun()
    gun.shoot()
  end
end
