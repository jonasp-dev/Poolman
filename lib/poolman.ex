defmodule Poolman do
  use Application

  def start(_type, _args) do
    pool_config = [mfa: {Poolman.SampleWorker, :start_link, []}, size: 5]
    start_pool(pool_config)
  end
  
  def start_pool(pool_config) do
      Poolman.Supervisor.start_link(pool_config)
  end

  def checkout do
    Poolman.Server.checkout
  end

  def checkin(worker_pid) do
    Poolman.Server.checkin(worker_pid)
  end

  def status do
    Poolman.Server.status
  end
end
