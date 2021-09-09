String countryNameText(String source) {
  if (source.length > 23) {
    return source.substring(0, 19) + '...';
  }
  return source;
}
