{
  /**
   * Creates a [Azure target]
   * to be added to panels.
   *
   * @name azure.target
   *
   * @param 
   * @param 
   * @param 
   * @param 
   * @param datasource (optional) Name of the Prometheus datasource. Leave by default otherwise.
   * @param
   * @param 
   * @param 
   *
   * @return A Azure target to be added to panels.
   */

 target(
    azureMonitor,
    queryType='Azure Monitor',
    azureLogAnalytics=null,
    azureResourceGraph=null,
    appInsights=null,
    insightsAnalytics=null,
    subscription=null,
    subscriptions=null,
    datasource=null,
  ):: {
    azureMonitor: azureMonitor,
    [if datasource != null then 'datasource']: datasource,
  },
}