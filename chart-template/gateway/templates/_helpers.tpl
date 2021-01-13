{{/*
Expand the name of the chart.
*/}}
{{- define "authentication-gateway.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "authentication-gateway.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "authentication-gateway.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Generate labels.
*/}}
{{- define "authentication-gateway.labels" -}}
chart: {{ template "authentication-gateway.chart" . }}
client: {{ .Values.client }}
component: {{ template "authentication-gateway.name" . }}
env: {{ .Values.environment }}
instance: {{ .Release.Name }}
managed-by: La-team-{{ template "authentication-gateway.name" . }}
version: {{ .Values.application.image.tag }}
{{- end }}
