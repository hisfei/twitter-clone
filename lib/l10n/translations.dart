import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'home': '首页',
          'explore': '探索',
          'mindRealm': '秘境',
          'bookmarks': '书签',
          'message': '消息',
          'notifications': '提醒',
          'profile': '个人中心',
          'post': '发想法',
          'ask': '提问题',
          'answer': '写回答',
          'addMessage': '新增消息',
          'next': '下一步',
          'send': '发送',
          'ideas': '奇思妙想',
          'like': '赞',
          'views': '浏览',
          'reply': '回复',
          'more': '阅读全文',
          'realmQA': '秘境问答',
          'foryou': '为你推荐',
          'following': '正在关注',
          'trendsforyou': '推荐话题',
        },
        'en_US': {
          'hello': 'Home',
          'welcome': 'Welcome',
        },
        'es_ES': {
          'hello': 'Hola',
          'welcome': 'Bienvenido',
        },
        'fr_FR': {
          'hello': 'Bonjour',
          'welcome': 'Bienvenue',
        }
      };
}
