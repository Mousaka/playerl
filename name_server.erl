-module(name_server).
-export([init/0, add/2, find/1, handle/2]).
-import(server1, [rpc/2, print/1]).

%%Starts new dictionary
init() -> dict:new().

%%adds post do dictionary
add(Name, Place) ->
	print("ADD:self="),
	print(self()), 
	rpc(name_server, {add, Name, Place}).

%find post
find(Name) -> rpc(name_server, {find, Name}).

%%callbacks
handle({add, Name, Place}, Dict) -> {ok, dict:store(Name, Place, Dict)};
handle({find, Name}, Dict) -> {dict:find(Name, Dict), Dict}.