module EmailHelper
  def email(email, text: nil, classes: nil)
    # Gets ASCII/Unicode code point and writes it out in hex as eg 'A' -> 65 -> `&x41;`
    encoded_email = email.gsub(/./) { sprintf("&#x%02X;", $&.unpack("U")[0]) }
    text ||= encoded_email
    classes ||= ""
    return %Q{<a href="mailto:#{encoded_email}" class="#{classes}">#{text}</a>}
  end
end
