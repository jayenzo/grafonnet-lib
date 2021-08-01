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
    azureLogAnalytics,
    azureResourceGraph,
    appInsights,
    insightsAnalytics,
    subscription,
    subscriptions,
    datasource=null,
  ):: {
    [if hide != null then 'hide']: hide,
    [if datasource != null then 'datasource']: datasource,
    expr: expr,
    format: format,
    intervalFactor: intervalFactor,
    legendFormat: legendFormat,
    [if interval != null then 'interval']: interval,
    [if instant != null then 'instant']: instant,
  },
}