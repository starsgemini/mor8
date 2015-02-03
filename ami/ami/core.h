/*/
 *  Copyright � Justin Camp 2006
 *
 *  This file is part of Asterisk Manager Interface (AMI).
 *
 *  Asterisk Manager Interface is free software; you can 
 *  redistribute it and/or modify it under the terms of the 
 *  GNU General Public License as published by the 
 *  Free Software Foundation; either version 2 of the License, or 
 * (at your option) any later version.
 *
 *  Asterisk Manager Interface is distributed in the hope that 
 *  it will be useful, but WITHOUT ANY WARRANTY; without even the 
 *  implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *  See the GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with Asterisk Manager Interface; if not, write to the Free Software
 *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 *
 *  Send bugs, patches, comments, flames, the next winning lottery ticket of any
 *  state, province, country or otherwise inhabitable area (with a lottery system)
 *  or any other ideas or information worth communicating to j@intuitivecreations.com
/*/

/*/
 *    core.h
 *
/*/

#ifndef _AMI_CORE_H
#define _AMI_CORE_H

/*/
 *   Asterisk Packets
 *
 *   Every packet coming from asterisk is an event packet with the one exception of a
 *     response packet. Events can either be generated by things happening on the server, or 
 *     generated by a request by you. In the latter case, the event packets will be prepended by
 *     a response packet.
 *
 *   An event packet is a series of Name: Value tags separated by a carriage return and a new line ('\r\n').
 *     The end of a packet is specified by having a '\r\n' on a line all by itself.
 *
 *   This translates into code in the following way:
 *     a single packet has a number of packet name: value pairs we call 'packet items' and a reference to how
 *     many items there are in the packet. It's the programmers job to traverse the packet and use it appropriately.
 *
 *   Due to the fact that queries to the asterisk server often result in multiple packets (technically every request
 *     results in multiple packets due to the response packet), we created a packet group structure to group them 
 *     together. This is not so much the case for dealing with events, where most if not all events are singular 
 *     packets that can be dealth with individually.
 *
 *   Note: The ast_packet structure has a multi-level pointer that acts as an array of pointers. You not only
 *     need to malloc the packet itself, and separately malloc space for an ast_packet pointer, but you also need to free
 *     both the packet itself, and the allocated pointers for the packet.
/*/

#define MAX_AST_PACKET_ITEM_NAME_SIZE 128
#define MAX_AST_PACKET_ITEM_VALUE_SIZE 256

#define AMI_NET_TIMEOUT 500 /* 1/2 a second in mili(thousand)seconds */

typedef struct _ast_packet_item{
  char name[MAX_AST_PACKET_ITEM_NAME_SIZE];
  char value[MAX_AST_PACKET_ITEM_VALUE_SIZE];
  struct _ast_packet_item *next;
} ast_packet_item;

typedef struct _ast_packet{
    ast_packet_item *first_item;
    struct _ast_packet *next;
} ast_packet;

/*/
 * This is the declaration of a callback function which will be called
 * by ami_receive whenever an event is encountered which doesn't belong
 * to an action
/*/
typedef void (*ami_event_cb_func) (ast_packet *packet, void* cb_data);

/*/
 * Quick utility funcions to trim down extra spaces, etc from strings
/*/
void ami_ltrim(char *);
void ami_rtrim(char *);
void ami_trim(char *);
void ami_chomp(char *);

/*/
 * bool = ami_sock_readable(sock, millisecond-timeout)
 * Checks whether one socket is readable with a timeout specified in milliseconds
/*/
int ami_sock_readable(int sock, int milliseconds);

/*/
 * bool = ami_sock_writable(sock, millisecond-timeout)
 * Checks whether one socket is writable with a timeout specified in milliseconds
/*/
int ami_sock_writable(int sock, int milliseconds);

/*/
 *  bool = ami_send(sock,str_command)
 *  simply sends the command as-is to the provided socket
/*/
int ami_sock_send(int sock, const char *cmd);

/*/
 * str_ptr = ami_receive(sock)
 *   Attempts to receive a packet from the provided socket
 *   This function blocks until a packet is received which is part of an action
 *   If any error should occur, NULL will be returned
 *   No attempts to wait for the socket are made, so if the socket is set to non-blocking
 *     and the socket is not ready for reading, it will return immediately, returning NULL
 *     and errno will be set
 *   NOTE -> this function uses malloc to allocate space for the packet string
 *           it is the responsabilty of the programmer to free it
/*/
char *ami_sock_receive(int sock);

/*/
 * ami_receive_event(sock)
 *   Attempts to receive a single event packet from the provided socket
 *   The callback function set by ami_set_event_cb() will be called to process the received event
 *   No attempts to wait for the socket are made, so if the socket is set to non-blocking
 *     and the socket is not ready for reading, it will return immediately and errno will be set
/*/
void ami_sock_receive_event(int sock);

