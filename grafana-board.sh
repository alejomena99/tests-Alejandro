curl -X GET \
  -u admin:'!!Colombia123456789!!' \
  https://osmioqa.grupo-exito.com/apiobs/grafana/api/org

curl -X GET \
  -u admin:'!!Colombia123456789!!' \
  https://osmioqa.grupo-exito.com/apiobs/grafana/api/folders

curl -X POST \
  -u admin:'!!Colombia123456789!!' \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d    '{
            "dashboard": {
            
            },
            "folderUid": "",
            "message": "",
            "overwrite": false
        }' \
  https://osmioqa.grupo-exito.com/apiobs/grafana/api/dashboards/db

curl -X POST \
  -u admin:'!!Colombia123456789!!' \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -d    '{
            "dashboard": {
            
                "annotations": {
                    "list": [
                    {
                        "builtIn": 1,
                        "datasource": {
                        "type": "grafana",
                        "uid": "-- Grafana --"
                        },
                        "enable": true,
                        "hide": true,
                        "iconColor": "rgba(0, 211, 255, 1)",
                        "name": "Annotations & Alerts",
                        "type": "dashboard"
                    }
                    ]
                },
                "editable": true,
                "fiscalYearStartMonth": 0,
                "graphTooltip": 0,
                "links": [],
                "panels": [
                {
                    "datasource": {
                    "type": "prometheus",
                    "uid": "def9d31e-58dd-45e8-bb85-056e657cdfc6"
                    },
                    "fieldConfig": {
                    "defaults": {
                        "color": {
                        "mode": "palette-classic"
                        },
                        "custom": {
                        "axisBorderShow": false,
                        "axisCenteredZero": false,
                        "axisColorMode": "text",
                        "axisLabel": "",
                        "axisPlacement": "auto",
                        "barAlignment": 0,
                        "drawStyle": "line",
                        "fillOpacity": 0,
                        "gradientMode": "none",
                        "hideFrom": {
                            "legend": false,
                            "tooltip": false,
                            "viz": false
                        },
                        "insertNulls": false,
                        "lineInterpolation": "linear",
                        "lineWidth": 1,
                        "pointSize": 5,
                        "scaleDistribution": {
                            "type": "linear"
                        },
                        "showPoints": "auto",
                        "spanNulls": false,
                        "stacking": {
                            "group": "A",
                            "mode": "none"
                        },
                        "thresholdsStyle": {
                            "mode": "off"
                        }
                        },
                        "mappings": [],
                        "thresholds": {
                        "mode": "absolute",
                        "steps": [
                            {
                            "color": "green",
                            "value": null
                            },
                            {
                            "color": "red",
                            "value": 80
                            }
                        ]
                        }
                    },
                    "overrides": []
                    },
                    "gridPos": {
                    "h": 8,
                    "w": 12,
                    "x": 0,
                    "y": 0
                    },
                    "id": 1,
                    "options": {
                    "legend": {
                        "calcs": [],
                        "displayMode": "list",
                        "placement": "bottom",
                        "showLegend": true
                    },
                    "tooltip": {
                        "mode": "single",
                        "sort": "none"
                    }
                    },
                    "targets": [
                    {
                        "datasource": {
                        "type": "prometheus",
                        "uid": "def9d31e-58dd-45e8-bb85-056e657cdfc6"
                        },
                        "disableTextWrap": false,
                        "editorMode": "builder",
                        "expr": "cache_gets_total",
                        "fullMetaSearch": false,
                        "includeNullMetadata": true,
                        "instant": false,
                        "legendFormat": "__auto",
                        "range": true,
                        "refId": "A",
                        "useBackend": false
                    }
                    ],
                    "title": "Panel Title",
                    "type": "timeseries"
                }
                ],
                "schemaVersion": 39,
                "tags": [],
                "templating": {
                "list": []
                },
                "time": {
                "from": "now-6h",
                "to": "now"
                },
                "timepicker": {},
                "timezone": "browser",
                "title": "AlejoTest",
                "version": 0,
                "weekStart": "",
                "id": null,
                "uid": ""

            },
            "folderUid": "",
            "message": "",
            "overwrite": false
        }' \
  https://osmioqa.grupo-exito.com/apiobs/grafana/api/dashboards/db


y esto que esta dentro del board
 
    "timepicker": {},
    "timezone": "browser",
    "title": "AlejoTest",
    "version": 0, # FLAG
    "weekStart": "",
    "id": null, # FLAG
    "uid": "" # FLAG
 
En el que genera grafana
 
    "timepicker": {},
    "timezone": "browser",
    "title": "AlejoTest",
    "version": 1, # FLAG
    "weekStart": ""
    "id": 23, # FLAG
    "uid": "bdiueoflj0hkwf", # FLAG