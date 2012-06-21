class _test_example_edt extends EDTemplate {
  String render(Map data, OutputStream out) {
    out.writeString("<html>\r\n <head>\r\n 	<title>A sample template</title>\r\n <head>\r\n <body>\r\n 	");
    out.writeString("<div>\r\n	<span>Include content</span>\r\n	<span>");
    out.writeString(escapeHtml(data["third"]));
    out.writeString("</span>\r\n	<span>");
    out.writeString(data["forth"]);
    out.writeString("</span>\r\n</div>");
    out.writeString("\r\n 	<div>\r\n 	   ");
 if (data["condition"]) { 
    out.writeString("\r\n 	   		<span>");
    out.writeString(escapeHtml(data["one"]));
    out.writeString("</span>\r\n 	   		<span>");
    out.writeString(data["second"]);
    out.writeString("</span>\r\n 	   ");
 } 
    out.writeString(" 	\r\n 	</div>\r\n </body>\r\n</html>");
  }
}