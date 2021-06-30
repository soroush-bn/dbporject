import os
import datetime
import psycopg2
#conn = psycopg2.connect("dbname=dvdrental user=postgres password=password")
#!/usr/bin/python
from configparser import ConfigParser
from cryptography.fernet import Fernet
def generate_key():
    """
    Generates a key and save it into a file
    """
    key = Fernet.generate_key()
    with open("secret.key", "wb") as key_file:
        key_file.write(key)
def load_key():
    """
    Load the previously generated key
    """
    return open("secret.key", "rb").read()

def encrypt_message(message):
    """
    Encrypts a message
    """
    key = load_key()
    encoded_message = message.encode()
    f = Fernet(key)
    encrypted_message = f.encrypt(encoded_message)
    print(encrypted_message)
    return encrypted_message

def config(filename='database.ini', section='postgresql'):
    # create a parser
    parser = ConfigParser()
    # read config file
    parser.read(filename)

    # get section, default to postgresql
    db = {}
    if parser.has_section(section):
        params = parser.items(section)
        for param in params:
            db[param[0]] = param[1]
    else:
        raise Exception('Section {0} not found in the {1} file'.format(section, filename))

    return db


def connect():
    """ Connect to the PostgreSQL database server """
    conn = None
    try:
        # read connection parameters
        params = config()

        # connect to the PostgreSQL server
        print('Connecting to the PostgreSQL database...')
        conn = psycopg2.connect(**params)

        # create a cursor
        cur = conn.cursor()

        # execute a statement
        print('PostgreSQL database version:')
        cur.execute('SELECT version()')

        # display the PostgreSQL database server version
        db_version = cur.fetchone()
        print(db_version)

        # close the communication with the PostgreSQL
        #cur.close()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        return cur,conn
        #if conn is not None:
            #conn.close()
            #print('Database connection closed.')
def exit():
    n = int(input(" Press 5 to exit : "))
    if n == 5:
       os.system("cls") # For Windows
       #run()
    else:
       print(" Invalid Option")
       exit()
def displayMainMenu():
    print("‘ — — — — MENU — — — -’")
    print("‘ 0. Run your own query’")
    print("‘ 1. Register User’")
    print("‘ 2. Create channel’")
    print("‘ 3. Upload video’")
    print('‘ 4. Join channel’')
    print('‘ 5. Create playlist’')
    print('‘ 6. Add video to playlist’')
    print('‘ 7. add watch later video’')
    print('‘ 8. comment’')
    print('‘ 9. reply’')
    print("10. display more options ...")
    print(" — — — — — — — — — —" )
def displayMainMenu2():
    print("‘ — — — — MENU — — — -’")
    print("‘ 11. get all the videos’")
    print("‘ 12. search video by name’")
    print("‘ 13. search video by id’")
    print("‘ 14. search channel by name’")
    print('‘ 15. search playlists’')
    print(' 16. get video\'s view')
    print('‘ 17. get videos like’')
    print('‘ 18. get video dislike’')
    print('‘ 19. delete video from channel’')
    print('‘ 20. delete comment’')
    #print("10. display more options ...")
    print(" — — — — — — — — — —" )
def get_all_videos(cur,connection):

    cur.execute("""select * from video;""")
    videos=cur.fetchall()
    for video in videos :
        print("id :",video[0])
        print("name :", video[1])
        print("description :", video[3])
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`")

    return
def get_video_by_id(cur,connection):
    id=input("enter id of the video ")
    cur.execute("""select * from video where id=%s;""",(id))
    video=cur.fetchone()
    print("id :", video[0])
    print("name :", video[1])
    print("description :", video[3])
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`")

    return

def get_video_by_name(cur,connection):
    name = input("enter name of the video ")
    cur.execute("""select * from video where public=true name=%s;""", (name))
    video = cur.fetchone()
    print("id :", video[0])
    print("name :", video[1])
    print("description :", video[3])
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`")
    return

def get_channel_by_name(cur,connection):
    name = input("enter name of the channel ")
    cur.execute("""select * from channel where public=true and name=%s;""", (name))
    video = cur.fetchone()
    print("id :", video[0])
    print("name :", video[1])
    print("description :", video[3])
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`")
    return
