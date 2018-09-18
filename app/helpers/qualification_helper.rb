# frozen_string_literal: true

module QualificationHelper
  def count_prospects(qualification)
    client_child_details_true = qualification.child_details.where(status: 'Client')
    if qualification.child_details.count == 0
      "Encore aucun Prospect".html_safe
    elsif qualification.child_details.count == 1
      "#{qualification.child_details.count} Prospect".html_safe
    elsif client_child_details_true.count == 1
      "#{qualification.child_details.count} Prospects dont #{client_child_details_true.count} Client".html_safe
    else
      "#{qualification.child_details.count} Prospects dont #{client_child_details_true.count} Clients".html_safe
    end
  end
end
