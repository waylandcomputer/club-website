DROP TABLE IF EXISTS members CASCADE;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS languages;
DROP TABLE IF EXISTS meetings;
DROP TABLE IF EXISTS contacts;

CREATE TABLE members (
    id SERIAL NOT NULL PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL,
    grade TEXT NOT NULL,
    image TEXT NOT NULL,
    position TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT (now() AT TIME ZONE 'EST')
);

-- CREATE TABLE projects (
--     pid SERIAL NOT NULL PRIMARY KEY,
--     name TEXT NOT NULL,
--     owner SERIAL NOT NULL,
--     image TEXT NOT NULL,
--     description TEXT,
--     FOREIGN KEY (owner) REFERENCES members(id)
-- );

CREATE TABLE contacts (
    cid SERIAL NOT NULL PRIMARY KEY,
    link TEXT NOT NULL,
    icon TEXT NOT NULL,
    member SERIAL NOT NULL,
    FOREIGN KEY (member) REFERENCES members(id)
);

CREATE TABLE languages (
    lid SERIAL NOT NULL PRIMARY KEY,
    language TEXT NOT NULL,
    member SERIAL NOT NULL,
    FOREIGN KEY (member) REFERENCES members(id)
);

CREATE TABLE meetings (
    mid SERIAL NOT NULL PRIMARY KEY,
    date TIMESTAMP NOT NULL,
    member SERIAL NOT NULL,
    FOREIGN KEY (member) REFERENCES members(id)
);

SET TIME ZONE 'America/New_York';

INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Andrew', 'Boyer', 12, 'Andrew.png', 'P', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam dignissim turpis eget varius finibus. Sed orci dui, aliquet quis varius id, fermentum eu nunc. Cras urna odio, ornare ut vestibulum vitae, sagittis ac odio. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Morbi lacinia porta dolor. Nunc vestibulum urna quis nisi feugiat elementum. Praesent et risus tincidunt, sollicitudin elit nec, vehicula sapien. Phasellus lobortis ligula quis vestibulum suscipit. Donec volutpat sagittis posuere. Sed ac tellus sit amet nisl dictum elementum sit amet quis mauris. Aliquam eu nulla nec felis sodales suscipit. Ut in diam posuere, luctus dui pellentesque, mollis urna.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Eric', 'Xie', 12, 'eric.jpg', 'VP', 'Praesent egestas fermentum felis, et malesuada odio convallis feugiat. Curabitur convallis lacus vitae feugiat consequat. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Suspendisse luctus nibh vitae neque gravida, id laoreet nulla faucibus. Nulla ultrices tellus nisi, at maximus lorem hendrerit et. Sed vehicula non dui id tincidunt. Proin quis sodales sem, vitae accumsan elit. Pellentesque eros ante, hendrerit id dapibus id, tempor in nibh. Pellentesque euismod vitae dui non mollis. Vestibulum sollicitudin tortor et leo laoreet mollis. Aenean aliquam augue sit amet nibh hendrerit aliquam. Ut laoreet massa non nisi ornare, vel tincidunt tellus euismod. Aliquam vestibulum mattis lectus, rutrum blandit libero congue ac. Vivamus et ante vitae orci faucibus posuere nec at lorem.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Kevin', 'Zhao', 12, 'kevin.jpg', 'VP', 'Sed sed mi nec leo faucibus dictum quis eget nulla. Vivamus consectetur magna lobortis tellus efficitur, id varius urna consectetur. Morbi vitae leo id ex gravida interdum id ac turpis. Quisque quis ultricies nibh. Nam vel lectus et quam elementum tempor sed at odio. Fusce placerat ipsum in fermentum tincidunt. Mauris ultrices, quam quis ullamcorper tincidunt, velit justo interdum massa, vel ultricies leo justo pretium nisi.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Jayanth', 'Mani', 10, 'Jayanth.jpg', 'M', 'Ut odio mi, iaculis sed euismod sodales, tincidunt et nulla. Duis porta risus at convallis vulputate. Maecenas aliquet non massa eget auctor. Etiam molestie quam et aliquam auctor. Cras volutpat est libero, in efficitur ipsum euismod ac. Aenean metus neque, facilisis vel placerat quis, finibus nec quam. Mauris venenatis pulvinar elit vel placerat. Mauris cursus lacus et egestas imperdiet. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam a diam quis velit elementum molestie vitae non nulla. Fusce pretium leo nec ante pretium, at malesuada odio interdum. Proin commodo, purus porttitor dictum ullamcorper, sem neque tristique purus, at tempus dolor metus sit amet nisi. Etiam elementum maximus aliquet. Maecenas feugiat ac turpis sed euismod.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Brendan', 'Shen', 10, 'Brendan.jpg', 'M', 'Maecenas augue dolor, aliquet nec lacinia a, elementum sit amet lorem. Aliquam lectus lacus, scelerisque non malesuada a, imperdiet vitae est. Quisque quis lorem metus. Etiam scelerisque lacus nulla, sed ultricies lorem sodales ut. Morbi quis venenatis lectus. Vivamus ut magna varius, varius lorem eget, lacinia ipsum. Nam imperdiet eros eros, vel tempus ante rutrum facilisis. Aliquam lacinia, lectus venenatis porta aliquam, quam risus pulvinar libero, in sodales augue felis eget diam.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Annie', 'Long', 10, 'Annie.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Kailas', 'Srinivasan', 10, 'Kailas.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Misha', 'Boyko', 12, 'Misha.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Akash', 'Bhukhanwala', 12, 'Akash.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Kevin', 'Lee', 11, 'KevinLee.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Rehan', 'Samaratunga', 12, 'Rehan.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Carson', 'Boyer', 10, 'carson.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Sam', 'Conner', 10, 'Sam.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Ayush', 'Kumar', 10, 'Ayush.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Michael', 'Wightman', 10, 'Michael.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Ben', 'Stahl', 11, 'Ben.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Ayaan', 'Rashid', 12, 'Ayaan.jpg', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');
INSERT INTO members (fname, lname, grade, image, position, description) VALUES ('Ari', 'Zukerman', 10, 'Ari.png', 'M', 'Aliquam a nisi blandit, ultrices enim id, imperdiet sapien. In rutrum, nibh non volutpat rhoncus, mauris nulla semper augue, ut lobortis augue orci at nisl. Maecenas quis lobortis justo. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum egestas interdum purus sagittis pellentesque. Cras sit amet est sit amet urna volutpat ornare at at justo. Morbi vel arcu vitae nibh maximus dapibus nec id magna. Sed sit amet congue tortor. Sed sit amet varius lorem, porta accumsan lorem. Suspendisse dignissim iaculis dolor sit amet luctus. Nulla molestie sem non lectus vehicula tempor.');


