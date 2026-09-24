view: v_po_finops_semantic_layer {
  sql_table_name: `giorgioc-looker.cymbal_finops_focus.v_po_finops_semantic_layer` ;;
  label: "Riconciliazione FinOps 3-Livelli (CdC/WBS ↔ PO SAP/Fattura ↔ Project ID)"

  dimension: po_code {
    type: string
    sql: ${TABLE}.po_code ;;
    label: "CdC & WBS Demand (Controlling / IT Demand)"
    description: "Identificativo combinato Centro di Costo (CdC) e WBS Demand IT / VBC (es. CDC-200 (WBS-DEM-DATA-200))"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11.5px;font-weight:700;color:#2563eb;background:#eff6ff;border:1px solid #bfdbfe;padding:3px 8px;border-radius:6px;">{{ value }}</span> ;;
  }
  dimension: cdc_code {
    type: string
    sql: ${TABLE}.cdc_code ;;
    label: "Centro di Costo (CdC)"
    description: "Codice Centro di Costo Controlling / Budget Owner (CDC-100, CDC-200, CDC-300)"
  }
  dimension: wbs_demand_code {
    type: string
    sql: ${TABLE}.wbs_demand_code ;;
    label: "Codice WBS Demand (VBC)"
    description: "Work Breakdown Structure (WBS / VBC) dell'area IT Demand (WBS-DEM-AI-100, WBS-DEM-DATA-200, WBS-DEM-CORE-300)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11px;font-weight:700;color:#0f172a;background:#f1f5f9;border:1px solid #cbd5e1;padding:2px 7px;border-radius:5px;">{{ value }}</span> ;;
  }
  dimension: business_unit_name {
    type: string
    sql: ${TABLE}.business_unit_name ;;
    label: "Business Unit / Direzione IT Demand"
  }
  dimension: po_name {
    type: string
    sql: ${TABLE}.po_name ;;
    label: "BU + Purchase Order SAP + Fattura"
    html: <span style="font-family:'Inter',sans-serif;font-weight:700;color:#0f172a;">{{ value }}</span> ;;
  }
  dimension: sap_purchase_order_id {
    type: string
    sql: ${TABLE}.sap_purchase_order_id ;;
    label: "Purchase Order SAP (Ufficio Acquisti)"
    description: "Ordine d'Acquisto SAP emesso dall'Ufficio Acquisti (PO-SAP-45009101, PO-SAP-45009205, PO-SAP-45009312)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11px;font-weight:700;color:#7c3aed;background:#f5f3ff;border:1px solid #ddd6fe;padding:2px 8px;border-radius:6px;">{{ value }}</span> ;;
  }
  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
    label: "Fattura Passiva (Invoice ID)"
    description: "Fattura passiva mensile del fornitore Cloud riconciliata sul PO SAP (INV-2026-09-FSP-9101, INV-2026-09-DATA-9205, INV-2026-09-CORE-9312)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11px;font-weight:600;color:#334155;background:#f8fafc;border:1px solid #e2e8f0;padding:2px 7px;border-radius:5px;">{{ value }}</span> ;;
  }
  dimension: contract_commitment_type {
    type: string
    sql: ${TABLE}.contract_commitment_type ;;
    label: "Contratto & Commitment Quadro"
  }
  dimension: po_burnout_date_as_is {
    type: string
    sql: ${TABLE}.po_burnout_date_as_is ;;
    label: "Burn-Out Date Plafond PO (As-Is)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11px;font-weight:700;color:#dc2626;background:#fef2f2;padding:2px 7px;border-radius:5px;">⚠️ {{ value }} -> ✅ 2026-12-31</span> ;;
  }
  dimension: po_burnout_date_remediated {
    type: string
    sql: ${TABLE}.po_burnout_date_remediated ;;
    label: "Burn-Out Date Plafond PO (Post-Fix)"
  }
  dimension: technical_project_account_id {
    type: string
    sql: ${TABLE}.technical_project_account_id ;;
    label: "Project ID / Account / Subscription Cloud"
    description: "Risorse tecniche Cloud (GCP Project ID, AWS Account, Azure Subscription, OCI Tenancy) ribaltate sulla WBS e sul PO SAP"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11px;color:#0369a1;background:#f0f9ff;padding:2px 7px;border-radius:5px;">{{ value }}</span> ;;
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
  dimension: remediation_plan {
    type: string
    sql: ${TABLE}.remediation_plan ;;
    label: "Piano di Remediation (Best Practices MCP)"
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
  measure: total_identifiable_waste_eur {
    type: sum
    sql: ${TABLE}.identifiable_waste_eur ;;
    value_format_name: eur_0
    label: "Saving Mensile da Best Practices (€/m)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-weight:700;color:#059669;background:#ecfdf5;padding:3px 8px;border-radius:6px;">-{{ rendered_value }}/m</span> ;;
  }
  measure: total_projected_eom_eur {
    type: sum
    sql: ${TABLE}.projected_eom_eur ;;
    value_format_name: eur_0
    label: "Proiezione Fine Mese As-Is (€/m)"
  }
  measure: total_post_remediation_eom_eur {
    type: sum
    sql: ${TABLE}.post_remediation_eom_eur ;;
    value_format_name: eur_0
    label: "Proiezione Fine Mese Post-Remediation (€/m)"
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
    label: "CdC & WBS Demand (Controlling / IT Demand)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-size:11.5px;font-weight:700;color:#2563eb;background:#eff6ff;border:1px solid #bfdbfe;padding:3px 8px;border-radius:6px;">{{ value }}</span> ;;
  }
  dimension: cdc_code {
    type: string
    sql: ${TABLE}.cdc_code ;;
    label: "Centro di Costo (CdC)"
  }
  dimension: wbs_demand_code {
    type: string
    sql: ${TABLE}.wbs_demand_code ;;
    label: "Codice WBS Demand (VBC)"
  }
  dimension: sap_purchase_order_id {
    type: string
    sql: ${TABLE}.sap_purchase_order_id ;;
    label: "Purchase Order SAP (Ufficio Acquisti)"
  }
  dimension: invoice_id {
    type: string
    sql: ${TABLE}.invoice_id ;;
    label: "Fattura Passiva (Invoice ID)"
  }
  dimension: technical_project_account_id {
    type: string
    sql: ${TABLE}.technical_project_account_id ;;
    label: "Project ID / Account Cloud"
  }
  dimension: source_engine {
    type: string
    sql: ${TABLE}.source_engine ;;
    label: "Recommender Engine + MCP"
  }
  dimension: raw_recommendation {
    type: string
    sql: ${TABLE}.raw_recommendation ;;
    label: "Best Practice Tecnica Identificata"
  }
  dimension: ai_feasibility_verdict {
    type: string
    sql: ${TABLE}.ai_feasibility_verdict ;;
    label: "Verdetto Architetturale AI (Gemini 3.8 Flash)"
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
    label: "Saving Netto Validato da Gemini 3.8 Flash (€/m)"
    html: <span style="font-family:'JetBrains Mono',monospace;font-weight:700;color:#059669;background:#ecfdf5;padding:3px 8px;border-radius:6px;">-{{ rendered_value }}/m</span> ;;
  }
}