def get_playlist(cur,connection):
    name = input("enter name of the playlist ")
    cur.execute("""select * from playlist_user where public=true and name=%s;""", (name))
    video = cur.fetchone()
    print("id :", video[0])
    print("user id :", video[1])
    print("name :", video[2])
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`")
    return
def get_video_watched(cur,connection):
    vid=input("enter video id")
    cur.execute("""select count_watched from video where id=%s""",vid)
    count=cur.fetchone()[0]
    print("veiws = " , count)
    return
def get_video_likes(cur,connection):
    vid=input("enter video id")
    cur.execute("""select like from video where id=%s""",vid)
    count=cur.fetchone()[0]
    print("likes = " , count)
    return

def get_video_dislike(cur,connection):
    vid=input("enter video id")
    cur.execute("""select dislike from video where id=%s""",vid)
    count=cur.fetchone()[0]
    print("dislikes = " , count)
    return

def get_all_users(cur,connection):
    cur.execute("""select * from user;""")
    users=cur.fetchall()
    for user in users :
        print("id :",user[0])
        print("username :", user[1])
        print("prp:", user[5])
        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`")
def delete_video_from_channel(cur,connection):
    print("-----deleting video from channel --------")
    playlist_id=input("enter playlist id")
    video_id=input("enter video id")
    sql="""delete from playlist_video where playlist_id=%s and video_id=%s"""
    cur.execute(sql,(playlist_id,video_id))
    connection.commit()

    return
def watch(cur,connection):
    print("------saving a watched video")
    userid=input("enter user id")
    vidid=input("enter video id")
    sql="""insert into user_watched values(%s,%s,%s)  ; """
    cur.execute(sql,(vidid,userid,datetime.time))
    connection.commit()
    cur.execute("""update from video set count_watched=count_watched+1 where id=%s""",vidid)
    connection.commit()

    return
def like(cur,connection):

    like_count=0
    vid=input("enter video id ")
    cur.execute("""select like from video where id=%s;""",vid)
    like_count=cur.fetchone()[0]
    like_count+=1
    sql="""update video set like=%s where id=%s;"""
    cur.execute(sql,(like_count,vid))
    connection.commit()

    return

def dislike(cur,connection):
    dislike_count = 0
    vid = input("enter video id ")
    cur.execute("""select dislike from video where id=%s;""", vid)
    dislike_count = cur.fetchone()[0]
    dislike_count += 1
    sql = """update video set dislike=%s where id=%s;"""
    cur.execute(sql, (dislike_count, vid))
    connection.commit()

    return
def delete_comment(cur,connection):
    print("-------deleting comment----------")
    id=input("pls enter cm id")
    cur.execute("""delete from comment where id=%s ;""",id)
    connection.commit()

    return
def delete_playlist(cur,connection):
    print("--------deleting playlist-----------")
    uid=input("enter user id")
    pid=input("enter play list id")
    sql1="""delete from playlist_user where uid=%s and pid=%s"""
    cur.execute(sql1,(uid,pid))
    connection.commit()

    return

def registerUser(cur,connection):
    print("------user registeration------")
    name=input("enter name")
    username=input("enter username")
    email=input("enter email address")
    password=input("enter password")
    prp=input("enter profile picture storage id")
    dateofjoin=datetime.date

    # is it correct?
    #GENERIC ID ?
    sql = """INSERT INTO user(name,username,email,password,dateofjoin,profilepic)
                 VALUES(%s,%s,%s,%s,%s,%s) RETURNING id;"""
    cur.execute(sql,(name,username,email,encrypt_message(password),dateofjoin,prp))
    connection.commit()
    return cur.fetchone()[0]

def createChannel(cur,connection):
    print("--------creating channel-----")
    userid=input("input user id of creator")
    name=input("input name of the channel")
    creation_date=datetime.date
    about=input("input about for channel")
    prp=input("input picture storage id")

    sql="""INSERT INTO channel(name,creation_date,about,pic,count_member) 
    values(%s,%s,%s,%s)RETURNING id;"""
    cur.execute(sql,(name,creation_date,about,prp,0))
    connection.commit();
    channel_id=cur.fetchone()[0]
    cur.execute(""" insert into user_channel(user_id,channel_id) values(%s,%s) """,(userid,channel_id))
    connection.commit()

    return True
def add_watch_later_video(cur,connection):
    print("======ading watch later video ")
    cur.execute("""insert into watch_later_user() values() returning id;""")
    connection.commit();
    id=cur.fetchone()[0]
    vid=input("pls enter video id ")

    sql=""" insert into watch_later_video(id,video_id) values(%s) ; """

    cur.execute(sql,(id,vid))
    connection.commit()

    return
