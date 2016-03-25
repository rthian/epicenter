module ApplicationHelper
  def flash_notice(flash, &block)
    flash_class = 'alert alert-success' if flash[:notice]
    flash_class = 'alert alert-danger'  if flash[:alert]
    content_tag(:div, class: flash_class, &block)
  end

  def hide_navbar
    current_page?(new_code_of_conduct_path) ||
    current_page?(new_refund_policy_path) ||
    current_page?(new_enrollment_agreement_path) ||
    current_page?(certificate_path) ||
    current_page?(transcript_path) ||
    current_page?(welcome_path) ||
    current_page?(user_session_path) ||
    current_page?(new_user_password_path) ||
    current_page?(root_path) ||
    current_page?(new_company_registration_path) ||
    params[:controller] == 'attendance_sign_out'
  end

  def set_navbar_link_class(controller_name, &block)
    if params[:controller] == controller_name
      content_tag(:li, class: 'active', &block)
    else
      content_tag(:li, &block)
    end
  end
end
