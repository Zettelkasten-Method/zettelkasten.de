module EmailHelper
  def email(email, text: nil, classes: nil)
    # Gets ASCII/Unicode code point and writes it out in hex as eg 'A' -> 65 -> `&x41;`
    encoded_email = email.gsub(/./) { sprintf("&#x%02X;", $&.unpack("U")[0]) }
    text ||= encoded_email
    classes ||= ""
    return %Q{<a href="mailto:#{encoded_email}" class="#{classes}">#{text}</a>}
  end

  def coaching_email_request(text: "Send an Email", classes: "coaching__action")
    subject = %Q{Zettelkasten Coaching}.uri_encoded
    message = "".tap do |result|
      result << "Hi Sascha,\n"
      result << "\n"
      result << [
        'I am [YOUR NAME]. I want Zettelkasten Coaching.',
        '- My professional background:',
        '- My current goals:',
        '- I was inspired to learn the Zettelkasten Method the most by:',
        '- My current approach to organise notes and knowledge in general:',
        '- My note-taking habit looks like this:',
        '- My current Zettelkasten software:',
        '- My address (necessary in Germany for invoicing):',
      ].join("\n\n") + "\n\n"
    end.uri_encoded
    recipient = "saschafast@gmail.com"
    encoded_recipient = recipient.gsub(/./) { sprintf("&#x%02X;", $&.unpack("U")[0]) }
    link = "mailto:#{encoded_recipient}?subject=#{subject}&body=#{message}"
    classes ||= ""
    return %Q{<a href="#{link}" class="#{classes}">#{text}</a>}
  end
end

class String
  def uri_encoded
    ERB::Util.url_encode(self)
  end
end
