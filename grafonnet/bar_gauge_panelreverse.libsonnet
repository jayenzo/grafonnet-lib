{
  /**
   * Create a [bar gauge panel](https://grafana.com/docs/grafana/latest/panels/visualizations/bar-gauge-panel/),
   *
   * @name barGaugePanel.new
   *
   * @param title Panel title.
   * @param description (optional) Panel description.
   * @param datasource (optional) Panel datasource.
   * @param unit (optional) The unit of the data.
   * @param thresholds (optional) An array of threashold values.
   *
   * @method addTarget(target) Adds a target object.
   * @method addTargets(targets) Adds an array of targets.
   */
  new(
    title,
    description=null,
    datasource=null,
    unit=null,
    thresholds=[],
  ):: {
    type: 'bargauge',
    title: title,
    [if description != null then 'description']: description,
    datasource: datasource,
    targets: [
    ],
   options: {
    reduceOptions: {
      values: false,
      calcs: [
        "lastNotNull"
      ],
      fields: ""
    },
    orientation: "horizontal",
    text: {},
    displayMode: "lcd",
    showUnfilled: true
  },

   fieldConfig: {
    defaults: {
      thresholds: {
        mode: "absolute",
        steps: [
            {
               "value": 10,
               "color": "red"
              },
              {
                "value": 20,
                "color": "orange"
              },
              {
                "value": 30,
                "color": "green"
              }
        ]
      },
      mappings: [],
      color: {
        "mode": "thresholds"
      },
      displayName: "Machine %"
    },
    overrides: []
    },
    // fieldConfig: {
    //   defaults: {
    //     unit: unit,
    //     thresholds: {
    //       mode: 'absolute',
    //       steps: 
    //     },
    //   },
    // },
    _nextTarget:: 0,
    addTarget(target):: self {
      // automatically ref id in added targets.
      local nextTarget = super._nextTarget,
      _nextTarget: nextTarget + 1,
      targets+: [target { refId: std.char(std.codepoint('A') + nextTarget) }],
    },
    addTargets(targets):: std.foldl(function(p, t) p.addTarget(t), targets, self),
  },
}
