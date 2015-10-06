class SearchTask < Scheduler::SchedulerTask
  every '2m'

  #bundle exec scheduler_daemon run
  def run
    Search.update_prices
    log("Lista de preços atualizada!")
  end

end
