keycloak 18,19 (quarkus):

=========== bare quick start stop 2 nodes ============

2 app nodes in one net with mcast + pgsql db (on the anywhere) whith exist database named as "keycloak"

1) get KK from keycloak.org

2) unzip to anywhere on the nodes

3) edit config (conf/keycloak.conf) to set db (uncomment strings and edit), app hostnames, settings behind reverse-proxy:

```
#hostname=myhostname    # set node hostname (i had sat it on my install). hostname name will be viewed in debug mode logs when node starts ("node name xyz infispan bla-bla-bla")
```

```
#db-url=jdbc:postgresql://localhost/keycloak   # set "anywhere" pgsql db here
```

```
#db-password=password                          # set pgsql db pass
```
```
#proxy=reencrypt							   # i had sat "edge" in my install but i had sat nginx to r-proxy + tls.
```

4) add your stuffs to "providers" dir (jar stuffs), to "themes" dir (frontend stuffs) and build KK:

./bin/kc.sh build

after start KK:

./bin/kc/sh start

enjoy it on localhost:8080 (app), but after you need to set r-proxy and tls (just install nginx and set proxy-pass and tls)

!!!!!!!!!!!
SET FIREWALL BECAUSE KK WILL BE LISTEN 8080 ON THE ALL IP INTERFACES ON THE NODE(NOT ONLY ON LOCALHOST)
!!!!!!!!!!!

5) after first start all needed tables will be created in DB "keycloak" by app
you need to go to https://node_name:port (go to any app node) and create admin password in existing "master" realm - after i recommend to create new realm\realms with theirs admin\admins and use them for your apps - use "master" realm with his admin only to admin new realms - do not use master realm for your apps real users (isolate)

!!!!!!!!!!!!!
user credentails are: logins, passwords, TOTP hashes

Users from different realms are "isolated" with their credentails. In different realms one real user will be duplicated with another ID in database - and their credentails will be recreated - no shared use mechanism for credentails from different realms - treat every repetitive user as unique

Shared credentails can be considered a "samaccountname" with a password if users pull up from LDAP - but their second factor (TOTP hashes) will be unique!. 

In fact, there will be only one user, but there will be a separate record in the database in each Realm from where it is imported The configured hashes of the second factor can, in theory, be duplicated manually in the database (take the hash from the internal user and copy its value to the cell of another record of the same user)

!!!!!!!!!!!!!!!



P.S нахуй я познал это 
