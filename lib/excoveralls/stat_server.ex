defmodule ExCoveralls.StatServer do
  @moduledoc """
  Provide data-store for coverage stats.
  """

  def start do
    Agent.start_link(fn -> HashSet.new end, name: __MODULE__)
  end

  def stop do
    Agent.stop(__MODULE__)
  end

  def add(report) do
    Agent.update(__MODULE__, &Set.put(&1, report))
  end

  def get do
    Agent.get(__MODULE__, &(&1))
  end
end
