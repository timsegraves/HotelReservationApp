module ApplicationHelper
  def nav_link(is_active = false, opts = {}, &block)
    content = capture(&block)
    css_class = (opts[:class] || '').dup
    css_class << ' active' if is_active
    content_tag(:li, content, opts.merge(class: css_class.strip))
  end
  
  def nav_menu(label, &block)
    header = raw(CGI::escapeHTML(label)) << ' ' << content_tag(:b, '', class: 'caret')
    content = capture(&block)
    
    link_to(header, '#', class: 'dropdown-toggle', data: { toggle: 'dropdown' }) <<
        content_tag(:ul, content, class: 'dropdown-menu')
  end
  
  def nav_divider
    tag(:li, class: 'divider')
  end
  
  def login_page?
    params[:controller] == 'devise/sessions' && %w(new create).include?(params[:action])
  end
  
  def register_page?
    params[:controller] == 'devise/registrations' && %w(new create).include?(params[:action])
  end
  
  def account_page?
    params[:controller] == 'devise/registrations' && %w(edit update).include?(params[:action])
  end
  
  def reservations_page?
    params[:controller] == 'reservations'
  end
  
  def rooms_page?
    params[:controller] == 'rooms'
  end
end
