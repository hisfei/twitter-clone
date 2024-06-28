import 'dart:html' as html;

void updateUrl(String url) {
   html.window.history.pushState(null, '', '#'+url);
}
