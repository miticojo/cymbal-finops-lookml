view: v_po_finops_semantic_layer {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_po_finops_semantic_layer` ;;

  dimension: po_code {
    type: string
    sql: ${TABLE}.po_code ;;
    label: "PO (Centro di Costo)"
  }
  dimension: po_name {
    type: string
    sql: ${TABLE}.po_name ;;
    label: "Nome PO"
  }
  dimension: provider_name {
    type: string
    sql: ${TABLE}.provider_name ;;
    label: "Cloud / Data Provider (FOCUS 1.2)"
  }
  dimension: environment {
    type: string
    sql: ${TABLE}.environment ;;
    label: "Ambiente (prod / stage / dev / sandbox / dr)"
  }
  dimension: architecture_tier {
    type: string
    sql: ${TABLE}.architecture_tier ;;
    label: "Tier Architetturale"
  }
  dimension: service_name {
    type: string
    sql: ${TABLE}.service_name ;;
    label: "Servizio Cloud"
  }
  dimension: pricing_category {
    type: string
    sql: ${TABLE}.pricing_category ;;
    label: "Pricing Category (FOCUS 1.2)"
  }
  measure: total_list_cost_eur {
    type: sum
    sql: ${TABLE}.list_cost_eur ;;
    value_format_name: eur_0
    label: "List Cost 90gg (€)"
  }
  measure: total_effective_cost_eur {
    type: sum
    sql: ${TABLE}.effective_cost_eur ;;
    value_format_name: eur_0
    label: "Effective Cost 90gg (€)"
  }
  measure: monthly_effective_cost_eur {
    type: number
    sql: ${total_effective_cost_eur} / 3.0 ;;
    value_format_name: eur_0
    label: "Spesa Mensile Netta (€/m)"
  }
  measure: total_commitment_savings_eur {
    type: sum
    sql: ${TABLE}.commitment_savings_eur ;;
    value_format_name: eur_0
    label: "Risparmio CUD / FSP 90gg (€)"
  }
}

view: multicloud_recommender_hub {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.multicloud_recommender_hub` ;;

  dimension: recommendation_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.recommendation_id ;;
  }

  dimension: po_code {
    type: string
    sql: ${TABLE}.po_code ;;
    label: "PO (Centro di Costo)"
  }
  dimension: source_engine {
    type: string
    sql: ${TABLE}.source_engine ;;
    label: "Recommender Engine"
  }
  dimension: raw_recommendation {
    type: string
    sql: ${TABLE}.raw_recommendation ;;
    label: "Azione Proposta"
  }
  dimension: ai_feasibility_verdict {
    type: string
    sql: ${TABLE}.ai_feasibility_verdict ;;
    label: "Verdetto Architetturale AI"
  }
  measure: raw_claimed_monthly_savings_eur {
    type: sum
    sql: ${TABLE}.raw_claimed_monthly_savings_eur ;;
    value_format_name: eur_0
    label: "Risparmio Grezzo Dichiarato (€/m)"
  }
  measure: verified_net_monthly_savings_eur {
    type: sum
    sql: ${TABLE}.verified_net_monthly_savings_eur ;;
    value_format_name: eur_0
    label: "Risparmio Netto Validato dall'AI (€/m)"
  }
}
