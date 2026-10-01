view: v_finops_practitioner_workbench {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_finops_practitioner_workbench` ;;
  label: "FinOps Explorer — Progetti Aziendali, CdC, Ambienti & Domini Cloud"

  dimension: workload_id {
    primary_key: yes
    type: string
    label: "Workload ID"
    sql: ${TABLE}.workload_id ;;
  }
  dimension: cloud_domain {
    type: string
    label: "Dominio Cloud (Data & BigQuery / Infrastruttura / AI)"
    sql: ${TABLE}.cloud_domain ;;
  }
  dimension: provider_name {
    type: string
    label: "Cloud Provider"
    sql: ${TABLE}.provider_name ;;
  }
  dimension: service_category {
    type: string
    label: "Servizio Cloud"
    sql: ${TABLE}.service_category ;;
  }
  dimension: corporate_project_name {
    type: string
    label: "Progetto Aziendale"
    sql: ${TABLE}.corporate_project_name ;;
  }
  dimension: cloud_project_id {
    type: string
    label: "Cloud Project ID / Account"
    sql: ${TABLE}.cloud_project_id ;;
  }
  dimension: cdc_code {
    type: string
    label: "Centro di Costo (CdC / Unallocated)"
    sql: ${TABLE}.cdc_code ;;
  }
  dimension: environment {
    type: string
    label: "Ambiente (prod / stage / dev / sandbox / dr)"
    sql: ${TABLE}.environment ;;
  }
  dimension: pricing_model {
    type: string
    label: "Modello di Pricing / Commitment"
    sql: ${TABLE}.pricing_model ;;
  }
  dimension: tag_compliance_status {
    type: string
    label: "Stato Tagging FinOps"
    sql: ${TABLE}.tag_compliance_status ;;
  }
  dimension: waste_category {
    type: string
    label: "Categoria di Spreco / Inefficienza"
    sql: ${TABLE}.waste_category ;;
  }
  dimension: optimization_insight {
    type: string
    label: "Diagnosi & Causa Radice"
    sql: ${TABLE}.optimization_insight ;;
  }
  dimension: remediation_cli_or_sql {
    type: string
    label: "Remediation SQL / CLI / DDL"
    sql: ${TABLE}.remediation_cli_or_sql ;;
  }
  measure: total_monthly_actual_cost_eur {
    type: sum
    label: "Spesa Attuale Mensile (€/m)"
    sql: ${TABLE}.monthly_actual_cost_eur ;;
    value_format_name: eur_0
  }
  measure: total_monthly_waste_eur {
    type: sum
    label: "Saving Identificato (€/m)"
    sql: ${TABLE}.monthly_waste_eur ;;
    value_format_name: eur_0
  }
  measure: total_monthly_optimized_cost_eur {
    type: sum
    label: "Spesa Ottimizzata Target (€/m)"
    sql: ${TABLE}.monthly_optimized_cost_eur ;;
    value_format_name: eur_0
  }
}

view: v_bigquery_cost_anatomy {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_bigquery_cost_anatomy` ;;
  label: "Focus BigQuery — Anatomia Costi (Compute Slots, On-Demand TiB, Storage Logical/Physical & Time-Travel)"

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
  dimension: cloud_project_id {
    type: string
    label: "Project ID BigQuery"
    sql: ${TABLE}.cloud_project_id ;;
  }
  dimension: cdc_code {
    type: string
    label: "Centro di Costo (CdC)"
    sql: ${TABLE}.cdc_code ;;
  }
  dimension: environment {
    type: string
    label: "Ambiente"
    sql: ${TABLE}.environment ;;
  }
  dimension: anomaly_pattern {
    type: string
    label: "Pattern di Inefficienza BigQuery"
    sql: ${TABLE}.anomaly_pattern ;;
  }
  dimension: root_cause_explanation {
    type: string
    label: "Meccanismo di Fatturazione & Causa"
    sql: ${TABLE}.root_cause_explanation ;;
  }
  dimension: finops_best_practice {
    type: string
    label: "Best Practice Architetturale"
    sql: ${TABLE}.finops_best_practice ;;
  }
  dimension: diagnostic_information_schema_sql {
    type: string
    label: "Query Diagnostica INFORMATION_SCHEMA"
    sql: ${TABLE}.diagnostic_information_schema_sql ;;
  }
  measure: total_monthly_cost_eur {
    type: sum
    label: "Costo Mensile BigQuery (€/m)"
    sql: ${TABLE}.monthly_cost_eur ;;
    value_format_name: eur_0
  }
  measure: total_monthly_savable_eur {
    type: sum
    label: "Saving Mensile BigQuery (€/m)"
    sql: ${TABLE}.monthly_savable_eur ;;
    value_format_name: eur_0
  }
}
