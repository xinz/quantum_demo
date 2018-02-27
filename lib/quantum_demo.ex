defmodule QuantumDemo do

  require Logger

  def run_cleaner() do
    Logger.info "run cleaner on #{inspect node()}"
  end

end