INSERT INTO contacts (link, icon, member) VALUES ('https://www.linkedin.com/in/asboyer', 'fab fa-linkedin', 1);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/asboyer', 'fab fa-github', 1);
INSERT INTO contacts (link, icon, member) VALUES ('https://asboyer.com/', 'fas fa-link', 1);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: ericxie6@gmail.com', 'fa fa-envelope', 2);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.instagram.com/ericxie_zz/', 'fab fa-instagram', 2);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/ericx1e', 'fab fa-github', 2);
INSERT INTO contacts (link, icon, member) VALUES ('https://open.spotify.com/user/ericxxie?si=sCJdKbxVQVWEho6fVYAPng', 'fab fa-spotify', 2);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: kevin_zhao@student.waylandps.org', 'fa fa-envelope', 3);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/Kevin-Zhao-Github', 'fab fa-github', 3);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: jayanth.mani14@gmail.com', 'fa fa-envelope', 4);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.linkedin.com/in/jayanth-mani-9777b8206/', 'fab fa-linkedin', 4);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/Jayanth-Mani', 'fab fa-github', 4);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: bshen.324@gmail.com', 'fa fa-envelope', 5);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/Shen0000', 'fab fa-github', 5);

INSERT INTO contacts (link, icon, member) VALUES ('https://www.youtube.com/annielong', 'fab fa-youtube', 6);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.instagram.com/annielongyt/', 'fab fa-instagram', 6);
INSERT INTO contacts (link, icon, member) VALUES ('mailto: annie_long@student.waylandps.org', 'fa fa-envelope', 6);

INSERT INTO contacts (link, icon, member) VALUES ('https://www.youtube.com/channel/UC5_qwJr1J4mdRHWhdwgCAdg', 'fab fa-youtube', 7);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.instagram.com/kailas.srinivasan/', 'fab fa-instagram', 7);
INSERT INTO contacts (link, icon, member) VALUES ('https://twitter.com/mankeyvfx', 'fab fa-twitter', 7);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: mboykombo@gmail.com', 'fa fa-envelope', 8);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.instagram.com/misha.boyko14/', 'fab fa-instagram', 8);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/Misha-Boyko', 'fab fa-github', 8);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: Akash_bhukhanwala@student.waylandps.org', 'fa fa-envelope', 9);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.linkedin.com/in/akashbhukhanwala/', 'fab fa-linkedin', 9);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: rehandsam@gmail.com', 'fa fa-envelope', 11);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/Rehan164', 'fab fa-github', 11);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.linkedin.com/in/rehan-samaratunga-40b310220/', 'fab fa-linkedin', 11);

