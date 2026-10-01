view: v_bigquery_cost_anatomy {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_bigquery_cost_anatomy` ;;
  label: "Focus BigQuery — 4 Pilastri di Costo & Anatomia"

  dimension: pillar_id {
    primary_key: yes
    type: string
    label: "Pillar ID"
    sql: ${TABLE}.pillar_id ;;
  }

  dimension: bq_cost_pillar {
    type: string
    label: "Pilastro di Costo BigQuery"
    sql: ${TABLE}.bq_cost_pillar ;;
  }

  dimension: billed_project_id {
    type: string
    label: "Project ID Fatturato"
    sql: ${TABLE}.billed_project_id ;;
  }

  dimension: cdc_code {
    type: string
    label: "Centro di Costo"
    sql: ${TABLE}.cdc_code ;;
  }

  dimension: environment {
    type: string
    label: "Ambiente (prod / stage / dev)"
    sql: ${TABLE}.environment ;;
  }

  dimension: usage_metric {
    type: string
    label: "Metrica di Consumo"
    sql: ${TABLE}.usage_metric ;;
  }

  dimension: anomaly_pattern {
    type: string
    label: "Pattern di Inefficienza / Anomalia"
    sql: ${TABLE}.anomaly_pattern ;;
  }

  dimension: root_cause_explanation {
    type: string
    label: "Spiegazione Causa Radice"
    sql: ${TABLE}.root_cause_explanation ;;
  }

  dimension: finops_best_practice {
    type: string
    label: "Best Practice FinOps Applicata"
    sql: ${TABLE}.finops_best_practice ;;
  }

  dimension: diagnostic_information_schema_sql {
    type: string
    label: "Query INFORMATION_SCHEMA Diagnostica"
    sql: ${TABLE}.diagnostic_information_schema_sql ;;
  }

  measure: total_monthly_cost_eur {
    type: sum
    label: "Spesa Mensile Attuale (€)"
    sql: ${TABLE}.monthly_cost_eur ;;
    value_format_name: eur_0
  }

  measure: total_monthly_savable_eur {
    type: sum
    label: "Risparmio Mensile Estraibile (€)"
    sql: ${TABLE}.monthly_savable_eur ;;
    value_format_name: eur_0
  }
}
