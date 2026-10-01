view: v_tagging_hygiene_matrix {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_tagging_hygiene_matrix` ;;
  label: "Tagging Hygiene & Policy Drift Matrix"

  dimension: project_id {
    primary_key: yes
    type: string
    label: "Cloud Project ID / Account"
    sql: ${TABLE}.project_id ;;
  }

  dimension: provider_name {
    type: string
    label: "Cloud Provider"
    sql: ${TABLE}.provider_name ;;
  }

  dimension: environment {
    type: string
    label: "Ambiente (prod / stage / dev / sandbox / dr)"
    sql: ${TABLE}.environment ;;
  }

  dimension: tagging_compliance_status {
    type: string
    label: "Stato Conformità Tagging"
    sql: ${TABLE}.tagging_compliance_status ;;
  }

  dimension: drift_root_cause {
    type: string
    label: "Causa Radice del Policy Drift"
    sql: ${TABLE}.drift_root_cause ;;
  }

  dimension: accounting_reallocation_rule {
    type: string
    label: "Regola di Riallocazione Contabile"
    sql: ${TABLE}.accounting_reallocation_rule ;;
  }

  measure: total_monthly_cost_eur {
    type: sum
    label: "Costo Mensile Totale Progetto (€)"
    sql: ${TABLE}.total_monthly_cost_eur ;;
    value_format_name: eur_0
  }

  measure: unallocated_cost_eur {
    type: sum
    label: "Spesa Non Allocata (€)"
    sql: ${TABLE}.unallocated_cost_eur ;;
    value_format_name: eur_0
  }

  measure: average_compliance_score_pct {
    type: average
    label: "Score Medio Conformità Tagging (%)"
    sql: ${TABLE}.compliance_score_pct ;;
    value_format: "0.0\\%"
  }
}
