# removing the mark that DB is updated from script
DELETE FROM conflines WHERE name = 'DB_Update_From_Script';

# DATA
INSERT IGNORE INTO currencies (name, full_name, active) SELECT 'MDL', 'Moldovan leu', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM currencies WHERE name = 'MDL');
UPDATE devices SET istrunk = 1 WHERE id IN (SELECT device_id FROM providers);
UPDATE conflines SET value = 'MOR X3' WHERE value IN ('MOR 10', 'MOR 9', 'MOR 0.8', 'MOR 11', 'MOR 12') AND name IN ('Version', 'Admin_browser_Title');
UPDATE translations SET name = 'Czech' WHERE short_name = 'cz';
INSERT IGNORE INTO translations (name, native_name, short_name, position, active, flag) SELECT 'Hebrew', 'Ivrit', 'he', '110', '1', 'isr' FROM dual WHERE NOT EXISTS (SELECT * FROM translations WHERE name = 'Hebrew');
UPDATE flatrate_data SET seconds = minutes * 60 + seconds, minutes = 0;
UPDATE conflines SET value = ' by <a href=\'http://www.kolmisoft.com\' target=\"_blank\">KolmiSoft </a> 2006-2012' WHERE value = ' by <a href=\'http://www.kolmisoft.com\' target=\"_blank\">KolmiSoft </a> 2006-2008' AND name = 'Copyright_Title';
INSERT IGNORE INTO directions (name, code) SELECT 'South Sudan','SSD' FROM dual WHERE NOT EXISTS (SELECT * FROM directions WHERE code='SSD');
INSERT IGNORE INTO destinationgroups (name, desttype, flag) SELECT 'South Sudan','FIX','ssd' FROM dual WHERE NOT EXISTS (SELECT * FROM destinationgroups WHERE flag='ssd');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '211','SSD','FIX','South Sudan',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='211' AND direction_code='SSD');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '211811','SSD','FIX','South Sudan-Juba',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='211811' AND direction_code='SSD');
update devicetypes set name = 'dahdi', ast_name = 'dahdi' where name = 'ZAP';
update devices set device_type = 'dahdi' where device_type = 'ZAP';
update providers set tech = 'dahdi' where tech = 'ZAP';
update conflines set name = 'Change_dahdi_to' where name = 'Change_Zap_to';
update conflines set name = 'Change_dahdi' where name = 'Change_Zap';
update conflines set name = 'Resellers_Allow_Use_dahdi_Device' where name = 'Resellers_Allow_Use_Zap_Device';
update providertypes set name = 'dahdi', ast_name = 'dahdi' where name = 'Zap';
update extlines set appdata = REPLACE(appdata, 'Zap', 'dahdi');
UPDATE users SET uniquehash = SUBSTRING(SHA1(RAND()) FROM 1 FOR 10) where uniquehash = 'mbqvm8gkrk';
INSERT IGNORE INTO destinationgroups (name, desttype, flag) SELECT 'South Sudan','MOB','ssd' FROM dual WHERE NOT EXISTS (SELECT * FROM destinationgroups WHERE flag='ssd' AND desttype='MOB');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '21197','SSD','MOB','South Sudan Mobile Gemtel',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd' AND desttype='MOB') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='21197' AND direction_code='SSD');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '21192','SSD','MOB','South Sudan Mobile Mtn',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd' AND desttype='MOB') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='21192' AND direction_code='SSD');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '21199','SSD','MOB','South Sudan Mobile Mtn',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd' AND desttype='MOB') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='21199' AND direction_code='SSD');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '21111','SSD','MOB','South Sudan Mobile Southtel',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd' AND desttype='MOB') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='21111' AND direction_code='SSD');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '21195','SSD','MOB','South Sudan Mobile Vivacell',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd' AND desttype='MOB') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='21195' AND direction_code='SSD');
INSERT IGNORE INTO destinations (prefix, direction_code, subcode, name, city, state, lata, tier, ocn, destinationgroup_id) SELECT '21191','SSD','MOB','South Sudan Mobile Zain',NULL,NULL,NULL,NULL,NULL,(SELECT id FROM destinationgroups WHERE flag='ssd' AND desttype='MOB') FROM dual WHERE NOT EXISTS (SELECT * FROM destinations WHERE prefix='21191' AND direction_code='SSD');
INSERT INTO hangupcausecodes (code, description) SELECT 227, '<b>227 - Calling Card PIN is not entered</b><br />User did not entered Calling Card PIN or (NUMBER + PIN)<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 227);
INSERT INTO hangupcausecodes (code, description) SELECT 228, '<b>228 - Calling Card Destination is not entered</b><br />User did not entered Calling Card Destination<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 228);
INSERT INTO hangupcausecodes (code, description) SELECT 229, '<b>229 - DID is reserved</b><br />DID is reserved to some User but not assigned to any Device.<br/ >Assign the DID to some Device or Dial Plan to route the call correctly<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 229);
INSERT INTO hangupcausecodes (code, description) SELECT 232, '<b>232 - Callback DID not available</b><br />Callback does not know to which DID connect the call.<br />Check Callback configuration in Dial Plans menu.<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 232);
INSERT INTO hangupcausecodes (code, description) SELECT 233, '<b>233 - Skype Addon Disabled</b><br />Skype Addon is not available<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 233);
INSERT INTO hangupcausecodes (code, description) SELECT 234, '<b>234 - Internal Loop</b><br />You have misconfiguration which creates internal loop<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 234);
INSERT INTO hangupcausecodes (code, description) SELECT 235, '<b>235 - Providers rate higher by percent</b><br />Provider is skipped, because LCR by price is used and percent is applied to first Provider<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 235);
INSERT INTO hangupcausecodes (code, description) SELECT 236, '<b>236 Callback initiation too early</b><br />Callback initiation denied because it is too early from the initiation call from same CallerID.<br /> E.g. First call is made from same CallerID and all other attempts to initiate callback are denied if they are too early. <br /> It is not allowed to initiate more callback attempts from same CallerID in the time period, which is necessary to wait after Callback Initiation Call and Call Leg A. This period is set in Callback Dial-Plan Edit window (Wait (s)).<br /> Such callback initiation control is implemented due to the case when providers send several INVITE packets for the same call.<br />Using this protection, only first INVITE will initiate the callback. All other attempts will be dropped with such HGC: 236<br />If you see such HGC near your call - also check for the good call, which should be made for first INVITE.<br />And you can ignore all these following call attempts or you can contact your DID Provider by asking to fix they call sending routines to avoid several INVITES.<br />By our experience DID Providers do not care to do that<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 236);
INSERT INTO hangupcausecodes (code, description) SELECT 237, '<b>237 - DID User is blocked</b><br />Call fails, because DID User is blocked and DID cannot be used for blocked Users<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 237);
INSERT INTO hangupcausecodes (code, description) SELECT 238, '<b>238 - Provider used its daily call time limit</b><br />Provider has daily call limit and call cannot pass over this provider because today too much call time was used over this Provider.<br />Tomorrow daily limit will be reset and calls over this Provider will be possible again (until limit will be reached again)<br />This limitation is only for OUTGOING calls<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 238);
INSERT INTO hangupcausecodes (code, description) SELECT 239, "<b>239 - Device used its daily call time limit</b><br />User has daily call limit and users call cannot pass because today too much call time was used by this User.<br />Tomorrow daily limit will be reset and calls by this User will be possible again.<br />This limitation is only for OUTGOING calls<br />" FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 239);
INSERT INTO hangupcausecodes (code, description) SELECT 240, '<b>240 - Provider belongs to the User which makes call</b><br />Provider belongs to the User which makes call.<br />In order to avoid the loop, this Provider will be skipped for such call<br />' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 240);
update hangupcausecodes set description = '<b>216 - Too low balance for reseller for more simultaneous calls</b><br>Increase balance for reseller to allow him and his users to make more calls at the same time.<br> For more information please use Call Tracing or consult online manual at wiki.kolmisoft.com<br>' where code = 216;
INSERT INTO currencies (name, full_name, active) SELECT 'LYD', 'Libyan Dinar', 0 FROM dual WHERE (SELECT COUNT(*) FROM currencies WHERE name = 'LYD') = 0;
update currencies set name='TRY' where full_name='Turkish Lira';
UPDATE devices SET insecure = NULL WHERE id = 2;
INSERT IGNORE INTO conflines(name, value, owner_id) SELECT 'Web_Callback_Send_Source_As_CID', '1', '0' FROM DUAL WHERE (SELECT COUNT(*) FROM conflines WHERE name = 'Web_Callback_Send_Source_As_CID' AND owner_id = 0) = 0;
INSERT INTO emails (name, template, date_created, subject, body) SELECT 'callerid_blocked', 1, NOW(),'Callerid blocked',"At <%= date %> User with ID = <%= user_id %>, with Device ID = <%= device_id %> and CallerID = <%= caller_id %> was blocked because it sent several simultaneous calls in same time." FROM DUAL WHERE (SELECT COUNT(*) FROM emails WHERE name = 'callerid_blocked') = 0;
ALTER TABLE devices MODIFY COLUMN nat ENUM('yes', 'no', 'never', 'route', 'force_rport', 'comedia') DEFAULT 'no';
INSERT INTO acc_rights (name, nice_name, permission_group, right_type) SELECT 'webphone_acc', 'Manege_Webphone', 'Webphone', 'accountant' FROM dual WHERE (SELECT COUNT(*) FROM acc_rights WHERE name= 'webphone_acc' and right_type='accountant') = 0;
INSERT INTO acc_rights (name, nice_name, permission_group, right_type) SELECT 'webphone_res', 'Webphone', 'Plugins', 'reseller' FROM dual WHERE (SELECT COUNT(*) FROM acc_rights WHERE name= 'webphone_res' and right_type='reseller') = 0;
INSERT INTO hangupcausecodes (code, description) SELECT 241, '<b>241 - Local Caller canceled the call before call was answered</b>' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = 241);
INSERT INTO conflines (name, value, owner_id) SELECT 'Default_SIP_device_port', 5060, 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Default_SIP_device_port' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Default_IAX2_device_port', 4569, 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Default_IAX2_device_port' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Default_H323_device_port', 1720, 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Default_H323_device_port' and owner_id = 0);
UPDATE servers SET server_type = 'asterisk' WHERE server_type NOT IN ('asterisk','sip_proxy');
INSERT IGNORE INTO conflines(name, value, owner_id) SELECT 'Resellers_server_id', (SELECT id FROM servers ORDER BY id ASC LIMIT 1), '0' FROM DUAL WHERE (SELECT COUNT(*) FROM conflines WHERE name = 'Resellers_server_id' AND owner_id = 0) = 0;
UPDATE devices LEFT JOIN users ON (devices.user_id = users.id) SET server_id = (SELECT value FROM conflines WHERE (name = 'Resellers_server_id' and owner_id = 0) LIMIT 1) WHERE (devices.device_type != 'SIP' OR devices.host != 'dynamic') AND (users.owner_id != 0 OR usertype = 'reseller') AND users.hidden = 0;
INSERT INTO server_devices (device_id,server_id) (SELECT devices.id,servers.id FROM devices LEFT JOIN servers ON (devices.server_id = servers.id) LEFT JOIN server_devices ON (server_devices.server_id = servers.id AND server_devices.device_id = devices.id) LEFT JOIN providers ON (devices.id = providers.device_id) WHERE devices.user_id != -1 AND devices.name NOT LIKE 'mor_server_%' AND server_devices.id IS NULL AND providers.device_id IS NULL) ;
UPDATE users SET time_zone = 'International Date Line West' WHERE time_zone = -11;
UPDATE users SET time_zone = 'Hawaii' WHERE time_zone = -10;
UPDATE users SET time_zone = 'Alaska' WHERE time_zone = -9;
UPDATE users SET time_zone = 'Pacific Time (US & Canada)' WHERE time_zone = -8;
UPDATE users SET time_zone = 'Arizona' WHERE time_zone = -7;
UPDATE users SET time_zone = 'Central America' WHERE time_zone = -6;
UPDATE users SET time_zone = 'Bogota' WHERE time_zone = -5;
UPDATE users SET time_zone = 'Caracas' WHERE time_zone = -4.5;
UPDATE users SET time_zone = 'Atlantic Time (Canada)' WHERE time_zone = -4;
UPDATE users SET time_zone = 'Newfoundland' WHERE time_zone = -3.5 ;
UPDATE users SET time_zone = 'Brasilia' WHERE time_zone = -3;
UPDATE users SET time_zone = 'Mid-Atlantic' WHERE time_zone = -2;
UPDATE users SET time_zone = 'Azores' WHERE time_zone = -1;
UPDATE users SET time_zone = 'London' WHERE time_zone = '0';
UPDATE users SET time_zone = 'Amsterdam' WHERE time_zone = 1;
UPDATE users SET time_zone = 'Athens' WHERE time_zone = 2;
UPDATE users SET time_zone = 'Baghdad' WHERE time_zone = 3;
UPDATE users SET time_zone = 'Abu Dhabi' WHERE time_zone = 4;
UPDATE users SET time_zone = 'Islamabad' WHERE time_zone = 5;
UPDATE users SET time_zone = 'Chennai' WHERE time_zone = 5.5;
UPDATE users SET time_zone = 'Kathmandu' WHERE time_zone = 5.75;
UPDATE users SET time_zone = 'Almaty' WHERE time_zone = 6;
UPDATE users SET time_zone = 'Rangoon' WHERE time_zone = 6.5;
UPDATE users SET time_zone = 'Bangkok' WHERE time_zone = 7;
UPDATE users SET time_zone = 'Beijing' WHERE time_zone = 8;
UPDATE users SET time_zone = 'Irkutsk' WHERE time_zone = 9;
UPDATE users SET time_zone = 'Adelaide' WHERE time_zone = 9.5 ;
UPDATE users SET time_zone = 'Brisbane' WHERE time_zone = 10;
UPDATE users SET time_zone = 'New Caledonia' WHERE time_zone = 11;
UPDATE users SET time_zone = 'Auckland' WHERE time_zone = 12;
UPDATE users SET time_zone = "Nuku'alofa" WHERE time_zone = 13;
INSERT INTO currencies (name, full_name, active) SELECT "PYG", "Paraguayan-Guarani", 0 FROM dual WHERE NOT EXISTS (SELECT * FROM currencies WHERE name = "PYG");
INSERT INTO conflines (name, value, owner_id) SELECT 'Default_device_trunk', 'no', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Default_device_trunk' and owner_id = 0);
delete from conflines where name = "MOR_11_extend";
UPDATE devices SET proxy_port = IF((SELECT value FROM conflines WHERE name='Proxy_port_first_load') = 1 , proxy_port, port);
INSERT IGNORE INTO conflines(name, value, owner_id) SELECT 'Proxy_port_first_load', '1', '0' FROM DUAL WHERE (SELECT COUNT(*) FROM conflines WHERE name = 'Proxy_port_first_load' AND owner_id = 0) = 0;
INSERT IGNORE INTO acc_rights (name, nice_name, permission_group, right_type) VALUES ("autodialer","Autodialer","Plugins","reseller");
INSERT IGNORE INTO acc_rights (name, nice_name, permission_group, right_type) VALUES ("recordings_manage","Manage_Recordings","Device","accountant");
UPDATE conflines SET value = ' by <a href="http://www.kolmisoft.com" target="_blank">Kolmisoft </a> 2006 - <span id="current_year"></span><script type="text/javascript"> document.getElementById("current_year").innerHTML = new Date().getFullYear(); </script>' WHERE value = ' by <a href=\'http://www.kolmisoft.com\' target=\"_blank\">KolmiSoft </a> 2006-2012' and name = 'Copyright_Title';
INSERT IGNORE INTO conflines (name, value) SELECT 'Callback_legA_CID','device' FROM dual WHERE NOT EXISTS (SELECT * FROM conflines WHERE name='Callback_legA_CID');
INSERT IGNORE INTO conflines (name, value) SELECT 'Callback_legB_CID','device' FROM dual WHERE NOT EXISTS (SELECT * FROM conflines WHERE name='Callback_legB_CID');
# broken
update emails set body = "Monitoring details:\n\nType: <%=monitoring_type%>\nBalance: <%=monitoring_amount%>\nBlock: <%=monitoring_block%>\n\nAffected users:\n\n<%=monitoring_users%>\n<%= call_list %>" where body = "Monitoring details:nnType: <%=monitoring_type%>nBalance: <%=monitoring_amount%>nBlock: <%=monitoring_block%>nnAffected users:nn<%=monitoring_users%>n<%= call_list %>" and name = "monitoring_activation";
UPDATE directions set iso31661code="004" WHERE id = 1;
UPDATE directions set iso31661code="008" WHERE id = 2;
UPDATE directions set iso31661code="012" WHERE id = 3;
UPDATE directions set iso31661code="016" WHERE id = 4;
UPDATE directions set iso31661code="020" WHERE id = 5;
UPDATE directions set iso31661code="024" WHERE id = 6;
UPDATE directions set iso31661code="660" WHERE id = 7;
UPDATE directions set iso31661code="010" WHERE id = 8;
UPDATE directions set iso31661code="028" WHERE id = 9;
UPDATE directions set iso31661code="032" WHERE id = 10;
UPDATE directions set iso31661code="051" WHERE id = 11;
UPDATE directions set iso31661code="533" WHERE id = 12;
UPDATE directions set iso31661code="036" WHERE id = 13;
UPDATE directions set iso31661code="040" WHERE id = 14;
UPDATE directions set iso31661code="031" WHERE id = 15;
UPDATE directions set iso31661code="044" WHERE id = 16;
UPDATE directions set iso31661code="048" WHERE id = 17;
UPDATE directions set iso31661code="050" WHERE id = 18;
UPDATE directions set iso31661code="052" WHERE id = 19;
UPDATE directions set iso31661code="112" WHERE id = 20;
UPDATE directions set iso31661code="056" WHERE id = 21;
UPDATE directions set iso31661code="084" WHERE id = 22;
UPDATE directions set iso31661code="204" WHERE id = 23;
UPDATE directions set iso31661code="060" WHERE id = 24;
UPDATE directions set iso31661code="064" WHERE id = 25;
UPDATE directions set iso31661code="068" WHERE id = 26;
UPDATE directions set iso31661code="070" WHERE id = 27;
UPDATE directions set iso31661code="072" WHERE id = 28;
UPDATE directions set iso31661code="076" WHERE id = 30;
UPDATE directions set iso31661code="096" WHERE id = 32;
UPDATE directions set iso31661code="100" WHERE id = 33;
UPDATE directions set iso31661code="854" WHERE id = 34;
UPDATE directions set iso31661code="108" WHERE id = 35;
UPDATE directions set iso31661code="116" WHERE id = 36;
UPDATE directions set iso31661code="120" WHERE id = 37;
UPDATE directions set iso31661code="124" WHERE id = 38;
UPDATE directions set iso31661code="132" WHERE id = 39;
UPDATE directions set iso31661code="136" WHERE id = 40;
UPDATE directions set iso31661code="140" WHERE id = 41;
UPDATE directions set iso31661code="148" WHERE id = 42;
UPDATE directions set iso31661code="152" WHERE id = 43;
UPDATE directions set iso31661code="156" WHERE id = 44;
UPDATE directions set iso31661code="162" WHERE id = 45;
UPDATE directions set iso31661code="166" WHERE id = 46;
UPDATE directions set iso31661code="170" WHERE id = 47;
UPDATE directions set iso31661code="174" WHERE id = 48;
UPDATE directions set iso31661code="178" WHERE id = 49;
UPDATE directions set iso31661code="180" WHERE id = 50;
UPDATE directions set iso31661code="184" WHERE id = 51;
UPDATE directions set iso31661code="188" WHERE id = 52;
UPDATE directions set iso31661code="384" WHERE id = 53;
UPDATE directions set iso31661code="191" WHERE id = 54;
UPDATE directions set iso31661code="192" WHERE id = 55;
UPDATE directions set iso31661code="196" WHERE id = 56;
UPDATE directions set iso31661code="203" WHERE id = 57;
UPDATE directions set iso31661code="208" WHERE id = 58;
UPDATE directions set iso31661code="262" WHERE id = 59;
UPDATE directions set iso31661code="212" WHERE id = 60;
UPDATE directions set iso31661code="214" WHERE id = 61;
UPDATE directions set iso31661code="218" WHERE id = 62;
UPDATE directions set iso31661code="818" WHERE id = 63;
UPDATE directions set iso31661code="222" WHERE id = 64;
UPDATE directions set iso31661code="226" WHERE id = 65;
UPDATE directions set iso31661code="232" WHERE id = 66;
UPDATE directions set iso31661code="233" WHERE id = 67;
UPDATE directions set iso31661code="231" WHERE id = 68;
UPDATE directions set iso31661code="238" WHERE id = 69;
UPDATE directions set iso31661code="234" WHERE id = 70;
UPDATE directions set iso31661code="242" WHERE id = 71;
UPDATE directions set iso31661code="246" WHERE id = 72;
UPDATE directions set iso31661code="250" WHERE id = 73;
UPDATE directions set iso31661code="254" WHERE id = 74;
UPDATE directions set iso31661code="258" WHERE id = 75;
UPDATE directions set iso31661code="266" WHERE id = 77;
UPDATE directions set iso31661code="270" WHERE id = 78;
UPDATE directions set iso31661code="268" WHERE id = 79;
UPDATE directions set iso31661code="276" WHERE id = 80;
UPDATE directions set iso31661code="288" WHERE id = 81;
UPDATE directions set iso31661code="292" WHERE id = 82;
UPDATE directions set iso31661code="300" WHERE id = 83;
UPDATE directions set iso31661code="304" WHERE id = 84;
UPDATE directions set iso31661code="308" WHERE id = 85;
UPDATE directions set iso31661code="312" WHERE id = 86;
UPDATE directions set iso31661code="316" WHERE id = 87;
UPDATE directions set iso31661code="320" WHERE id = 88;
UPDATE directions set iso31661code="324" WHERE id = 89;
UPDATE directions set iso31661code="624" WHERE id = 90;
UPDATE directions set iso31661code="328" WHERE id = 91;
UPDATE directions set iso31661code="332" WHERE id = 92;
UPDATE directions set iso31661code="336" WHERE id = 94;
UPDATE directions set iso31661code="340" WHERE id = 95;
UPDATE directions set iso31661code="344" WHERE id = 96;
UPDATE directions set iso31661code="348" WHERE id = 97;
UPDATE directions set iso31661code="352" WHERE id = 98;
UPDATE directions set iso31661code="356" WHERE id = 99;
UPDATE directions set iso31661code="360" WHERE id = 100;
UPDATE directions set iso31661code="364" WHERE id = 101;
UPDATE directions set iso31661code="368" WHERE id = 102;
UPDATE directions set iso31661code="372" WHERE id = 103;
UPDATE directions set iso31661code="376" WHERE id = 104;
UPDATE directions set iso31661code="380" WHERE id = 105;
UPDATE directions set iso31661code="388" WHERE id = 106;
UPDATE directions set iso31661code="392" WHERE id = 107;
UPDATE directions set iso31661code="400" WHERE id = 108;
UPDATE directions set iso31661code="398" WHERE id = 109;
UPDATE directions set iso31661code="404" WHERE id = 110;
UPDATE directions set iso31661code="296" WHERE id = 111;
UPDATE directions set iso31661code="408" WHERE id = 112;
UPDATE directions set iso31661code="410" WHERE id = 113;
UPDATE directions set iso31661code="414" WHERE id = 114;
UPDATE directions set iso31661code="417" WHERE id = 115;
UPDATE directions set iso31661code="418" WHERE id = 116;
UPDATE directions set iso31661code="428" WHERE id = 117;
UPDATE directions set iso31661code="422" WHERE id = 118;
UPDATE directions set iso31661code="426" WHERE id = 119;
UPDATE directions set iso31661code="430" WHERE id = 120;
UPDATE directions set iso31661code="434" WHERE id = 121;
UPDATE directions set iso31661code="438" WHERE id = 122;
UPDATE directions set iso31661code="440" WHERE id = 123;
UPDATE directions set iso31661code="442" WHERE id = 124;
UPDATE directions set iso31661code="446" WHERE id = 125;
UPDATE directions set iso31661code="807" WHERE id = 126;
UPDATE directions set iso31661code="450" WHERE id = 127;
UPDATE directions set iso31661code="454" WHERE id = 128;
UPDATE directions set iso31661code="458" WHERE id = 129;
UPDATE directions set iso31661code="462" WHERE id = 130;
UPDATE directions set iso31661code="466" WHERE id = 131;
UPDATE directions set iso31661code="470" WHERE id = 132;
UPDATE directions set iso31661code="584" WHERE id = 133;
UPDATE directions set iso31661code="474" WHERE id = 134;
UPDATE directions set iso31661code="478" WHERE id = 135;
UPDATE directions set iso31661code="480" WHERE id = 136;
UPDATE directions set iso31661code="175" WHERE id = 137;
UPDATE directions set iso31661code="484" WHERE id = 138;
UPDATE directions set iso31661code="583" WHERE id = 139;
UPDATE directions set iso31661code="498" WHERE id = 140;
UPDATE directions set iso31661code="492" WHERE id = 141;
UPDATE directions set iso31661code="496" WHERE id = 142;
UPDATE directions set iso31661code="500" WHERE id = 143;
UPDATE directions set iso31661code="504" WHERE id = 144;
UPDATE directions set iso31661code="508" WHERE id = 145;
UPDATE directions set iso31661code="104" WHERE id = 146;
UPDATE directions set iso31661code="516" WHERE id = 147;
UPDATE directions set iso31661code="520" WHERE id = 148;
UPDATE directions set iso31661code="524" WHERE id = 149;
UPDATE directions set iso31661code="528" WHERE id = 150;
UPDATE directions set iso31661code="530" WHERE id = 151;
UPDATE directions set iso31661code="540" WHERE id = 152;
UPDATE directions set iso31661code="554" WHERE id = 153;
UPDATE directions set iso31661code="558" WHERE id = 154;
UPDATE directions set iso31661code="562" WHERE id = 155;
UPDATE directions set iso31661code="566" WHERE id = 156;
UPDATE directions set iso31661code="570" WHERE id = 157;
UPDATE directions set iso31661code="574" WHERE id = 158;
UPDATE directions set iso31661code="580" WHERE id = 159;
UPDATE directions set iso31661code="578" WHERE id = 160;
UPDATE directions set iso31661code="512" WHERE id = 161;
UPDATE directions set iso31661code="586" WHERE id = 162;
UPDATE directions set iso31661code="585" WHERE id = 163;
UPDATE directions set iso31661code="275" WHERE id = 164;
UPDATE directions set iso31661code="591" WHERE id = 165;
UPDATE directions set iso31661code="598" WHERE id = 166;
UPDATE directions set iso31661code="600" WHERE id = 167;
UPDATE directions set iso31661code="604" WHERE id = 168;
UPDATE directions set iso31661code="608" WHERE id = 169;
UPDATE directions set iso31661code="616" WHERE id = 171;
UPDATE directions set iso31661code="620" WHERE id = 172;
UPDATE directions set iso31661code="630" WHERE id = 173;
UPDATE directions set iso31661code="634" WHERE id = 174;
UPDATE directions set iso31661code="638" WHERE id = 175;
UPDATE directions set iso31661code="642" WHERE id = 176;
UPDATE directions set iso31661code="643" WHERE id = 177;
UPDATE directions set iso31661code="646" WHERE id = 178;
UPDATE directions set iso31661code="654" WHERE id = 179;
UPDATE directions set iso31661code="659" WHERE id = 180;
UPDATE directions set iso31661code="662" WHERE id = 181;
UPDATE directions set iso31661code="666" WHERE id = 182;
UPDATE directions set iso31661code="670" WHERE id = 183;
UPDATE directions set iso31661code="882" WHERE id = 184;
UPDATE directions set iso31661code="674" WHERE id = 185;
UPDATE directions set iso31661code="678" WHERE id = 186;
UPDATE directions set iso31661code="682" WHERE id = 187;
UPDATE directions set iso31661code="686" WHERE id = 188;
UPDATE directions set iso31661code="690" WHERE id = 189;
UPDATE directions set iso31661code="694" WHERE id = 190;
UPDATE directions set iso31661code="702" WHERE id = 191;
UPDATE directions set iso31661code="703" WHERE id = 192;
UPDATE directions set iso31661code="705" WHERE id = 193;
UPDATE directions set iso31661code="090" WHERE id = 194;
UPDATE directions set iso31661code="706" WHERE id = 195;
UPDATE directions set iso31661code="710" WHERE id = 196;
UPDATE directions set iso31661code="724" WHERE id = 198;
UPDATE directions set iso31661code="144" WHERE id = 199;
UPDATE directions set iso31661code="729" WHERE id = 200;
UPDATE directions set iso31661code="740" WHERE id = 201;
UPDATE directions set iso31661code="748" WHERE id = 203;
UPDATE directions set iso31661code="752" WHERE id = 204;
UPDATE directions set iso31661code="756" WHERE id = 205;
UPDATE directions set iso31661code="760" WHERE id = 206;
UPDATE directions set iso31661code="158" WHERE id = 207;
UPDATE directions set iso31661code="762" WHERE id = 208;
UPDATE directions set iso31661code="834" WHERE id = 209;
UPDATE directions set iso31661code="764" WHERE id = 210;
UPDATE directions set iso31661code="768" WHERE id = 212;
UPDATE directions set iso31661code="772" WHERE id = 213;
UPDATE directions set iso31661code="776" WHERE id = 214;
UPDATE directions set iso31661code="780" WHERE id = 215;
UPDATE directions set iso31661code="788" WHERE id = 216;
UPDATE directions set iso31661code="792" WHERE id = 217;
UPDATE directions set iso31661code="795" WHERE id = 218;
UPDATE directions set iso31661code="796" WHERE id = 219;
UPDATE directions set iso31661code="798" WHERE id = 220;
UPDATE directions set iso31661code="800" WHERE id = 221;
UPDATE directions set iso31661code="804" WHERE id = 222;
UPDATE directions set iso31661code="784" WHERE id = 223;
UPDATE directions set iso31661code="826" WHERE id = 224;
UPDATE directions set iso31661code="840" WHERE id = 225;
UPDATE directions set iso31661code="858" WHERE id = 227;
UPDATE directions set iso31661code="860" WHERE id = 228;
UPDATE directions set iso31661code="548" WHERE id = 229;
UPDATE directions set iso31661code="862" WHERE id = 230;
UPDATE directions set iso31661code="704" WHERE id = 231;
UPDATE directions set iso31661code="092" WHERE id = 232;
UPDATE directions set iso31661code="850" WHERE id = 233;
UPDATE directions set iso31661code="876" WHERE id = 234;
UPDATE directions set iso31661code="887" WHERE id = 236;
UPDATE directions set iso31661code="894" WHERE id = 238;
UPDATE directions set iso31661code="716" WHERE id = 239;
UPDATE directions set iso31661code="654" WHERE id = 240;
UPDATE directions set iso31661code="000" WHERE id = 241;
UPDATE directions set iso31661code="000" WHERE id = 242;
UPDATE directions set iso31661code="626" WHERE id = 243;
UPDATE directions set iso31661code="000" WHERE id = 246;
UPDATE directions set iso31661code="891" WHERE id = 247;
UPDATE directions set iso31661code="000" WHERE id = 250;
UPDATE directions set iso31661code="000" WHERE id = 251;
UPDATE directions set iso31661code="000" WHERE id = 252;
UPDATE directions set iso31661code="499" WHERE id = 253;
UPDATE directions set iso31661code="000" WHERE id = 254;
UPDATE directions set iso31661code="728" WHERE id = 255;
INSERT INTO currencies (name, full_name, active, exchange_rate, curr_update, curr_edit) SELECT 'AMD', 'Armenian Dram', 0,1,0,1 FROM dual WHERE (SELECT COUNT(*) FROM currencies WHERE name = 'AMD') = 0;
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '242','<b>242 - No Rates for Reseller</b><br/>This cause indicates, that reseller does not have rates for the call destination.<br/><br/>What you can do:<br/><ol><li>Check which tariff plan Reseller is using.</li><li>Apply the correct rates for your destination.</li><li>Use Call Tracing to find the exact problem.</li></ol>' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '242');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '243','<b>243 - Provider skipped because of CPS limitation</b>' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '243');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '244','<b>244 - Device call aborted because of CPS limitation</b>' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '244');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '245','<b>245 - Provider skipped because of balance limitation</b>' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '245');
INSERT IGNORE INTO hangupcausecodes (code, description) SELECT '246','<b>246 - Duplicate call hangup</b><br/>This cause prevents you from duplicate calls. It means that two or more calls are sent from the same User account with the same Caller ID and Destination Number.' FROM dual WHERE NOT EXISTS (SELECT * FROM hangupcausecodes WHERE code = '246');
INSERT IGNORE INTO directions (name, code) SELECT 'Thuraya','THU' FROM dual WHERE NOT EXISTS (SELECT * FROM directions WHERE code='THU');
INSERT INTO conflines (name, value, owner_id) SELECT 'load_ok', 1, 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'load_ok' and owner_id = 0);
UPDATE conflines SET value = 1 where name = 'Prepaid_Invoice_Address_Format' AND value is NULL;
UPDATE devices SET timerb=6400 WHERE timerb IS NULL;
UPDATE `conflines` SET value = 'Outstanding balance(Debt)' WHERE value = 'Your balance';
INSERT INTO conflines (name, value, owner_id) SELECT 'Show_Usernames_On_Pdf_Csv_Export_Files_In_Last_Calls', 0, 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Show_Usernames_On_Pdf_Csv_Export_Files_In_Last_Calls' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Invoice_Bank_Details_Line6', '', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Invoice_Bank_Details_line6' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Invoice_Bank_Details_Line7', '', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Invoice_Bank_Details_line7' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Invoice_Bank_Details_Line8', '', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Invoice_Bank_Details_line8' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Prepaid_Invoice_Bank_Details_Line6', '', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Prepaid_Invoice_Bank_Details_Line6' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Prepaid_Invoice_Bank_Details_Line7', '', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Prepaid_Invoice_Bank_Details_Line7' and owner_id = 0);
INSERT INTO conflines (name, value, owner_id) SELECT 'Prepaid_Invoice_Bank_Details_Line8', '', 0 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Prepaid_Invoice_Bank_Details_Line8' and owner_id = 0);
UPDATE currencies SET name = 'ZMW' WHERE name = 'ZMK';
UPDATE conflines SET value = 'International Date Line West' WHERE value = -11 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Hawaii' WHERE value = -10 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Alaska' WHERE value = -9 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Pacific Time (US & Canada)' WHERE value = -8 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Arizona' WHERE value = -7 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Central America' WHERE value = -6 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Bogota' WHERE value = -5 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Caracas' WHERE value = -4.5 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Atlantic Time (Canada)' WHERE value = -4 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Newfoundland' WHERE value = -3.5 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Brasilia' WHERE value = -3 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Mid-Atlantic' WHERE value = -2 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Azores' WHERE value = -1 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'London' WHERE value = '0' AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Amsterdam' WHERE value = 1 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Athens' WHERE value = 2 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Baghdad' WHERE value = 3 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Abu Dhabi' WHERE value = 4 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Islamabad' WHERE value = 5 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Chennai' WHERE value = 5.5 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Kathmandu' WHERE value = 5.75 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Almaty' WHERE value = 6 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Rangoon' WHERE value = 6.5 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Bangkok' WHERE value = 7 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Beijing' WHERE value = 8 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Irkutsk' WHERE value = 9 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Adelaide' WHERE value = 9.5 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Brisbane' WHERE value = 10 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'New Caledonia' WHERE value = 11 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = 'Auckland' WHERE value = 12 AND name = 'Default_User_time_zone';
UPDATE conflines SET value = "Nuku'alofa" WHERE value = 13 AND name = 'Default_User_time_zone';
INSERT IGNORE INTO acc_rights (name, nice_name, permission_group, right_type) VALUES ('provider', 'Provider', 'Active_Calls', 'accountant');
INSERT IGNORE INTO acc_rights (name, nice_name, permission_group, right_type) VALUES ('call_tracing_usage', 'call_tracing_usage', 'Functions', 'accountant');
UPDATE conflines SET value = 123 WHERE name = 'mor_mapped_db_version';
INSERT IGNORE INTO conflines (name, value) SELECT 'mor_mapped_db_version', '123' FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'mor_mapped_db_version');
update conflines set value = 0 where name = 'google_checkout_google_checkout_enabled';
INSERT IGNORE INTO conflines (name,value) SELECT 'Max_PDF_pages', 100 FROM DUAL WHERE (SELECT COUNT(*) FROM conflines WHERE name = 'Max_PDF_pages') = 0;
INSERT IGNORE INTO conflines (name, value) SELECT 'Hide_active_calls_longer_than', 4 FROM dual WHERE NOT EXISTS (SELECT * FROM conflines where name = 'Hide_active_calls_longer_than' and owner_id = 0);
DELETE FROM devicecodecs WHERE device_id IN (SELECT id FROM devices WHERE device_type = 'FAX');
INSERT INTO devicecodecs (device_id, codec_id, priority) (SELECT id, 1, 0 FROM devices WHERE device_type = "FAX");
INSERT INTO devicecodecs (device_id, codec_id, priority) (SELECT id, 2, 0 FROM devices WHERE device_type = "FAX");
# ^^^^^^ WRITE ABOVE THIS LINE ^^^^^
# marking that DB is updated from script
INSERT INTO conflines (name, value) VALUES ('DB_Update_From_Script', 1);