import 'dart:html';

downloadFile(String fileName, path) {
  AnchorElement anchorElement = AnchorElement(href: path);
  anchorElement.download = fileName;
  anchorElement.click();
}
