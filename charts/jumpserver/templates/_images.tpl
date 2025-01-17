{{/*
Return the proper image name
{{ include "common.images.image" ( dict "imageRoot" .Values.path.to.the.image "global" $) }}
*/}}
{{- define "common.images.image" -}}
{{- $registryName := .imageRoot.registry -}}
{{- $repositoryName := .imageRoot.repository -}}
{{- $tag := .imageRoot.tag | toString -}}
{{- if .global }}
{{- if .global.imageRegistry }}
{{- $registryName = .global.imageRegistry -}}
{{- end -}}
{{- if .global.imageTag }}
{{- $tag = .global.imageTag -}}
{{- end -}}
{{- end -}}
{{- if $registryName }}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
{{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}


{{/*
Return the proper JumpServer Core image name
*/}}
{{- define "jumpserver.coreImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.core.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer koko image name
*/}}
{{- define "jumpserver.kokoImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.koko.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer web image name
*/}}
{{- define "jumpserver.webImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.web.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer lion image name
*/}}
{{- define "jumpserver.lionImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.lion.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer magnus image name
*/}}
{{- define "jumpserver.magnusImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.magnus.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer chen image name
*/}}
{{- define "jumpserver.chenImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.chen.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer kael image name
*/}}
{{- define "jumpserver.kaelImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.kael.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer razor image name
*/}}
{{- define "jumpserver.razorImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.razor.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer xrdp image name
*/}}
{{- define "jumpserver.xrdpImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.xrdp.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper JumpServer video image name
*/}}
{{- define "jumpserver.videoImage" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.video.image "global" .Values.global ) -}}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names (deprecated: use common.images.renderPullSecrets instead)
{{ include "common.images.pullSecrets" ( dict "images" (list .Values.path.to.the.image1, .Values.path.to.the.image2) "global" .Values.global) }}
*/}}
{{- define "common.images.pullSecrets" -}}
{{- $pullSecrets := list }}

{{- if .global }}
{{- range .global.imagePullSecrets -}}
{{- $pullSecrets = append $pullSecrets . -}}
{{- end -}}
{{- end -}}

{{- range .images -}}
{{- range .pullSecrets -}}
{{- $pullSecrets = append $pullSecrets . -}}
{{- end -}}
{{- end -}}

{{- if (not (empty $pullSecrets)) }}
imagePullSecrets:
{{- range $pullSecrets }}
- name: {{ . }}
{{- end }}
{{- end }}
{{- end -}}