INSERT INTO contacts (link, icon, member) VALUES ('https://www.instagram.com/carson.boyer/', 'fab fa-instagram', 12);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/TheCarsonBoyer', 'fab fa-github', 12);

INSERT INTO contacts (link, icon, member) VALUES ('https://open.spotify.com/user/3db5ixjm0n68yrf71shqh10uk', 'fab fa-spotify', 13);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/sammmmmc', 'fab fa-github', 13);

INSERT INTO contacts (link, icon, member) VALUES ('ayush_kumar@student.waylandps.org', 'fa fa-envelope', 14);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/akumar2006 ', 'fab fa-github', 14);

INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/MichaelWightman124', 'fab fa-github', 15);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: benjamin_stahl@student.waylandps.org', 'fa fa-envelope', 16);
INSERT INTO contacts (link, icon, member) VALUES ('https://instagram.com/benastahl', 'fab fa-instagram', 16);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/thevolt6', 'fab fa-github', 16);

INSERT INTO contacts (link, icon, member) VALUES ('mailto: ayaan_rashid@student.waylandps.org', 'fa fa-envelope', 17);
INSERT INTO contacts (link, icon, member) VALUES ('https://www.instagram.com/cptcranjuice/', 'fab fa-instagram', 17);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/CptCranJuice', 'fab fa-github', 17);

INSERT INTO contacts (link, icon, member) VALUES ('https://open.spotify.com/user/ggm1ugsuuoshtxsm19m15bf8k?si=mWWj7di6TzCDHg1gRBH_EQ&dl_branch=1', 'fab fa-spotify', 18);
INSERT INTO contacts (link, icon, member) VALUES ('https://github.com/ariiiiiiiiiiiiiZ', 'fab fa-github', 18);
INSERT INTO contacts (link, icon, member) VALUES ('https://twitter.com/shigetora_twit', 'fa fa-twitter', 18);

INSERT INTO languages (language, member) VALUES ('Bash', 1);
INSERT INTO languages (language, member) VALUES ('Java', 1);
INSERT INTO languages (language, member) VALUES ('Javascript', 1);
INSERT INTO languages (language, member) VALUES ('Python', 1);
INSERT INTO languages (language, member) VALUES ('Sublime', 1);
INSERT INTO languages (language, member) VALUES ('Vim', 1);

INSERT INTO languages (language, member) VALUES ('Javascript', 2);
INSERT INTO languages (language, member) VALUES ('Python', 2);

INSERT INTO languages (language, member) VALUES ('C++', 3);
INSERT INTO languages (language, member) VALUES ('Java', 3);
INSERT INTO languages (language, member) VALUES ('Python', 3);

INSERT INTO languages (language, member) VALUES ('C#', 4);
INSERT INTO languages (language, member) VALUES ('Java', 4);
INSERT INTO languages (language, member) VALUES ('Javascript', 4);

INSERT INTO languages (language, member) VALUES ('Bash', 5);
INSERT INTO languages (language, member) VALUES ('Java', 5);
INSERT INTO languages (language, member) VALUES ('Python', 5);

INSERT INTO languages (language, member) VALUES ('Python', 6);
INSERT INTO languages (language, member) VALUES ('Javascript', 6);
INSERT INTO languages (language, member) VALUES ('HTML', 6);

INSERT INTO languages (language, member) VALUES ('Python', 7);

INSERT INTO languages (language, member) VALUES ('C#', 8);
INSERT INTO languages (language, member) VALUES ('Unity', 8);

INSERT INTO languages (language, member) VALUES ('Java', 9);

INSERT INTO languages (language, member) VALUES ('Java', 10);

INSERT INTO languages (language, member) VALUES ('Python', 11);
INSERT INTO languages (language, member) VALUES ('C#', 11);

INSERT INTO languages (language, member) VALUES ('Python', 12);

INSERT INTO languages (language, member) VALUES ('Java', 13);

INSERT INTO languages (language, member) VALUES ('C++', 14);

INSERT INTO languages (language, member) VALUES ('Java', 15);

INSERT INTO languages (language, member) VALUES ('Python', 16);

INSERT INTO languages (language, member) VALUES ('Java', 17);

INSERT INTO languages (language, member) VALUES ('Swift', 18);

COPY (SELECT CURRENT_DATE,CURRENT_TIME AT TIME ZONE 'EST') TO '/Users/kevin_zhao/PycharmProjects/club-website/site/src/data_loader/finish_time.txt';