def create_playlist(cur,connection ):
    print("=====creating playlist=======")
    user_id=input("enter user id")
    sql1="""insert into playlist_user() values (%s) returning id;"""
    cur.execute(sql1,(user_id))
    id=cur.fetchone()[0]
    connection.commit()

    return id
def add_video_to_playlist(cur,connection):
    print("-----adding video to playlist -- -- -- -  ")
    playlist_id=input("enter playlist id ")
    video_id=input("enter video id ")
    sql="""insert into playlist_video() values (%s,%s) ; """
    cur.execute(sql,(playlist_id,video_id))
    connection.commit()

    return

def add_video_to_channel(cur,connection):
    print("----- adding video to your channel ------")
    vid=input("enter video id")
    uid=input("enter user id")
    chid=input("enter channel id")
    sql="""insert into user_upload() values(%s,%s,%s) ;"""
    cur.execute(sql,(vid,uid,chid))
    connection.commit()

    return

def upload_video(cur,connection):
    print("-----uploading video-------")
    name=input("enter name of the video")
    description=input("enter description")
    duration=input("enter duration")
    thumbnail=input("enter thumbnail pic storage id")
    user_id=input("enter user id ")
    sql="""insert into video(name,upload_date,description,duration,thumbnail,user_id,like,dislike,count_member) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,);"""
    cur.excute(sql,(name,datetime.date,description,duration,thumbnail,user_id,0,0,0))
    connection.commit()

    return
def comment(cur,connection):
    print("======commenting======")
    v_id=input("enter video id")
    u_id=input("enter user_id")
    text=input("enter text")
    sql="""insert into comment(video_id,user_id,text) values (%s,%s,%s);"""
    cur.execute(sql,(v_id,u_id,text))
    connection.commit()
    return

def reply(cur,connection):
    print("======replying======")
    cm_id=input("enter comment id")
    text = input("enter text")
    sql="""insert into reply(comment_id,text) values (%s,%s);"""
    cur.execute(sql,(cm_id,text))
    connection.commit()
    return
def join_channel(cur,connection):
    print("------joining channel-------")
    user_id=input("enter user id")
    channel_id=input("enter channel id")
    sql="""insert into membership_channel(user_id,channel) values (%s,%s) ;"""
    cur.execute(sql,(user_id,channel_id))
    connection.commit()
    return

def cancel_membership(cur,connection):
    print("----canceling membership------")
    user_id = input("enter user id")
    channel_id = input("enter channel id")
    sql="""delete from membership_channel where user_id=%s;"""
    cur.execute(sql,(user_id,channel_id))
    connection.commit()

    return


def query(cur,connection):
    sql=input("enter your sql query (you can not use insert delete update create !)")
    cur.execute(sql)
    return
if __name__ == '__main__':
    cur,connection=connect()
    while(True):
        displayMainMenu()
        n=int(input("pls enter your option"))
        if(n==0):
            os.system("cls")
            query(cur,connection)
        elif n==1:
            os.system("cls")
            registerUser(cur,connection)
        elif n==2:
            os.system("cls")
            createChannel(cur,connection)
        elif n==3:
            os.system("cls")
            upload_video(cur,connection)
        elif n==4:
            os.system("cls")
            join_channel(cur,connection)
        elif n==5:
            os.system("cls")
            create_playlist(cur,connection)
        elif n==6:
            os.system("cls")
            add_video_to_playlist(cur,connection)
        elif n==7:
            os.system("cls")
            add_watch_later_video(cur,connection)
        elif n==8:
            os.system("cls")
            comment(cur,connection)
        elif n==9:
            os.system("cls")
            reply(cur,connection)
        elif n==10:
            os.system("cls")
            displayMainMenu2()
        elif n==11:
            os.system("cls")
            get_all_videos(cur,connection)
        elif n==12:
            os.system("cls")
            get_video_by_name(cur,connection)
        elif n==13:
            os.system("cls")
            get_video_by_id(cur,connection)
        elif n==14:
            os.system("cls")
            get_channel_by_name(cur,connection)
        elif n==15:
            os.system("cls")
            get_playlist(cur,connection)
        elif n==16:
            os.system("cls")
            get_video_watched(cur,connection)
        elif n==17:
            os.system("cls")
            get_video_likes(cur,connection)
        elif n==18:
            os.system("cls")
            get_video_dislike(cur,connection)
        elif n==19:
            os.system("cls")
            delete_video_from_channel(cur,connection)
        elif n==20:
            os.system("cls")
            delete_comment(cur,connection)

    ####
