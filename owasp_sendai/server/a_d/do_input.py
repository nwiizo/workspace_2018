from addb.database import init_db
from addb.database import db_session
from addb.models import WikiContent

# idには連番。title、textを指定。dateは日時が勝手に入る(model.pyのデフォルト設定により)
c1 = WikiContent("sample", "sample Post")  # カラム1:'Flask' カラム2:'micro framework'を指定してインスタンス作成
db_session.add(c1)                            # insert実行
db_session.commit()                           # commit実行
c2 = WikiContent("Post_scoring", "test Post")        # 以下同上
c3 = WikiContent("Posts_scoring", "Her is dead")
db_session.add(c2)
db_session.add(c3)
db_session.commit()
