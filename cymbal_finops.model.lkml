connection: "default_bigquery_connection"
include: "*.view.lkml"

explore: cymbal_po_finops_executive {
  from: v_po_finops_semantic_layer
  label: "Cymbal Telco — FinOps FOCUS 1.2 & AI Tokenomics per PO"
  description: "Single Source of Truth (SSOT) per gli Agenti AI e per le Dashboard PO (PO-100, PO-200, PO-300)"

  join: multicloud_recommender_hub {
    type: left_outer
    relationship: many_to_one
    sql_on: ${cymbal_po_finops_executive.po_code} = ${multicloud_recommender_hub.po_code} ;;
  }
}

explore: v_po_finops_semantic_layer {
  label: "Cymbal Telco — Semantic Layer PO (FOCUS 1.2)"
  description: "Vista Semantica Governata per gli Agenti AI (cymbal-finops-governor)"
}
