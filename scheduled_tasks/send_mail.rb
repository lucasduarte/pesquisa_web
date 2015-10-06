class SendMail < Scheduler::SchedulerTask
  every '2m'

  #scheduler_daemon run
  def run
    Alert.check_prices
    log("Alertas por Email Enviadas!!")
    Alert.remove_alerts
    log("Alertas Excluídas!")
  end
end