/*/
 * ami_set_event_cb(ami_event_cb_func func, void* cb_data)
 *   Set a callback function which will be called whenever an
 *   event is received which isn't part of an action
 *   The cb_data pointer can be used for application specific data
 *   which need to be used whenever the callback function is called
/*/
void ami_set_event_cb(ami_event_cb_func func, void* cb_data);

/*/
 * ast_packet = ami_parse_packet(packet_str)
 *   Attempt to parse a string packet as returned by the asterisk server into an ast_packet structure
 *   Don't forget to call ami_destroy_packet when you're done with the packet.
/*/
ast_packet *ami_parse_packet(const char *packet_str);

/*/
 * ast_packet = ami_create_packet(void)
 *   Create an empty and initialized packet
/*/
ast_packet *ami_create_packet(void);

/*/
 * ast_packet_item = ami_create_packet_item(name, val)
 *   Create a key: Value pair as a packet item of an ast_packet struct
/*/
ast_packet_item *ami_create_packet_item(const char *name, const char *val);

/*/
 * ast_packet_item = ami_add_packet_item(ast_packet_myPacketItem, ast_packet_myPacketItem)
 *   Add a packet item to the end of an existing ast_packet_item list. If myPacketItem is NULL, it will simply
 *   return the second argument.
 *   --> it is YOUR responsability to remember to call ami_destroy_packet when you're done
/*/
ast_packet_item *ami_add_packet_item(ast_packet_item *p, ast_packet_item *pi);

/*/
 * ast_packet = ami_add_packet_item_to_packet(ast_packet, ast_packet_myPacketItem)
 *   Add a packet item to the end of an existing ast_packet. 
 *   --> it is YOUR responsability to remember to call ami_destroy_packet when you're done
/*/
ast_packet *ami_add_packet_item_to_packet(ast_packet *p, ast_packet_item *pi);

/*/
 * ast_packet = ami_add_new_packet_item(ast_packet_myPacketItem, str_key, str_val)
 *   adds a new packet item to the end of the list of the given packet. If the packet is NULL, one will be
 *   created for you.
/*/
ast_packet *ami_add_new_packet_item(ast_packet *p, const char *key, const char *val);

/*/
 * ast_packet_group = ami_add_packet(ast_packet_group_myPacket, ast_packet_myPacket)
 *   Add an ast_packet to a list of ast_packets for grouping related packets together in one
 *   cohesive package. If myFirstPacket is NULL, no grouping will be done, and the second argument is returned
/*/
ast_packet *ami_add_packet(ast_packet *pg, ast_packet *p);

/*/
 * ami_destroy_packet(ast_packet)
 *   Frees memory allocated for a packet structure
/*/
void ami_destroy_packet(ast_packet *p);

/*/
 * ami_destroy_packet_group(ast_packet)
 *   Frees memory allocated for all packet structures AFTER and INCLUDING the packet given. If it is not the
 *   first packet in a list, everything in the list before the packet given will remain in memory, untouched.
/*/
void ami_destroy_packet_group(ast_packet *first_packet);

/*/
 * ami_destroy_packet_item(ast_packet, ast_packet_item)
 * Removes a packet item from a packet
/*/
void ami_destroy_packet_item(ast_packet *p, ast_packet_item *pi);

/*/
 * ami_destroy_packet_item_byname(ast_packet, char)
 * Removes a packet item from a packet as referenced by the packet's name
/*/
void ami_destroy_packet_item_byname(ast_packet *p, const char *name);

/*/
 * ami_unlink_packet_item(ast_packet, ast_packet_item)
 * Unlinks the specified packet item from the packet
 * Does *not* free the packet item or the packet
/*/
void ami_unlink_packet_item(ast_packet *p, ast_packet_item *pi);

/*/
 * ami_merge_packet(ast_packet, ast_packet)
 * Adds all packet items from the second packet to the first packet and frees the second packet
/*/
void ami_merge_packets(ast_packet *p1, ast_packet *p2);

/*/
 * ast_packet = ami_duplicate_packet(ast_packet)
 * Duplicates (copies) the supplied packet into a brand spankin' new one, just for you!
/*/
ast_packet *ami_duplicate_packet(ast_packet *p);

/*/
 * char *str = ami_get_packet_item_value(ast_packet, str_key)
 *  Find the key str_key and return a pointer to the value
/*/
char *ami_get_packet_item_value(ast_packet *p, const char *key);

/*/
 * char *str = ami_get_packet_item(ast_packet, str_key)
 *  Find the key str_key and return a pointer to the packet item
/*/
ast_packet_item *ami_get_packet_item(ast_packet *p, const char *key);

#endif /* _AMI_CORE_H */