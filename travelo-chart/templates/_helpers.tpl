{{/*
Génère un nom standard pour les ressources
Exemple: si Release.Name = "travelo", retourne "travelo-mysql"
*/}}
{{- define "travelo.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Génère les labels standards pour toutes les ressources
À utiliser avec: {{- include "travelo.labels" . | nindent 4 }}
*/}}
{{- define "travelo.labels" -}}
app.kubernetes.io/name: travelo
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app: travelo
{{- end -}}

{{/*
Labels spécifiques pour le selector (sous-ensemble plus stable des labels)
Helm impose: les selector labels ne doivent pas changer entre versions
*/}}
{{- define "travelo.selectorLabels" -}}
app.kubernetes.io/name: travelo
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}