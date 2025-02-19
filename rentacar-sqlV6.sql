PGDMP     -                    |            rentacar    15.4    15.4 5    @           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            A           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            B           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            C           1262    16653    rentacar    DATABASE     |   CREATE DATABASE rentacar WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Turkish_Turkey.1254';
    DROP DATABASE rentacar;
                postgres    false            �            1259    16655    brands    TABLE     ]   CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.brands;
       public         heap    postgres    false            �            1259    16654    brands_id_seq    SEQUENCE     �   ALTER TABLE public.brands ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    16701    cars    TABLE     �  CREATE TABLE public.cars (
    id integer NOT NULL,
    kilometer integer NOT NULL,
    plate character varying NOT NULL,
    year integer NOT NULL,
    daily_price double precision NOT NULL,
    model_id integer NOT NULL,
    color_id integer NOT NULL,
    image character varying,
    logo character varying,
    seat integer,
    fuel character varying(255),
    gear character varying(255),
    luggage integer,
    requirement_id integer
);
    DROP TABLE public.cars;
       public         heap    postgres    false            �            1259    16700    cars_id_seq    SEQUENCE     �   ALTER TABLE public.cars ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    223            �            1259    16685    colors    TABLE     ]   CREATE TABLE public.colors (
    id integer NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.colors;
       public         heap    postgres    false            �            1259    16684    colors_id_seq    SEQUENCE     �   ALTER TABLE public.colors ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    219            �            1259    16735    invoices    TABLE     �   CREATE TABLE public.invoices (
    id integer NOT NULL,
    create_date timestamp(6) without time zone NOT NULL,
    rental_id integer NOT NULL
);
    DROP TABLE public.invoices;
       public         heap    postgres    false            �            1259    16734    invoices_id_seq    SEQUENCE     �   ALTER TABLE public.invoices ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    227            �            1259    16672    models    TABLE     |   CREATE TABLE public.models (
    id integer NOT NULL,
    name character varying NOT NULL,
    brand_id integer NOT NULL
);
    DROP TABLE public.models;
       public         heap    postgres    false            �            1259    16671    models_id_seq    SEQUENCE     �   ALTER TABLE public.models ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    16719    rentals    TABLE     9  CREATE TABLE public.rentals (
    id integer NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    return_date date,
    start_kilometer integer NOT NULL,
    end_kilometer integer NOT NULL,
    total_price double precision NOT NULL,
    car_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.rentals;
       public         heap    postgres    false            �            1259    16718    rentals_id_seq    SEQUENCE     �   ALTER TABLE public.rentals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.rentals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    225            �            1259    25042    requirements    TABLE     �   CREATE TABLE public.requirements (
    id integer NOT NULL,
    min_age integer,
    min_card integer,
    min_license integer,
    rating double precision,
    review double precision
);
     DROP TABLE public.requirements;
       public         heap    postgres    false            �            1259    25041    requirements_id_seq    SEQUENCE     �   CREATE SEQUENCE public.requirements_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.requirements_id_seq;
       public          postgres    false    229            D           0    0    requirements_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.requirements_id_seq OWNED BY public.requirements.id;
          public          postgres    false    228            �            1259    16693    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying,
    surname character varying,
    email character varying,
    birth_date date,
    password character varying(255),
    username character varying(255),
    role character varying[]
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16692    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    221            �           2604    25045    requirements id    DEFAULT     r   ALTER TABLE ONLY public.requirements ALTER COLUMN id SET DEFAULT nextval('public.requirements_id_seq'::regclass);
 >   ALTER TABLE public.requirements ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229            /          0    16655    brands 
   TABLE DATA           *   COPY public.brands (id, name) FROM stdin;
    public          postgres    false    215   T<       7          0    16701    cars 
   TABLE DATA           �   COPY public.cars (id, kilometer, plate, year, daily_price, model_id, color_id, image, logo, seat, fuel, gear, luggage, requirement_id) FROM stdin;
    public          postgres    false    223   �<       3          0    16685    colors 
   TABLE DATA           *   COPY public.colors (id, name) FROM stdin;
    public          postgres    false    219   �>       ;          0    16735    invoices 
   TABLE DATA           >   COPY public.invoices (id, create_date, rental_id) FROM stdin;
    public          postgres    false    227   G?       1          0    16672    models 
   TABLE DATA           4   COPY public.models (id, name, brand_id) FROM stdin;
    public          postgres    false    217   d?       9          0    16719    rentals 
   TABLE DATA           �   COPY public.rentals (id, start_date, end_date, return_date, start_kilometer, end_kilometer, total_price, car_id, user_id) FROM stdin;
    public          postgres    false    225   @       =          0    25042    requirements 
   TABLE DATA           Z   COPY public.requirements (id, min_age, min_card, min_license, rating, review) FROM stdin;
    public          postgres    false    229   �@       5          0    16693    users 
   TABLE DATA           _   COPY public.users (id, name, surname, email, birth_date, password, username, role) FROM stdin;
    public          postgres    false    221   A       E           0    0    brands_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.brands_id_seq', 9, true);
          public          postgres    false    214            F           0    0    cars_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cars_id_seq', 19, true);
          public          postgres    false    222            G           0    0    colors_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.colors_id_seq', 8, true);
          public          postgres    false    218            H           0    0    invoices_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.invoices_id_seq', 1, false);
          public          postgres    false    226            I           0    0    models_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.models_id_seq', 17, true);
          public          postgres    false    216            J           0    0    rentals_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.rentals_id_seq', 16, true);
          public          postgres    false    224            K           0    0    requirements_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.requirements_id_seq', 5, true);
          public          postgres    false    228            L           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 28, true);
          public          postgres    false    220            �           2606    16664    brands brands_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.brands DROP CONSTRAINT brands_pkey;
       public            postgres    false    215            �           2606    16707    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    223            �           2606    16691    colors colors_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.colors DROP CONSTRAINT colors_pkey;
       public            postgres    false    219            �           2606    16739    invoices invoices_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.invoices DROP CONSTRAINT invoices_pkey;
       public            postgres    false    227            �           2606    16676    models models_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.models DROP CONSTRAINT models_pkey;
       public            postgres    false    217            �           2606    16723    rentals rentals_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT rentals_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.rentals DROP CONSTRAINT rentals_pkey;
       public            postgres    false    225            �           2606    25047    requirements requirements_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.requirements
    ADD CONSTRAINT requirements_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.requirements DROP CONSTRAINT requirements_pkey;
       public            postgres    false    229            �           2606    16699    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            �           2606    16679    models FK_BRAND_MODEL    FK CONSTRAINT     x   ALTER TABLE ONLY public.models
    ADD CONSTRAINT "FK_BRAND_MODEL" FOREIGN KEY (brand_id) REFERENCES public.brands(id);
 A   ALTER TABLE ONLY public.models DROP CONSTRAINT "FK_BRAND_MODEL";
       public          postgres    false    3210    217    215            �           2606    16724    rentals FK_CAR_RENTAL    FK CONSTRAINT     t   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT "FK_CAR_RENTAL" FOREIGN KEY (car_id) REFERENCES public.cars(id);
 A   ALTER TABLE ONLY public.rentals DROP CONSTRAINT "FK_CAR_RENTAL";
       public          postgres    false    223    3218    225            �           2606    16713    cars FK_COLOR_CAR    FK CONSTRAINT     t   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT "FK_COLOR_CAR" FOREIGN KEY (color_id) REFERENCES public.colors(id);
 =   ALTER TABLE ONLY public.cars DROP CONSTRAINT "FK_COLOR_CAR";
       public          postgres    false    3214    219    223            �           2606    16708    cars FK_MODEL_CAR    FK CONSTRAINT     t   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT "FK_MODEL_CAR" FOREIGN KEY (model_id) REFERENCES public.models(id);
 =   ALTER TABLE ONLY public.cars DROP CONSTRAINT "FK_MODEL_CAR";
       public          postgres    false    217    223    3212            �           2606    16740    invoices FK_RENTAL_INVOİCE    FK CONSTRAINT     �   ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT "FK_RENTAL_INVOİCE" FOREIGN KEY (rental_id) REFERENCES public.rentals(id);
 G   ALTER TABLE ONLY public.invoices DROP CONSTRAINT "FK_RENTAL_INVOİCE";
       public          postgres    false    227    225    3220            �           2606    16729    rentals FK_USER_RENTAL    FK CONSTRAINT     w   ALTER TABLE ONLY public.rentals
    ADD CONSTRAINT "FK_USER_RENTAL" FOREIGN KEY (user_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.rentals DROP CONSTRAINT "FK_USER_RENTAL";
       public          postgres    false    3216    225    221            �           2606    25048     cars fkt8yu1nrx1pkae3actlufubi4n    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT fkt8yu1nrx1pkae3actlufubi4n FOREIGN KEY (requirement_id) REFERENCES public.requirements(id);
 J   ALTER TABLE ONLY public.cars DROP CONSTRAINT fkt8yu1nrx1pkae3actlufubi4n;
       public          postgres    false    3224    229    223            /   @   x�3�t��2���,�KI��2�t,M��2�t�/J�2��M-JNMI-�2��/*N�H����� ��      7   8  x���Mn�0���)r���2���&mڍ�M�n�UH�+Jh�S�=X��,;��8� �����{1D"D��ӆ2�J-#�
�1�1a^�L����[��F�F�iݾ�`���XQe�pʷ�\��i�"�
�ڦ*e���"�ňq�'	�M�<
0E��a�������\���׹2��
��>�J��4bo����}��~���8��a v03 �@9#��͸b�ǧl�n�Prj�v^��k5��N���L�9<����S|�0�*Y6�"�S�q���7��A� [��f|��x#�1Y��I��N�������c]鴚���+�\��u��wl�)�N+����ʤr��&��(����p���v�d�W���:{��Q��D���2�;�J�}di��Tm��J��Y����Oz`�L����s���9��������U�^������*ED����j�>�P`<��� }��C�<,:����]_�󽧦��R�9�P�B��.�Z�K�ų���7Ʃ�s����aQ�Kk1f�-�|�j��7W��Ţ����m�$      3   K   x�3�JM�2�t�)M�2���,I�2r���L9݋+��8}2�3J�j�9#Ssr�˹,���E��y\1z\\\ .	      ;      x������ � �      1   �   x�E��
�@E��}�?0���2%"(lѢ�C�Y3�ȯo���=�,.7E�2yNj?/�d��0d�+b�0�q�w)��e1���aIk�C�O�r��&�n-*'�:\U=p�I��jNeQƉ�t�����q�%6��~|�N��}CD��,5      9   �   x����� ���K������
�g����%���� ȇ�P�y�
!5��@�c��;#B���
���ȶ��b�]�0�\�����h��j%���]�gr�'F/+�'{r��F�$�b�t�����x��"[��x����O���=��zIXKV�oS���u)?�>�C4�Q*_���8nZ      =   :   x���  �w(�� ��F�^�^�Z�����$X���[�����y�
/      5   �  x�m��n�0���9�ܘ�� bQZq�xS΢8��e�;�`sv0&M����}�x�EW13����~���(�	%ٜ��UU��+� 0�tX���ݦ�l�=���8�����<Lj���zm����n(B���o�\����Cdc=Bb9����g��.�th8G����Ӛ�v?Y^>�HD���j%Z�Ջ;oF՗�T� 7���<N7R��m�|P�.�Fa��r'ޕK�[�}]�L)T�F�����n.��@Z�i��<DE4[*��%Y�ĉ�!(T���>Y�'?]�>~�m�Y�#	�$�5��C8��4�ͅ����̅b= �ܡ��#��r�1�Sϳ������s��JBE�l�?	=7,�{6,c�Г��\��e�/C4��     