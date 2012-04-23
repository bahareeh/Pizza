class Email < ActionMailer::Base

  def job_application(jobapp, sent_at = Time.now)
    subject    'Pizzatown.ca Job Application'
    recipients CONTACT_RECIPIENT_CAREERS
    from       jobapp.email
    sent_on    sent_at
    body       :jobapp => jobapp
    # add attachment if one was uploaded
    unless jobapp.attachment_file_name.blank?
      attachment jobapp.attachment_content_type do |a|
        a.filename= jobapp.attachment_file_name
        a.body = File.read(jobapp.attachment.path)
      end
    end
  end

  def comment(comment, sent_at = Time.now)
    subject    'Pizzatown.ca Comments'
    recipients CONTACT_RECIPIENT_COMMENTS
    from       comment.email
    sent_on    sent_at
    body       :comment => comment
  end
end
