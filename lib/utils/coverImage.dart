class CoverImage {
  static String convertImageUrl(String imageUrl) {
    return imageUrl.replaceAll("%2F", "/").replaceAll("%3A", ":").substring(7);
  }
}
