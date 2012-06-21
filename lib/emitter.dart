// Copyright (c) 2012, the EDT project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** Emittes a dart code for a compiled template. */
interface TemplateEmitter default TemplateEmitterImpl {
  
  TemplateEmitter();
  
  /** Emits start of class template with given name */
  String emitStartClass(String className);
  
  String emitTemplateFragment(TemplateFragment fragment);
  
  String emitCodeFragment(CodeFragment fragment);
  
  String emitEscapedOutputFragment(EscapedOutputFragment fragment);
  
  String emitUnescapedOutputFragment(UnescapedOutputFragment fragment);
  
  /** Emits end of class template */
  String emitEndClass();
  
}

/** Standart implementation of emitter */
class TemplateEmitterImpl implements TemplateEmitter {
  
  TemplateEmitterImpl() {}
  
  /** Emits start of class template with given name */
  String emitStartClass(String className) {
    return "class $className extends EDTemplate {\n"
           "  String render(Map data, OutputStream out) {\n";  
  }
  
  String emitTemplateFragment(TemplateFragment fragment) {
    var text = fragment.text.replaceAll("\n", "\\n")
                            .replaceAll("\r", "\\r");
    return "    out.writeString(\"${text}\");\n";      
  }
  
  String emitCodeFragment(CodeFragment fragment) {
    return "${fragment.code}\n";
  }
  
  String emitEscapedOutputFragment(EscapedOutputFragment fragment) {
    return "    out.writeString(escapeHtml(${fragment.expression}));\n";
  }
  
  String emitUnescapedOutputFragment(UnescapedOutputFragment fragment) {
    return "    out.writeString(${fragment.expression});\n";
  }
  
  /** Emits end of class template */
  String emitEndClass() {
    return "  }\n"
           "}\n";
  }
  
}