import os
import datetime
import psycopg2
#conn = psycopg2.connect("dbname=dvdrental user=postgres password=password")
#!/usr/bin/python
from configparser import ConfigParser


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
    print("‘ 1. Register User’")
    print("‘ 2. All Users’")
    print("‘ 3. All Posts’")
    print('‘ 4. Get posts by a user’')
    print('‘ 5. Exit’')
    print(" — — — — — — — — — —" )

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
    cur.execute(sql,(name,username,email,password,dateofjoin,prp))
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
if __name__ == '__main__':
    cur,connection=connect()
    print(" pls insert your query")
    count = cur.rowcount
    print(count, "count before")
    cur.execute(""" insert into actor values(%s,%s,%s,%s)""",(13747,"ali","hashemi","2013-05-26 14:47:57.62"))

    connection.commit()
    count = cur.rowcount
    print(count, "Record inserted successfully into mobile table")
