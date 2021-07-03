PGDMP     7                    y           project    13.3    13.3 k    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    16394    project    DATABASE     l   CREATE DATABASE project WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United Kingdom.1252';
    DROP DATABASE project;
                postgres    false            �            1259    16943    channel    TABLE     �   CREATE TABLE public.channel (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    creation_date date NOT NULL,
    about character varying(255),
    pic integer,
    count_members integer,
    public boolean NOT NULL
);
    DROP TABLE public.channel;
       public         heap    postgres    false            �            1259    16941    channel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.channel_id_seq;
       public          postgres    false    204            D           0    0    channel_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.channel_id_seq OWNED BY public.channel.id;
          public          postgres    false    203            �            1259    17169    comment    TABLE     �   CREATE TABLE public.comment (
    id integer NOT NULL,
    user_id integer NOT NULL,
    video_id integer NOT NULL,
    text character varying NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    17167    comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.comment_id_seq;
       public          postgres    false    216            E           0    0    comment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.comment_id_seq OWNED BY public.comment.id;
          public          postgres    false    215            �            1259    17005    membership_channel    TABLE     i   CREATE TABLE public.membership_channel (
    user_id integer NOT NULL,
    channelid integer NOT NULL
);
 &   DROP TABLE public.membership_channel;
       public         heap    postgres    false            �            1259    17045    playlist_user    TABLE     �   CREATE TABLE public.playlist_user (
    id integer NOT NULL,
    user_id integer NOT NULL,
    public boolean NOT NULL,
    name character varying(100) NOT NULL
);
 !   DROP TABLE public.playlist_user;
       public         heap    postgres    false            �            1259    17043    playlist_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.playlist_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.playlist_user_id_seq;
       public          postgres    false    211            F           0    0    playlist_user_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.playlist_user_id_seq OWNED BY public.playlist_user.id;
          public          postgres    false    210            �            1259    17056    playlist_video    TABLE     h   CREATE TABLE public.playlist_video (
    playlist_id integer NOT NULL,
    video_id integer NOT NULL
);
 "   DROP TABLE public.playlist_video;
       public         heap    postgres    false            �            1259    17210    reply    TABLE     �   CREATE TABLE public.reply (
    reply_id integer NOT NULL,
    comment_id integer NOT NULL,
    text character varying(255) NOT NULL
);
    DROP TABLE public.reply;
       public         heap    postgres    false            �            1259    17208    reply_reply_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reply_reply_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.reply_reply_id_seq;
       public          postgres    false    218            G           0    0    reply_reply_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.reply_reply_id_seq OWNED BY public.reply.reply_id;
          public          postgres    false    217            �            1259    16965    user    TABLE     G  CREATE TABLE public."user" (
    user_id integer NOT NULL,
    username character varying(256) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(30) NOT NULL,
    dateofjoin date NOT NULL,
    profile_pic integer,
    watch_later_id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    17228    user_channel    TABLE     }   CREATE TABLE public.user_channel (
    id integer NOT NULL,
    user_id integer NOT NULL,
    channel_id integer NOT NULL
);
     DROP TABLE public.user_channel;
       public         heap    postgres    false            �            1259    17226    user_channel_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.user_channel_id_seq;
       public          postgres    false    220            H           0    0    user_channel_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.user_channel_id_seq OWNED BY public.user_channel.id;
          public          postgres    false    219            �            1259    16963    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    206            I           0    0    user_id_seq    SEQUENCE OWNED BY     B   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".user_id;
          public          postgres    false    205            �            1259    17251    user_upload    TABLE     �   CREATE TABLE public.user_upload (
    id integer NOT NULL,
    videoid integer NOT NULL,
    id_channel integer NOT NULL,
    id_user_channel integer NOT NULL,
    user_id_user integer NOT NULL
);
    DROP TABLE public.user_upload;
       public         heap    postgres    false            �            1259    17249    user_upload_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_upload_id_seq;
       public          postgres    false    222            J           0    0    user_upload_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_upload_id_seq OWNED BY public.user_upload.id;
          public          postgres    false    221            �            1259    17149    user_watched    TABLE     q   CREATE TABLE public.user_watched (
    video_id integer NOT NULL,
    date date,
    user_id integer NOT NULL
);
     DROP TABLE public.user_watched;
       public         heap    postgres    false            �            1259    17027    video    TABLE     n  CREATE TABLE public.video (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    upload_date date NOT NULL,
    description character varying(255),
    duration integer NOT NULL,
    thumbnail_pic integer NOT NULL,
    user_id integer NOT NULL,
    "like" integer,
    dislike integer,
    count_watched integer,
    storage_id integer NOT NULL
);
    DROP TABLE public.video;
       public         heap    postgres    false            �            1259    17025    video_id_seq    SEQUENCE     �   CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.video_id_seq;
       public          postgres    false    209            K           0    0    video_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;
          public          postgres    false    208            �            1259    16925    watch_later_user    TABLE     B   CREATE TABLE public.watch_later_user (
    id integer NOT NULL
);
 $   DROP TABLE public.watch_later_user;
       public         heap    postgres    false            �            1259    16838    watch_later_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.watch_later_user_id_seq
    START WITH 1
    INCREMENT BY 200
    NO MINVALUE
    MAXVALUE 9222222222
    CACHE 1;
 .   DROP SEQUENCE public.watch_later_user_id_seq;
       public          postgres    false            �            1259    16923    watch_later_user_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.watch_later_user_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.watch_later_user_id_seq1;
       public          postgres    false    202            L           0    0    watch_later_user_id_seq1    SEQUENCE OWNED BY     T   ALTER SEQUENCE public.watch_later_user_id_seq1 OWNED BY public.watch_later_user.id;
          public          postgres    false    201            �            1259    17129    watch_later_video    TABLE     b   CREATE TABLE public.watch_later_video (
    id integer NOT NULL,
    video_id integer NOT NULL
);
 %   DROP TABLE public.watch_later_video;
       public         heap    postgres    false            f           2604    16946 
   channel id    DEFAULT     h   ALTER TABLE ONLY public.channel ALTER COLUMN id SET DEFAULT nextval('public.channel_id_seq'::regclass);
 9   ALTER TABLE public.channel ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    204    204            j           2604    17172 
   comment id    DEFAULT     h   ALTER TABLE ONLY public.comment ALTER COLUMN id SET DEFAULT nextval('public.comment_id_seq'::regclass);
 9   ALTER TABLE public.comment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            i           2604    17048    playlist_user id    DEFAULT     t   ALTER TABLE ONLY public.playlist_user ALTER COLUMN id SET DEFAULT nextval('public.playlist_user_id_seq'::regclass);
 ?   ALTER TABLE public.playlist_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    211    211            k           2604    17213    reply reply_id    DEFAULT     p   ALTER TABLE ONLY public.reply ALTER COLUMN reply_id SET DEFAULT nextval('public.reply_reply_id_seq'::regclass);
 =   ALTER TABLE public.reply ALTER COLUMN reply_id DROP DEFAULT;
       public          postgres    false    217    218    218            g           2604    16968    user user_id    DEFAULT     i   ALTER TABLE ONLY public."user" ALTER COLUMN user_id SET DEFAULT nextval('public.user_id_seq'::regclass);
 =   ALTER TABLE public."user" ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    205    206    206            l           2604    17231    user_channel id    DEFAULT     r   ALTER TABLE ONLY public.user_channel ALTER COLUMN id SET DEFAULT nextval('public.user_channel_id_seq'::regclass);
 >   ALTER TABLE public.user_channel ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            m           2604    17254    user_upload id    DEFAULT     p   ALTER TABLE ONLY public.user_upload ALTER COLUMN id SET DEFAULT nextval('public.user_upload_id_seq'::regclass);
 =   ALTER TABLE public.user_upload ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            h           2604    17030    video id    DEFAULT     d   ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);
 7   ALTER TABLE public.video ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            e           2604    16928    watch_later_user id    DEFAULT     {   ALTER TABLE ONLY public.watch_later_user ALTER COLUMN id SET DEFAULT nextval('public.watch_later_user_id_seq1'::regclass);
 B   ALTER TABLE public.watch_later_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    202    202            +          0    16943    channel 
   TABLE DATA           ]   COPY public.channel (id, name, creation_date, about, pic, count_members, public) FROM stdin;
    public          postgres    false    204   ��       7          0    17169    comment 
   TABLE DATA           >   COPY public.comment (id, user_id, video_id, text) FROM stdin;
    public          postgres    false    216   #�       .          0    17005    membership_channel 
   TABLE DATA           @   COPY public.membership_channel (user_id, channelid) FROM stdin;
    public          postgres    false    207   ��       2          0    17045    playlist_user 
   TABLE DATA           B   COPY public.playlist_user (id, user_id, public, name) FROM stdin;
    public          postgres    false    211   ك       3          0    17056    playlist_video 
   TABLE DATA           ?   COPY public.playlist_video (playlist_id, video_id) FROM stdin;
    public          postgres    false    212   4�       9          0    17210    reply 
   TABLE DATA           ;   COPY public.reply (reply_id, comment_id, text) FROM stdin;
    public          postgres    false    218   }�       -          0    16965    user 
   TABLE DATA           s   COPY public."user" (user_id, username, email, password, dateofjoin, profile_pic, watch_later_id, name) FROM stdin;
    public          postgres    false    206   �       ;          0    17228    user_channel 
   TABLE DATA           ?   COPY public.user_channel (id, user_id, channel_id) FROM stdin;
    public          postgres    false    220   ��       =          0    17251    user_upload 
   TABLE DATA           ]   COPY public.user_upload (id, videoid, id_channel, id_user_channel, user_id_user) FROM stdin;
    public          postgres    false    222   :�       5          0    17149    user_watched 
   TABLE DATA           ?   COPY public.user_watched (video_id, date, user_id) FROM stdin;
    public          postgres    false    214   ��       0          0    17027    video 
   TABLE DATA           �   COPY public.video (id, name, upload_date, description, duration, thumbnail_pic, user_id, "like", dislike, count_watched, storage_id) FROM stdin;
    public          postgres    false    209   �       )          0    16925    watch_later_user 
   TABLE DATA           .   COPY public.watch_later_user (id) FROM stdin;
    public          postgres    false    202   ��       4          0    17129    watch_later_video 
   TABLE DATA           9   COPY public.watch_later_video (id, video_id) FROM stdin;
    public          postgres    false    213   Ç       M           0    0    channel_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.channel_id_seq', 5, true);
          public          postgres    false    203            N           0    0    comment_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.comment_id_seq', 12, true);
          public          postgres    false    215            O           0    0    playlist_user_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.playlist_user_id_seq', 8, true);
          public          postgres    false    210            P           0    0    reply_reply_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.reply_reply_id_seq', 10, true);
          public          postgres    false    217            Q           0    0    user_channel_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_channel_id_seq', 5, true);
          public          postgres    false    219            R           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 25, true);
          public          postgres    false    205            S           0    0    user_upload_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_upload_id_seq', 11, true);
          public          postgres    false    221            T           0    0    video_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.video_id_seq', 9, true);
          public          postgres    false    208            U           0    0    watch_later_user_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.watch_later_user_id_seq', 1, false);
          public          postgres    false    200            V           0    0    watch_later_user_id_seq1    SEQUENCE SET     G   SELECT pg_catalog.setval('public.watch_later_user_id_seq1', 1, false);
          public          postgres    false    201            q           2606    16948    channel channel_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.channel
    ADD CONSTRAINT channel_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.channel DROP CONSTRAINT channel_pkey;
       public            postgres    false    204            �           2606    17174    comment comment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    216            s           2606    16950    channel id_channel_unique 
   CONSTRAINT     R   ALTER TABLE ONLY public.channel
    ADD CONSTRAINT id_channel_unique UNIQUE (id);
 C   ALTER TABLE ONLY public.channel DROP CONSTRAINT id_channel_unique;
       public            postgres    false    204            |           2606    17009 *   membership_channel membership_channel_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.membership_channel
    ADD CONSTRAINT membership_channel_pkey PRIMARY KEY (user_id, channelid);
 T   ALTER TABLE ONLY public.membership_channel DROP CONSTRAINT membership_channel_pkey;
       public            postgres    false    207    207            �           2606    17050     playlist_user playlist_user_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.playlist_user
    ADD CONSTRAINT playlist_user_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.playlist_user DROP CONSTRAINT playlist_user_pkey;
       public            postgres    false    211            �           2606    17060 "   playlist_video playlist_video_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.playlist_video
    ADD CONSTRAINT playlist_video_pkey PRIMARY KEY (playlist_id, video_id);
 L   ALTER TABLE ONLY public.playlist_video DROP CONSTRAINT playlist_video_pkey;
       public            postgres    false    212    212            �           2606    17215    reply reply_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.reply
    ADD CONSTRAINT reply_pkey PRIMARY KEY (reply_id);
 :   ALTER TABLE ONLY public.reply DROP CONSTRAINT reply_pkey;
       public            postgres    false    218                       2606    17278    video storage_id_unique 
   CONSTRAINT     X   ALTER TABLE ONLY public.video
    ADD CONSTRAINT storage_id_unique UNIQUE (storage_id);
 A   ALTER TABLE ONLY public.video DROP CONSTRAINT storage_id_unique;
       public            postgres    false    209            �           2606    17233    user_channel user_channel_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_channel
    ADD CONSTRAINT user_channel_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.user_channel DROP CONSTRAINT user_channel_pkey;
       public            postgres    false    220            v           2606    16970    user user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    206            �           2606    17256    user_upload user_upload_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_upload
    ADD CONSTRAINT user_upload_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_upload DROP CONSTRAINT user_upload_pkey;
       public            postgres    false    222            x           2606    17490    user username_unique 
   CONSTRAINT     U   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT username_unique UNIQUE (username);
 @   ALTER TABLE ONLY public."user" DROP CONSTRAINT username_unique;
       public            postgres    false    206            �           2606    17032    video video_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.video DROP CONSTRAINT video_pkey;
       public            postgres    false    209            z           2606    16974    user watch_later_id_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT watch_later_id_unique UNIQUE (watch_later_id);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT watch_later_id_unique;
       public            postgres    false    206            o           2606    16930 &   watch_later_user watch_later_user_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.watch_later_user
    ADD CONSTRAINT watch_later_user_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.watch_later_user DROP CONSTRAINT watch_later_user_pkey;
       public            postgres    false    202            �           2606    17133 (   watch_later_video watch_later_video_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.watch_later_video
    ADD CONSTRAINT watch_later_video_pkey PRIMARY KEY (id, video_id);
 R   ALTER TABLE ONLY public.watch_later_video DROP CONSTRAINT watch_later_video_pkey;
       public            postgres    false    213    213            t           1259    17280    name_channel_index    INDEX     F   CREATE INDEX name_channel_index ON public.channel USING btree (name);
 &   DROP INDEX public.name_channel_index;
       public            postgres    false    204            �           1259    17281    name_playlist_user_index    INDEX     R   CREATE INDEX name_playlist_user_index ON public.playlist_user USING btree (name);
 ,   DROP INDEX public.name_playlist_user_index;
       public            postgres    false    211            }           1259    17279    name_video_index    INDEX     B   CREATE INDEX name_video_index ON public.video USING btree (name);
 $   DROP INDEX public.name_video_index;
       public            postgres    false    209            �           2606    17262 (   user_upload 		idchannel_user_upload_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_upload
    ADD CONSTRAINT "		idchannel_user_upload_frky" FOREIGN KEY (id_channel) REFERENCES public.channel(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 T   ALTER TABLE ONLY public.user_upload DROP CONSTRAINT "		idchannel_user_upload_frky";
       public          postgres    false    2929    204    222            �           2606    17239 )   user_channel channel_id_user_channel_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_channel
    ADD CONSTRAINT channel_id_user_channel_frky FOREIGN KEY (channel_id) REFERENCES public.channel(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 S   ALTER TABLE ONLY public.user_channel DROP CONSTRAINT channel_id_user_channel_frky;
       public          postgres    false    2929    220    204            �           2606    17015 4   membership_channel channelid_membership_channel_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.membership_channel
    ADD CONSTRAINT channelid_membership_channel_frky FOREIGN KEY (channelid) REFERENCES public.channel(id) ON UPDATE CASCADE ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.membership_channel DROP CONSTRAINT channelid_membership_channel_frky;
       public          postgres    false    204    2929    207            �           2606    17216    reply comment_id_reply_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.reply
    ADD CONSTRAINT comment_id_reply_frky FOREIGN KEY (comment_id) REFERENCES public.comment(id) NOT VALID;
 E   ALTER TABLE ONLY public.reply DROP CONSTRAINT comment_id_reply_frky;
       public          postgres    false    2954    216    218            �           2606    17272 '   user_upload id_user_channel_user_upload    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_upload
    ADD CONSTRAINT id_user_channel_user_upload FOREIGN KEY (id_user_channel) REFERENCES public.user_channel(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 Q   ALTER TABLE ONLY public.user_upload DROP CONSTRAINT id_user_channel_user_upload;
       public          postgres    false    2958    222    220            �           2606    17139 +   watch_later_video id_watch_later_video_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.watch_later_video
    ADD CONSTRAINT id_watch_later_video_frky FOREIGN KEY (id) REFERENCES public.watch_later_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.watch_later_video DROP CONSTRAINT id_watch_later_video_frky;
       public          postgres    false    213    2927    202            �           2606    17066 .   playlist_video playlist_id_playlist_video_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlist_video
    ADD CONSTRAINT playlist_id_playlist_video_frky FOREIGN KEY (playlist_id) REFERENCES public.playlist_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.playlist_video DROP CONSTRAINT playlist_id_playlist_video_frky;
       public          postgres    false    2948    211    212            �           2606    17183    comment user_id_comment_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT user_id_comment_frky FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 F   ALTER TABLE ONLY public.comment DROP CONSTRAINT user_id_comment_frky;
       public          postgres    false    2934    206    216            �           2606    17010 2   membership_channel user_id_membership_channel_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.membership_channel
    ADD CONSTRAINT user_id_membership_channel_frky FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.membership_channel DROP CONSTRAINT user_id_membership_channel_frky;
       public          postgres    false    206    207    2934            �           2606    17051 #   playlist_user user_id_playlist_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlist_user
    ADD CONSTRAINT user_id_playlist_user FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.playlist_user DROP CONSTRAINT user_id_playlist_user;
       public          postgres    false    2934    211    206            �           2606    17234 &   user_channel user_id_user_channel_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_channel
    ADD CONSTRAINT user_id_user_channel_frky FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 P   ALTER TABLE ONLY public.user_channel DROP CONSTRAINT user_id_user_channel_frky;
       public          postgres    false    206    2934    220            �           2606    17257 $   user_upload user_id_user_upload_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_upload
    ADD CONSTRAINT user_id_user_upload_frky FOREIGN KEY (user_id_user) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public.user_upload DROP CONSTRAINT user_id_user_upload_frky;
       public          postgres    false    222    2934    206            �           2606    17157 &   user_watched user_id_user_watched_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_watched
    ADD CONSTRAINT user_id_user_watched_frky FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.user_watched DROP CONSTRAINT user_id_user_watched_frky;
       public          postgres    false    2934    206    214            �           2606    17033    video user_id_video_frkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.video
    ADD CONSTRAINT user_id_video_frkey FOREIGN KEY (user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY public.video DROP CONSTRAINT user_id_video_frkey;
       public          postgres    false    209    206    2934            �           2606    17178    comment video_id_comment_frkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT video_id_comment_frkey FOREIGN KEY (video_id) REFERENCES public.video(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public.comment DROP CONSTRAINT video_id_comment_frkey;
       public          postgres    false    216    209    2945            �           2606    17061 ,   playlist_video video_id_playlist_video_frkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.playlist_video
    ADD CONSTRAINT video_id_playlist_video_frkey FOREIGN KEY (video_id) REFERENCES public.video(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.playlist_video DROP CONSTRAINT video_id_playlist_video_frkey;
       public          postgres    false    2945    209    212            �           2606    17152 '   user_watched video_id_user_watched_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_watched
    ADD CONSTRAINT video_id_user_watched_frky FOREIGN KEY (video_id) REFERENCES public.video(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.user_watched DROP CONSTRAINT video_id_user_watched_frky;
       public          postgres    false    209    214    2945            �           2606    17134 1   watch_later_video video_id_watch_later_video_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.watch_later_video
    ADD CONSTRAINT video_id_watch_later_video_frky FOREIGN KEY (video_id) REFERENCES public.video(id) ON UPDATE CASCADE ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.watch_later_video DROP CONSTRAINT video_id_watch_later_video_frky;
       public          postgres    false    213    2945    209            �           2606    17267 $   user_upload videoid_user_upload_frky    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_upload
    ADD CONSTRAINT videoid_user_upload_frky FOREIGN KEY (videoid) REFERENCES public.video(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public.user_upload DROP CONSTRAINT videoid_user_upload_frky;
       public          postgres    false    2945    209    222            �           2606    16975    user watch_later_id_frkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT watch_later_id_frkey FOREIGN KEY (watch_later_id) REFERENCES public.watch_later_user(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 E   ALTER TABLE ONLY public."user" DROP CONSTRAINT watch_later_id_frkey;
       public          postgres    false    202    206    2927            +   y   x���A
�@�=�����d���"���Q=����@N�>E�C�faa��f�s�Յ�F�b#�ϵӍ�mq��5s;�b ż�R��P�g�H�̹|�:.ۂ3R.8�<0�Qv����3j      7   g   x�M�;�0Cg�� ���V@ ��M���~�2!�PJy��fi���u�ق�(ji3:P@T�{x5`�QxT<���Y�>�C���H���y)�n�� Ŧ.�      .   /   x���	  ��m1��	X��ס�̑��&[������<w��{      2   K   x�3��,�L��,�2B0�9`l;17��8�˔�Ȉ3"c�ihd�e���s�s��9���@=N� '*      3   9   x�%��	  �w�!�b����>�qs�Q���P��e[%JP��?T�; <SA	2      9   e   x�M�1� ���)8�Qл�,!�Q j��
c�2����69�0���D���� "?|�����ǵ�!����O���F��7AJ��l�R��i��"zNI'      -   �   x���=O�0@g���8��nL���Ѣ�P"5b8~=��^N,�e���)�{����_�����?����*Pj�;�r@�4���,�~
�15�Z7,��,�e�63�!���I�K�$�lV��F�
yigb'%�P�?k�U���M�K��&�V�T�	��q��G�jdl�b:%�c`4�.�~:B�ܲ��!f��w�gvN�[���L�8Q��m.0T�6��+ߟf΅:5on�K��NC��N?��:0ƾ���P      ;   +   x���  ��eDB[1�ρm+\��7G��R��zK�]��      =   H   x�5�� !D��L1AA�e��cǸ�_^ �0�옿�d+�uUL,te��ׅB(w.q�oIk��6����� )�T      5   C   x�M��� C��"�Y�K��Hp����L$+����E/��E�<;Qw����1�$|�>��      0   �   x���A
� ���SdR�Q�^"'�F�	����.r�jL
)BA?����Du�:��ǺLMI!ZC���q�����la��Yp ��5o+��b��C��{��ŵm+�)mb�f��q؏��O��y:]�ϕT_�Īt
�~�����x!���L      )   "   x�3�2�2�2�2�2�2���24������ ,�K      4   5   x���� ���0Us�r���s��eٖ��Ɋ����bj�':l���M���O     