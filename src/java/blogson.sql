DROP TABLE blogson_comment;
DROP TABLE blogson_news;
DROP TABLE blogson_style;
DROP TABLE blogson_member_site;
DROP TABLE blogson_member;
DROP TABLE blogson_guestbook;
DROP TABLE blogson_site_vars;

DROP SEQUENCE blogson_news_seq;
DROP SEQUENCE blogson_comment_seq;
DROP SEQUENCE blogson_guestbook_seq;

CREATE SEQUENCE blogson_news_seq;
CREATE SEQUENCE blogson_comment_seq;
CREATE SEQUENCE blogson_guestbook_seq;


CREATE TABLE blogson_site_vars  (
	varsname	varchar(50)	not null,
	title		varchar(50)	not null,
	header		varchar(10000)	not null,
	footer		varchar(10000)	not null,
	agreement	varchar(5000)	not null,
	h_news		varchar(5000)	not null,
	m_news		varchar(5000)	not null,
	a_news		varchar(5000)	not null,
	ownername	varchar(100)	not null,
	owneremail	varchar(100)	not null,
	siteurl		varchar(100)	not null,
	numnews		int		not null,
	numguestbook	int		not null,
	numcomment	int		not null,
	nummember	int		not null,
	style		varchar(10000)	not null,
	gbookquestion	varchar(500)	not null,
	metatags	varchar(10000)	not null,
	left_side	varchar(30000)	not null,
	right_side	varchar(30000)	not null,

	home_nav		varchar(500)	not null,
	members_nav		varchar(500)	not null,
	guestbook_nav		varchar(500)	not null,
        member_nav              varchar(500)    not null,
	user_nav		varchar(500)	not null,
	admin_nav		varchar(500)	not null,
	welcome_user		varchar(500)	not null,
	stats_title		varchar(500)	not null,
	categories_title	varchar(500)	not null,
	news_archives_title	varchar(500)	not null,
	sign_guestbook_link	varchar(500)	not null,
	comment_title		varchar(500)	not null,
	signed_title		varchar(500)	not null,

	stats_date	timestamp,
	stats_count	int,
	stats_total_ms	int,

	rss_description	varchar(5000),

	PRIMARY KEY(varsname)
);

CREATE TABLE blogson_member  (
	fname	varchar(50),
	lname	varchar(50),
	minit	char,
	uname	varchar(50)	not null,
	passw	varchar(50)	not null,
	email	varchar(50),
	website varchar(100),
	info	varchar(50000),
	bday	date,
	gender	varchar(6),
	sessionid varchar(50),

	PRIMARY KEY (uname)
);

CREATE TABLE blogson_member_site  (
	uname	varchar(50)	not null,
	varsname varchar(50)	not null,
	job	varchar(20)	not null,
	activated boolean	not null,
	regdate timestamp	not null,

	PRIMARY KEY (uname, varsname),
	FOREIGN KEY (uname) REFERENCES blogson_member(uname),
	FOREIGN KEY (varsname) REFERENCES blogson_site_vars(varsname)
);

CREATE TABLE blogson_guestbook  (
	guestid		bigint	not null,
	name		varchar(100) not null,
	email		varchar(50),
	website		varchar(100),
	comment		varchar(1000) not null,
	question	varchar(200),
	answer		varchar(200) not null,
	dsign		timestamp not null,

	varsname varchar(50),

	PRIMARY KEY (guestid),
	FOREIGN KEY (varsname) REFERENCES blogson_site_vars(varsname)
);

CREATE TABLE blogson_news  (
	newsid		bigint	not null,
	title		varchar(100),
	content		varchar(5000),
	postdate	timestamp,
	uname		varchar(50)	not null,
	cname		varchar(50),

	varsname varchar(50),

	PRIMARY KEY (newsid),
	FOREIGN KEY (uname) REFERENCES blogson_member(uname),
	FOREIGN KEY (varsname) REFERENCES blogson_site_vars(varsname)
);

CREATE TABLE blogson_comment  (
	comid		bigint	not null,
	name		varchar(50),
	email		varchar(50),
	homepage	varchar(100),
	comment		varchar(10000),
	comdate		timestamp,
	newsid		bigint,

	varsname varchar(50),

	PRIMARY KEY(comid),
	FOREIGN KEY(newsid) REFERENCES blogson_news(newsid),
	FOREIGN KEY (varsname) REFERENCES blogson_site_vars(varsname)
);

create table blogson_style  (
	stylename	varchar(50) not null,
	style		varchar(10000) not null,

	varsname	varchar(50) not null,

	PRIMARY KEY(stylename),
	FOREIGN KEY(varsname) REFERENCES blogson_site_vars(varsname)
);