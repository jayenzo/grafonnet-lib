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
    queryType,
    subscription,
    azureResourceGraph,
    appInsights,
    insightsAnalytics,
    subscriptions,
    azureLogAnalytics,
    datasource=null,
  ):: {
    azureMonitor: azureMonitor,
    queryType: queryType,
    subscription: subscription,
    azureResourceGraph: azureResourceGraph,
    appInsights: appInsights,
    insightsAnalytics: insightsAnalytics,
    subscriptions: subscriptions,
    azureLogAnalytics: azureLogAnalytics,
    [if datasource != null then 'datasource']: datasource,
  },
}