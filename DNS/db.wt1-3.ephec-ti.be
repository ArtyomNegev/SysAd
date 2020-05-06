$ORIGIN wt1-3.ephec-ti.be.
$TTL	3600
wt1-3.ephec-ti.be.	IN	SOA	ns.wt1-3.ephec-ti.be. HE201639@students.ephec.be. (

		         2019031001	; Serial
			 3600		; Refresh
			  600		; Retry
			86400		; Expire
			 600 )	; Negative Cache TTL

@	 IN	 NS 	ns
	IN 	A	 51.178.40.161
wt1-3.ephec-ti.be.      IN      NS      ns.wt1-3.ephec-ti.be.
ns.wt1-3.ephec-ti.be.   IN      A   51.178.40.161
www.wt1-3.ephec-ti.be.  IN      A   51.178.40.161
b2b.wt1-3.ephec-ti.be.  IN      A   51.178.40.161
intranet.wt1-3.ephec-ti.be.  IN      A   51.178.40.161
sip				IN	A	51.178.40.161
_sip._udp		SRV	0	0	5060	sip
_sip._tcp		SRV 0	0	5060	sip
