$ORIGIN berger.ephec-ti.be.
$TTL	3600
berger.ephec-ti.be.	IN	SOA	ns.berger.ephec-ti.be. HE201639@students.ephec.be. (

		         2019031001	; Serial
			 3600		; Refresh
			  600		; Retry
			86400		; Expire
			 600 )	; Negative Cache TTL

@	IN	 NS	 ns
	IN	 A	 51.178.40.161
@       IN       MX      10  mail

berger.ephec-ti.be.      IN      NS      ns.berger.ephec-ti.be.
ns.berger.ephec-ti.be.   IN      A   51.178.40.161
www.berger.ephec-ti.be.  IN      A   51.178.40.161
b2b.berger.ephec-ti.be.  IN      A   51.178.40.161
intranet.berger.ephec-ti.be.  IN      A   51.178.40.161
sip				IN	A	51.178.40.161
_sip._udp		SRV	0	0	5060	sip
_sip._tcp		SRV 0	0	5060	sip

mail		IN	A	51.178.40.161
smtp		IN	CNAME	mail
pop3		IN	CNAME	mail
imap		IN	CNAME	mail

