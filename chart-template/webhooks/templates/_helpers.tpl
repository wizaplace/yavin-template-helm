{{/*
Expand the name of the chart.
*/}}
{{- define "webhooks.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "webhooks.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "webhooks.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Generate labels.
*/}}
{{- define "webhooks.labels" -}}
chart: {{ template "webhooks.chart" . }}
client: {{ .Values.client }}
component: {{ template "webhooks.name" . }}
env: {{ .Values.environment }}
instance: {{ .Release.Name }}
managed-by: La-team-{{ template "webhooks.name" . }}
{{- end }}
