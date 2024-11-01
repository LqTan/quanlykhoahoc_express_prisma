PGDMP  (                	    |            quanlykhoahoc    16.4    16.4 M    r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    16398    quanlykhoahoc    DATABASE     �   CREATE DATABASE quanlykhoahoc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1258';
    DROP DATABASE quanlykhoahoc;
                postgres    false            �            1259    16399    accounts    TABLE     �   CREATE TABLE public.accounts (
    id_account character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.accounts;
       public         heap    postgres    false            �            1259    16590    baitap    TABLE     �   CREATE TABLE public.baitap (
    id_baitap character varying NOT NULL,
    noidung text,
    id_hoatdong character varying(255) NOT NULL
);
    DROP TABLE public.baitap;
       public         heap    postgres    false            �            1259    16570    chude_monhoc    TABLE     �   CREATE TABLE public.chude_monhoc (
    id_chude_mh character varying(255) NOT NULL,
    ten_chude character varying(255) NOT NULL,
    id_monhoc character varying(255) NOT NULL
);
     DROP TABLE public.chude_monhoc;
       public         heap    postgres    false            �            1259    16430    chuong_trinh_dao_tao    TABLE     �   CREATE TABLE public.chuong_trinh_dao_tao (
    id_ct_dao_tao character varying(255) NOT NULL,
    ten_ct_dao_tao character varying(255) NOT NULL
);
 (   DROP TABLE public.chuong_trinh_dao_tao;
       public         heap    postgres    false            �            1259    16546    diem_monhoc    TABLE     _  CREATE TABLE public.diem_monhoc (
    id_diem_mh character varying(255) NOT NULL,
    diem_quatrinh double precision,
    diem_giuaki double precision,
    diem_cuoiki double precision,
    diem_tb_hebon double precision,
    diem_tb_hemuoi double precision,
    diem_tb_chu character varying(20),
    id_thamgia_lh character varying(255) NOT NULL
);
    DROP TABLE public.diem_monhoc;
       public         heap    postgres    false            �            1259    16418 	   giangvien    TABLE     &  CREATE TABLE public.giangvien (
    id_giangvien character varying(255) NOT NULL,
    hoten character varying(255),
    ngaysinh date,
    gioitinh character varying(20),
    thuongtru text,
    tamtru text,
    trinhdo character varying(255),
    id_account character varying(255) NOT NULL
);
    DROP TABLE public.giangvien;
       public         heap    postgres    false            �            1259    16583    hoatdong_hoctap    TABLE     �   CREATE TABLE public.hoatdong_hoctap (
    id_hoatdong character varying(255) NOT NULL,
    id_chude_mh character varying(255) NOT NULL
);
 #   DROP TABLE public.hoatdong_hoctap;
       public         heap    postgres    false            �            1259    16485    hocki    TABLE     {   CREATE TABLE public.hocki (
    id_hocki character varying(255) NOT NULL,
    ten_hocki character varying(255) NOT NULL
);
    DROP TABLE public.hocki;
       public         heap    postgres    false            �            1259    16406    hocvien    TABLE     }  CREATE TABLE public.hocvien (
    id_hocvien character varying(255) NOT NULL,
    hoten character varying,
    ngaysinh date,
    gioitinh character varying(20),
    dantoc character varying(20),
    tongiao character varying(100),
    thuongtru text,
    tamtru text,
    tencoquan character varying(255),
    diachi_coquan text,
    id_account character varying(255) NOT NULL
);
    DROP TABLE public.hocvien;
       public         heap    postgres    false            �            1259    16444    khoahoc    TABLE     �   CREATE TABLE public.khoahoc (
    id_khoahoc character varying(255) NOT NULL,
    ten_khoahoc character varying(255) NOT NULL,
    ngay_batdau date,
    ngay_ketthuc date
);
    DROP TABLE public.khoahoc;
       public         heap    postgres    false            �            1259    16517    lichhoc    TABLE       CREATE TABLE public.lichhoc (
    id_lichhoc character varying(255) NOT NULL,
    thu character varying(10),
    gio_batdau time with time zone,
    gio_ketthuc time with time zone,
    phonghoc character varying(255),
    id_lophoc character varying(255) NOT NULL
);
    DROP TABLE public.lichhoc;
       public         heap    postgres    false            �            1259    16558    lichsuthanhtoan    TABLE       CREATE TABLE public.lichsuthanhtoan (
    id_lstt_monhoc character varying(255) NOT NULL,
    sotien double precision,
    ngaythanhtoan date,
    id_thamgia_lh character varying(255) NOT NULL,
    hinhthucthanhtoan character varying(255),
    trangthai character varying(10)
);
 #   DROP TABLE public.lichsuthanhtoan;
       public         heap    postgres    false            �            1259    16499    lophoc    TABLE       CREATE TABLE public.lophoc (
    id_lophoc character varying(255) NOT NULL,
    so_hv_toida integer DEFAULT 0 NOT NULL,
    ngay_batdau date,
    ngay_ketthuc date,
    id_hocki character varying(255) NOT NULL,
    id_namhoc character varying(255) NOT NULL
);
    DROP TABLE public.lophoc;
       public         heap    postgres    false            �            1259    16468    monhoc    TABLE     $  CREATE TABLE public.monhoc (
    id_monhoc character varying(255) NOT NULL,
    ten_monhoc character varying(255) NOT NULL,
    mota text,
    sotinchi integer,
    hocphi double precision,
    id_nhom_monhoc character varying(255) NOT NULL,
    id_khoahoc character varying(255) NOT NULL
);
    DROP TABLE public.monhoc;
       public         heap    postgres    false            �            1259    16492    namhoc    TABLE     z   CREATE TABLE public.namhoc (
    id_namhoc character varying(255) NOT NULL,
    namhoc character varying(255) NOT NULL
);
    DROP TABLE public.namhoc;
       public         heap    postgres    false            �            1259    16461    nhom_monhoc    TABLE     �   CREATE TABLE public.nhom_monhoc (
    id_nhom_monhoc character varying(255) NOT NULL,
    tennhom character varying(255) NOT NULL
);
    DROP TABLE public.nhom_monhoc;
       public         heap    postgres    false            �            1259    16602    tailieu    TABLE     �   CREATE TABLE public.tailieu (
    id_tailieu character varying(255) NOT NULL,
    id_hoatdong character varying(255) NOT NULL
);
    DROP TABLE public.tailieu;
       public         heap    postgres    false            �            1259    16529    thamgia_lophoc    TABLE     �   CREATE TABLE public.thamgia_lophoc (
    id_thamgia_lh character varying(255) NOT NULL,
    id_lophoc character varying(255) NOT NULL,
    id_account character varying(255) NOT NULL
);
 "   DROP TABLE public.thamgia_lophoc;
       public         heap    postgres    false            �            1259    16437    tochuc_khoahoc    TABLE     �   CREATE TABLE public.tochuc_khoahoc (
    id_tochuc_khoahoc character varying(255) NOT NULL,
    id_ct_dao_tao character varying(255) NOT NULL,
    id_khoahoc character varying(255) NOT NULL
);
 "   DROP TABLE public.tochuc_khoahoc;
       public         heap    postgres    false            ]          0    16399    accounts 
   TABLE DATA           B   COPY public.accounts (id_account, username, password) FROM stdin;
    public          postgres    false    215   ;`       n          0    16590    baitap 
   TABLE DATA           A   COPY public.baitap (id_baitap, noidung, id_hoatdong) FROM stdin;
    public          postgres    false    232   j`       l          0    16570    chude_monhoc 
   TABLE DATA           I   COPY public.chude_monhoc (id_chude_mh, ten_chude, id_monhoc) FROM stdin;
    public          postgres    false    230   �`       `          0    16430    chuong_trinh_dao_tao 
   TABLE DATA           M   COPY public.chuong_trinh_dao_tao (id_ct_dao_tao, ten_ct_dao_tao) FROM stdin;
    public          postgres    false    218   �`       j          0    16546    diem_monhoc 
   TABLE DATA           �   COPY public.diem_monhoc (id_diem_mh, diem_quatrinh, diem_giuaki, diem_cuoiki, diem_tb_hebon, diem_tb_hemuoi, diem_tb_chu, id_thamgia_lh) FROM stdin;
    public          postgres    false    228   �`       _          0    16418 	   giangvien 
   TABLE DATA           t   COPY public.giangvien (id_giangvien, hoten, ngaysinh, gioitinh, thuongtru, tamtru, trinhdo, id_account) FROM stdin;
    public          postgres    false    217   �`       m          0    16583    hoatdong_hoctap 
   TABLE DATA           C   COPY public.hoatdong_hoctap (id_hoatdong, id_chude_mh) FROM stdin;
    public          postgres    false    231   �`       e          0    16485    hocki 
   TABLE DATA           4   COPY public.hocki (id_hocki, ten_hocki) FROM stdin;
    public          postgres    false    223   a       ^          0    16406    hocvien 
   TABLE DATA           �   COPY public.hocvien (id_hocvien, hoten, ngaysinh, gioitinh, dantoc, tongiao, thuongtru, tamtru, tencoquan, diachi_coquan, id_account) FROM stdin;
    public          postgres    false    216   5a       b          0    16444    khoahoc 
   TABLE DATA           U   COPY public.khoahoc (id_khoahoc, ten_khoahoc, ngay_batdau, ngay_ketthuc) FROM stdin;
    public          postgres    false    220   Ra       h          0    16517    lichhoc 
   TABLE DATA           `   COPY public.lichhoc (id_lichhoc, thu, gio_batdau, gio_ketthuc, phonghoc, id_lophoc) FROM stdin;
    public          postgres    false    226   oa       k          0    16558    lichsuthanhtoan 
   TABLE DATA           }   COPY public.lichsuthanhtoan (id_lstt_monhoc, sotien, ngaythanhtoan, id_thamgia_lh, hinhthucthanhtoan, trangthai) FROM stdin;
    public          postgres    false    229   �a       g          0    16499    lophoc 
   TABLE DATA           h   COPY public.lophoc (id_lophoc, so_hv_toida, ngay_batdau, ngay_ketthuc, id_hocki, id_namhoc) FROM stdin;
    public          postgres    false    225   �a       d          0    16468    monhoc 
   TABLE DATA           k   COPY public.monhoc (id_monhoc, ten_monhoc, mota, sotinchi, hocphi, id_nhom_monhoc, id_khoahoc) FROM stdin;
    public          postgres    false    222   �a       f          0    16492    namhoc 
   TABLE DATA           3   COPY public.namhoc (id_namhoc, namhoc) FROM stdin;
    public          postgres    false    224   �a       c          0    16461    nhom_monhoc 
   TABLE DATA           >   COPY public.nhom_monhoc (id_nhom_monhoc, tennhom) FROM stdin;
    public          postgres    false    221    b       o          0    16602    tailieu 
   TABLE DATA           :   COPY public.tailieu (id_tailieu, id_hoatdong) FROM stdin;
    public          postgres    false    233   b       i          0    16529    thamgia_lophoc 
   TABLE DATA           N   COPY public.thamgia_lophoc (id_thamgia_lh, id_lophoc, id_account) FROM stdin;
    public          postgres    false    227   :b       a          0    16437    tochuc_khoahoc 
   TABLE DATA           V   COPY public.tochuc_khoahoc (id_tochuc_khoahoc, id_ct_dao_tao, id_khoahoc) FROM stdin;
    public          postgres    false    219   Wb       �           2606    16405    accounts accounts_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id_account);
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public            postgres    false    215            �           2606    16596    baitap baitap_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.baitap
    ADD CONSTRAINT baitap_pkey PRIMARY KEY (id_baitap);
 <   ALTER TABLE ONLY public.baitap DROP CONSTRAINT baitap_pkey;
       public            postgres    false    232            �           2606    16576    chude_monhoc chude_monhoc_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.chude_monhoc
    ADD CONSTRAINT chude_monhoc_pkey PRIMARY KEY (id_chude_mh);
 H   ALTER TABLE ONLY public.chude_monhoc DROP CONSTRAINT chude_monhoc_pkey;
       public            postgres    false    230            �           2606    16436 .   chuong_trinh_dao_tao chuong_trinh_dao_tao_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.chuong_trinh_dao_tao
    ADD CONSTRAINT chuong_trinh_dao_tao_pkey PRIMARY KEY (id_ct_dao_tao);
 X   ALTER TABLE ONLY public.chuong_trinh_dao_tao DROP CONSTRAINT chuong_trinh_dao_tao_pkey;
       public            postgres    false    218            �           2606    16552    diem_monhoc diem_monhoc_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.diem_monhoc
    ADD CONSTRAINT diem_monhoc_pkey PRIMARY KEY (id_diem_mh);
 F   ALTER TABLE ONLY public.diem_monhoc DROP CONSTRAINT diem_monhoc_pkey;
       public            postgres    false    228            �           2606    16424    giangvien giangvien_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.giangvien
    ADD CONSTRAINT giangvien_pkey PRIMARY KEY (id_giangvien);
 B   ALTER TABLE ONLY public.giangvien DROP CONSTRAINT giangvien_pkey;
       public            postgres    false    217            �           2606    16589 $   hoatdong_hoctap hoatdong_hoctap_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.hoatdong_hoctap
    ADD CONSTRAINT hoatdong_hoctap_pkey PRIMARY KEY (id_hoatdong);
 N   ALTER TABLE ONLY public.hoatdong_hoctap DROP CONSTRAINT hoatdong_hoctap_pkey;
       public            postgres    false    231            �           2606    16491    hocki hocki_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.hocki
    ADD CONSTRAINT hocki_pkey PRIMARY KEY (id_hocki);
 :   ALTER TABLE ONLY public.hocki DROP CONSTRAINT hocki_pkey;
       public            postgres    false    223            �           2606    16412    hocvien hocvien_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hocvien
    ADD CONSTRAINT hocvien_pkey PRIMARY KEY (id_hocvien);
 >   ALTER TABLE ONLY public.hocvien DROP CONSTRAINT hocvien_pkey;
       public            postgres    false    216            �           2606    16450    khoahoc khoahoc_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.khoahoc
    ADD CONSTRAINT khoahoc_pkey PRIMARY KEY (id_khoahoc);
 >   ALTER TABLE ONLY public.khoahoc DROP CONSTRAINT khoahoc_pkey;
       public            postgres    false    220            �           2606    16521    lichhoc lichhoc_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.lichhoc
    ADD CONSTRAINT lichhoc_pkey PRIMARY KEY (id_lichhoc);
 >   ALTER TABLE ONLY public.lichhoc DROP CONSTRAINT lichhoc_pkey;
       public            postgres    false    226            �           2606    16564 $   lichsuthanhtoan lichsuthanhtoan_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.lichsuthanhtoan
    ADD CONSTRAINT lichsuthanhtoan_pkey PRIMARY KEY (id_lstt_monhoc);
 N   ALTER TABLE ONLY public.lichsuthanhtoan DROP CONSTRAINT lichsuthanhtoan_pkey;
       public            postgres    false    229            �           2606    16506    lophoc lophoc_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.lophoc
    ADD CONSTRAINT lophoc_pkey PRIMARY KEY (id_lophoc);
 <   ALTER TABLE ONLY public.lophoc DROP CONSTRAINT lophoc_pkey;
       public            postgres    false    225            �           2606    16474    monhoc monhoc_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.monhoc
    ADD CONSTRAINT monhoc_pkey PRIMARY KEY (id_monhoc);
 <   ALTER TABLE ONLY public.monhoc DROP CONSTRAINT monhoc_pkey;
       public            postgres    false    222            �           2606    16498    namhoc namhoc_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.namhoc
    ADD CONSTRAINT namhoc_pkey PRIMARY KEY (id_namhoc);
 <   ALTER TABLE ONLY public.namhoc DROP CONSTRAINT namhoc_pkey;
       public            postgres    false    224            �           2606    16467    nhom_monhoc nhom_monhoc_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.nhom_monhoc
    ADD CONSTRAINT nhom_monhoc_pkey PRIMARY KEY (id_nhom_monhoc);
 F   ALTER TABLE ONLY public.nhom_monhoc DROP CONSTRAINT nhom_monhoc_pkey;
       public            postgres    false    221            �           2606    16608    tailieu tailieu_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tailieu
    ADD CONSTRAINT tailieu_pkey PRIMARY KEY (id_tailieu);
 >   ALTER TABLE ONLY public.tailieu DROP CONSTRAINT tailieu_pkey;
       public            postgres    false    233            �           2606    16535 "   thamgia_lophoc thamgia_lophoc_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.thamgia_lophoc
    ADD CONSTRAINT thamgia_lophoc_pkey PRIMARY KEY (id_thamgia_lh);
 L   ALTER TABLE ONLY public.thamgia_lophoc DROP CONSTRAINT thamgia_lophoc_pkey;
       public            postgres    false    227            �           2606    16443 "   tochuc_khoahoc tochuc_khoahoc_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tochuc_khoahoc
    ADD CONSTRAINT tochuc_khoahoc_pkey PRIMARY KEY (id_tochuc_khoahoc);
 L   ALTER TABLE ONLY public.tochuc_khoahoc DROP CONSTRAINT tochuc_khoahoc_pkey;
       public            postgres    false    219            �           2606    16425    giangvien fk_account    FK CONSTRAINT     �   ALTER TABLE ONLY public.giangvien
    ADD CONSTRAINT fk_account FOREIGN KEY (id_account) REFERENCES public.accounts(id_account) NOT VALID;
 >   ALTER TABLE ONLY public.giangvien DROP CONSTRAINT fk_account;
       public          postgres    false    217    4761    215            �           2606    16536    thamgia_lophoc fk_account    FK CONSTRAINT     �   ALTER TABLE ONLY public.thamgia_lophoc
    ADD CONSTRAINT fk_account FOREIGN KEY (id_account) REFERENCES public.accounts(id_account) NOT VALID;
 C   ALTER TABLE ONLY public.thamgia_lophoc DROP CONSTRAINT fk_account;
       public          postgres    false    227    4761    215            �           2606    16451    tochuc_khoahoc fk_ct_dao_tao    FK CONSTRAINT     �   ALTER TABLE ONLY public.tochuc_khoahoc
    ADD CONSTRAINT fk_ct_dao_tao FOREIGN KEY (id_ct_dao_tao) REFERENCES public.chuong_trinh_dao_tao(id_ct_dao_tao) NOT VALID;
 F   ALTER TABLE ONLY public.tochuc_khoahoc DROP CONSTRAINT fk_ct_dao_tao;
       public          postgres    false    219    4767    218            �           2606    16597    baitap fk_hoatdong    FK CONSTRAINT     �   ALTER TABLE ONLY public.baitap
    ADD CONSTRAINT fk_hoatdong FOREIGN KEY (id_hoatdong) REFERENCES public.hoatdong_hoctap(id_hoatdong) NOT VALID;
 <   ALTER TABLE ONLY public.baitap DROP CONSTRAINT fk_hoatdong;
       public          postgres    false    4793    231    232            �           2606    16609    tailieu fk_hoatdong    FK CONSTRAINT     �   ALTER TABLE ONLY public.tailieu
    ADD CONSTRAINT fk_hoatdong FOREIGN KEY (id_hoatdong) REFERENCES public.hoatdong_hoctap(id_hoatdong) NOT VALID;
 =   ALTER TABLE ONLY public.tailieu DROP CONSTRAINT fk_hoatdong;
       public          postgres    false    231    4793    233            �           2606    16507    lophoc fk_hocki    FK CONSTRAINT        ALTER TABLE ONLY public.lophoc
    ADD CONSTRAINT fk_hocki FOREIGN KEY (id_hocki) REFERENCES public.hocki(id_hocki) NOT VALID;
 9   ALTER TABLE ONLY public.lophoc DROP CONSTRAINT fk_hocki;
       public          postgres    false    223    4777    225            �           2606    16456    tochuc_khoahoc fk_khoahoc    FK CONSTRAINT     �   ALTER TABLE ONLY public.tochuc_khoahoc
    ADD CONSTRAINT fk_khoahoc FOREIGN KEY (id_khoahoc) REFERENCES public.khoahoc(id_khoahoc) NOT VALID;
 C   ALTER TABLE ONLY public.tochuc_khoahoc DROP CONSTRAINT fk_khoahoc;
       public          postgres    false    220    4771    219            �           2606    16475    monhoc fk_khoahoc    FK CONSTRAINT     �   ALTER TABLE ONLY public.monhoc
    ADD CONSTRAINT fk_khoahoc FOREIGN KEY (id_khoahoc) REFERENCES public.khoahoc(id_khoahoc) NOT VALID;
 ;   ALTER TABLE ONLY public.monhoc DROP CONSTRAINT fk_khoahoc;
       public          postgres    false    4771    222    220            �           2606    16524    lichhoc fk_lophoc    FK CONSTRAINT     �   ALTER TABLE ONLY public.lichhoc
    ADD CONSTRAINT fk_lophoc FOREIGN KEY (id_lophoc) REFERENCES public.lophoc(id_lophoc) NOT VALID;
 ;   ALTER TABLE ONLY public.lichhoc DROP CONSTRAINT fk_lophoc;
       public          postgres    false    225    226    4781            �           2606    16541    thamgia_lophoc fk_lophoc    FK CONSTRAINT     �   ALTER TABLE ONLY public.thamgia_lophoc
    ADD CONSTRAINT fk_lophoc FOREIGN KEY (id_lophoc) REFERENCES public.lophoc(id_lophoc) NOT VALID;
 B   ALTER TABLE ONLY public.thamgia_lophoc DROP CONSTRAINT fk_lophoc;
       public          postgres    false    227    4781    225            �           2606    16578    chude_monhoc fk_monhoc    FK CONSTRAINT     �   ALTER TABLE ONLY public.chude_monhoc
    ADD CONSTRAINT fk_monhoc FOREIGN KEY (id_monhoc) REFERENCES public.monhoc(id_monhoc) NOT VALID;
 @   ALTER TABLE ONLY public.chude_monhoc DROP CONSTRAINT fk_monhoc;
       public          postgres    false    230    4775    222            �           2606    16512    lophoc fk_namhoc    FK CONSTRAINT     �   ALTER TABLE ONLY public.lophoc
    ADD CONSTRAINT fk_namhoc FOREIGN KEY (id_namhoc) REFERENCES public.namhoc(id_namhoc) NOT VALID;
 :   ALTER TABLE ONLY public.lophoc DROP CONSTRAINT fk_namhoc;
       public          postgres    false    225    224    4779            �           2606    16480    monhoc fk_nhom_monhoc    FK CONSTRAINT     �   ALTER TABLE ONLY public.monhoc
    ADD CONSTRAINT fk_nhom_monhoc FOREIGN KEY (id_nhom_monhoc) REFERENCES public.nhom_monhoc(id_nhom_monhoc) NOT VALID;
 ?   ALTER TABLE ONLY public.monhoc DROP CONSTRAINT fk_nhom_monhoc;
       public          postgres    false    221    222    4773            �           2606    16553    diem_monhoc fk_thamgia_lh    FK CONSTRAINT     �   ALTER TABLE ONLY public.diem_monhoc
    ADD CONSTRAINT fk_thamgia_lh FOREIGN KEY (id_thamgia_lh) REFERENCES public.thamgia_lophoc(id_thamgia_lh) NOT VALID;
 C   ALTER TABLE ONLY public.diem_monhoc DROP CONSTRAINT fk_thamgia_lh;
       public          postgres    false    228    4785    227            �           2606    16565    lichsuthanhtoan fk_thamgia_lh    FK CONSTRAINT     �   ALTER TABLE ONLY public.lichsuthanhtoan
    ADD CONSTRAINT fk_thamgia_lh FOREIGN KEY (id_thamgia_lh) REFERENCES public.thamgia_lophoc(id_thamgia_lh) NOT VALID;
 G   ALTER TABLE ONLY public.lichsuthanhtoan DROP CONSTRAINT fk_thamgia_lh;
       public          postgres    false    229    227    4785            �           2606    16413    hocvien fkey_account    FK CONSTRAINT     �   ALTER TABLE ONLY public.hocvien
    ADD CONSTRAINT fkey_account FOREIGN KEY (id_account) REFERENCES public.accounts(id_account) ON DELETE SET NULL NOT VALID;
 >   ALTER TABLE ONLY public.hocvien DROP CONSTRAINT fkey_account;
       public          postgres    false    4761    216    215            ]      x��3�,�(�M�+.��4�3�b���� y?�      n      x������ � �      l      x������ � �      `      x������ � �      j      x������ � �      _      x������ � �      m      x������ � �      e      x������ � �      ^      x������ � �      b      x������ � �      h      x������ � �      k      x������ � �      g      x������ � �      d      x������ � �      f      x������ � �      c      x������ � �      o      x������ � �      i      x������ � �      a      x������ � �     