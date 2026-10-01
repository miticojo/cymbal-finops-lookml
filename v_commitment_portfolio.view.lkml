view: v_commitment_portfolio {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_commitment_portfolio` ;;
  label: "Rate Optimization & Commitment Portfolio (FOCUS 1.2)"

  dimension: commitment_id {
    primary_key: yes
    type: string
    label: "Commitment ID"
    sql: ${TABLE}.commitment_id ;;
  }

  dimension: provider_name {
    type: string
    label: "Cloud Provider"
    sql: ${TABLE}.provider_name ;;
  }

  dimension: commitment_type {
    type: string
    label: "Tipologia Commitment (CUD / FSP / RI)"
    sql: ${TABLE}.commitment_type ;;
  }

  dimension: cost_center_code {
    type: string
    label: "Centro di Costo & WBS"
    sql: ${TABLE}.cost_center_code ;;
  }

  dimension: status {
    type: string
    label: "Stato di Salute Commitment"
    sql: ${TABLE}.status ;;
  }

  dimension: action_plan {
    type: string
    label: "Piano di Azione FinOps"
    sql: ${TABLE}.action_plan ;;
  }

  dimension: expiration_date {
    type: date
    label: "Data Scadenza Impegno"
    sql: CAST(${TABLE}.expiration_date AS DATE) ;;
  }

  measure: eligible_monthly_spend_eur {
    type: sum
    label: "Spesa Mensile Eleggibile (€)"
    sql: ${TABLE}.eligible_monthly_spend_eur ;;
    value_format_name: eur_0
  }

  measure: covered_monthly_spend_eur {
    type: sum
    label: "Spesa Coperta da Commitment (€)"
    sql: ${TABLE}.covered_monthly_spend_eur ;;
    value_format_name: eur_0
  }

  measure: uncovered_ondemand_spend_eur {
    type: sum
    label: "Spesa Scoperta On-Demand (€)"
    sql: ${TABLE}.uncovered_ondemand_spend_eur ;;
    value_format_name: eur_0
  }

  measure: unused_waste_monthly_eur {
    type: sum
    label: "Spreco Impegni Non Utilizzati (€/m)"
    sql: ${TABLE}.unused_waste_monthly_eur ;;
    value_format_name: eur_0
  }

  measure: average_coverage_rate_pct {
    type: average
    label: "Tasso di Copertura Medio (%)"
    sql: ${TABLE}.coverage_rate_pct ;;
    value_format: "0.0\\%"
  }

  measure: average_utilization_rate_pct {
    type: average
    label: "Tasso di Utilizzo Medio (%)"
    sql: ${TABLE}.utilization_rate_pct ;;
    value_format: "0.0\\%"
  }
}
