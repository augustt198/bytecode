=begin
OPCODES_URL = "http://docs.oracle.com/javase/specs/jvms/se7/html/jvms-6.html"

page = Net::HTTP.get URI.parse(OPCODES_URL)
html = Nokogiri::HTML page

opcodes = {}

html.xpath("//div[@class='section-execution']").each do |opcode|
  # TODO get opcode info
end
=end
