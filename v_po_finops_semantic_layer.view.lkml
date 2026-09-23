view: v_po_finops_semantic_layer {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_po_finops_semantic_layer` ;;

  dimension: po_code {
    type: string
    sql: ${TABLE}.po_code ;;
    label: "PO (Centro di Costo)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11.5px;font-weight:700;color:#2563eb;background:#eff6ff;border:1px solid #bfdbfe;padding:3px 8px;border-radius:6px;">{{ value }}</span> ;;
  }
  dimension: po_name {
    type: string
    sql: ${TABLE}.po_name ;;
    label: "Nome PO"
    html: <span style="font-family:'Inter',sans-serif;font-weight:700;color:#0f172a;">{{ value }}</span> ;;
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
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11px;font-weight:600;color:#475569;background:#f1f5f9;padding:2px 8px;border-radius:5px;text-transform:uppercase;">{{ value }}</span> ;;
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
    html: <span style="font-family:'JetBrains Mono',monospace;font-weight:700;color:#0f172a;">{{ rendered_value }}/m</span> ;;
  }
  measure: total_commitment_savings_eur {
    type: sum
    sql: ${TABLE}.commitment_savings_eur ;;
    value_format_name: eur_0
    label: "Risparmio CUD / FSP 90gg (€)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-weight:700;color:#059669;background:#ecfdf5;padding:3px 8px;border-radius:6px;">-{{ rendered_value }}</span> ;;
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
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11.5px;font-weight:700;color:#2563eb;background:#eff6ff;border:1px solid #bfdbfe;padding:3px 8px;border-radius:6px;">{{ value }}</span> ;;
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
    html:
      {% if value contains 'REJECTED' %}
        <span style="font-family:'JetBrains Mono',monospace;font-size:11px;font-weight:700;color:#dc2626;background:#fef2f2;padding:3px 8px;border-radius:6px;">✕ {{ value }}</span>
      {% else %}
        <span style="font-family:'JetBrains Mono',monospace;font-size:11px;font-weight:700;color:#059669;background:#ecfdf5;padding:3px 8px;border-radius:6px;">✓ {{ value }}</span>
      {% endif %} ;;
  }
  measure: raw_claimed_monthly_savings_eur {
    type: sum
    sql: ${TABLE}.raw_claimed_monthly_savings_eur ;;
    value_format_name: eur_0
    label: "Saving Grezzo Dichiarato (€/m)"
  }
  measure: verified_net_monthly_savings_eur {
    type: sum
    sql: ${TABLE}.verified_net_monthly_savings_eur ;;
    value_format_name: eur_0
    label: "Saving Netto Validato dall'AI (€/m)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-weight:700;color:#059669;background:#ecfdf5;padding:3px 8px;border-radius:6px;">-{{ rendered_value }}/m</span> ;;
  }
}
